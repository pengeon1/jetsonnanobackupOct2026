#!/usr/bin/env python3
import rospy
from std_msgs.msg import Float32MultiArray, Int32MultiArray, String, Float32
from geometry_msgs.msg import Vector3
import tkinter as tk
from tkinter import ttk, messagebox
from tvmc import MotionController, DoF, ControlMode
from PIL import Image, ImageTk
import numpy as np
import cv2
import time
import os
import math
import collections
import datetime

# --- Constants from Interface.py ---
# HEAVE
HEAVE_TARGET_OFFSET = -0.14
HEAVE_KP = 90.0
HEAVE_KI = -5.0
HEAVE_KD = -50.0
HEAVE_TARGET = 0.33 - HEAVE_TARGET_OFFSET
HEAVE_ACCEPTABLE_ERROR = 0.05
HEAVE_OFFSET = 0.0

# PITCH
PITCH_TARGET_OFFSET = -5.0
PITCH_KP = 0.3
PITCH_KI = 0.0
PITCH_KD = 2.0
PITCH_TARGET = 180.0 - PITCH_TARGET_OFFSET
PITCH_ACCEPTABLE_ERROR = 1.0
PITCH_OFFSET = 0.0

# ROLL
ROLL_KP = 0.0
ROLL_KI = 0.0
ROLL_KD = 0.0
ROLL_TARGET = 3.0
ROLL_ACCEPTABLE_ERROR = 1.0

# YAW
YAW_TARGET_OFFSET = -7.3
YAW_KP = -2.0
YAW_KI = 0.02
YAW_KD = 12.0
YAW_TARGET = 161.0 - YAW_TARGET_OFFSET
YAW_ACCEPTABLE_ERROR = 0.05

DATA_SOURCE = "sensors"

class GUINode:
    def __init__(self):
        # Logging
        rospy.loginfo("Initializing Pecka GUI Node (ROS 1)...")

        self.cap1 = None
        self.cap2 = None
        
        # Camera 1 Setup
        self.cap1 = cv2.VideoCapture(1)
        if not self.cap1.isOpened():
            rospy.logwarn("Camera 1 not found!")
            self.cap1 = None
        else:
            self.configure_cam(self.cap1)

        # Camera 2 Setup
        self.cap2 = cv2.VideoCapture(0)
        if not self.cap2.isOpened():
            rospy.logwarn("Camera 2 not found!")
            self.cap2 = None
        else:
            self.configure_cam(self.cap2)

        self.qr_detector = cv2.QRCodeDetector()
        self.qr_detection_enabled = False
        self.gate_detection_enabled = False

        # Recording State
        self.is_recording = False
        self.video_writer1 = None
        self.video_writer2 = None

        # Initialize Motion Controller
        self.mc = MotionController()
        try:
            if hasattr(self.mc, "start_nodes"):
                self.mc.start_nodes()
            elif hasattr(self.mc, "start"):
                self.mc.start()
        except Exception as e:
            rospy.logwarn(f"MotionController start failed: {e}")

        self.diagnostics = {}
        self.last_image1 = None
        self.last_image2 = None
        self.last_info = {"h": 480, "w": 640, "c": 3}
        self.enabled_filters = set()
        
        # Initialize default diagnostics
        for dof in DoF:
            self.diagnostics[f"Thrust_{dof.name}"] = 0.0
        self.diagnostics["Depth"] = 0.0
        self.diagnostics["Roll"] = 0.0
        self.diagnostics["Pitch"] = 0.0
        self.diagnostics["Yaw"] = 0.0
        
        self.closed_loop_enabled = set()
        self.current_thrust_values = {dof: 0.0 for dof in DoF}
        self.active_dof = None

    def configure_cam(self, cap):
        cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
        cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
        cap.set(cv2.CAP_PROP_FPS, 30)

    def process_camera_frame(self):
        """Process a single camera frame and return it"""
        img1 = None
        img2 = None
        if self.cap1:
            ret, frame = self.cap1.read()
            if ret:
                img1 = frame # Keep BGR for writing/processing, convert to RGB for display later
                self.last_info = {"h": img1.shape[0], "w": img1.shape[1], "c": img1.shape[2]}
                if self.is_recording and self.video_writer1:
                    self.video_writer1.write(img1)
        if self.cap2:
            ret, frame = self.cap2.read()
            if ret:
                img2 = frame
                if self.is_recording and self.video_writer2:
                    self.video_writer2.write(img2)
        return img1, img2
    
    def start_recording(self):
        ts = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        fourcc = cv2.VideoWriter_fourcc(*'mp4v')
        
        # Get absolute path to user's home directory (e.g., /home/pi or /home/ubuntu)
        base_path = os.path.expanduser("~")
        
        if self.cap1:
            # Joins path: /home/user/cam1_2024...mp4
            p1 = os.path.join(base_path, f'cam1_{ts}.mp4')
            self.video_writer1 = cv2.VideoWriter(p1, fourcc, 20.0, (640, 480))
            rospy.loginfo(f"Saving Cam 1 to: {p1}")

        if self.cap2:
            p2 = os.path.join(base_path, f'cam2_{ts}.mp4')
            self.video_writer2 = cv2.VideoWriter(p2, fourcc, 20.0, (640, 480))
            rospy.loginfo(f"Saving Cam 2 to: {p2}")
        
        self.is_recording = True
        return f"Recording started: {ts}"

    def stop_recording(self):
        self.is_recording = False
        if self.video_writer1:
            self.video_writer1.release()
            self.video_writer1 = None
        if self.video_writer2:
            self.video_writer2.release()
            self.video_writer2 = None
        return "Recording stopped"

    def start_subscriptions(self):
        # ROS 1 Subscribers
        rospy.Subscriber("/rose_tvmc/thrust", Float32MultiArray, 
                          lambda msg: self._set_diag("Thrust", list(msg.data)))
        
        rospy.Subscriber("/control/pwm", Int32MultiArray, 
                          lambda msg: self._set_diag("PWM", list(msg.data)))
        
        rospy.Subscriber(f"/{DATA_SOURCE}/depth", Float32, self._depth_cb)
        
        rospy.Subscriber(f"/{DATA_SOURCE}/orientation", Vector3, self._orientation_cb)
        
        rospy.Subscriber(f"/{DATA_SOURCE}/linear_acceleration", Vector3,
                          lambda msg: self._set_diag("Linear Acceleration", (round(msg.x,2), round(msg.y,2), round(msg.z,2))))

    def _depth_cb(self, msg):
        data = float(msg.data)
        self.diagnostics["Depth"] = round(data, 3)
        self.mc.set_current_point(DoF.HEAVE, data)

    def _orientation_cb(self, msg):
        self.mc.set_current_point(DoF.ROLL, msg.x)
        self.mc.set_current_point(DoF.PITCH, msg.y)
        self.mc.set_current_point(DoF.YAW, msg.z)
        self.diagnostics["Roll"] = round(msg.x, 2)
        self.diagnostics["Pitch"] = round(msg.y, 2)
        self.diagnostics["Yaw"] = round(msg.z, 2)

    def _set_diag(self, name, data):
        self.diagnostics[name] = data

    def __del__(self):
        self.stop_recording()
        if self.cap1: self.cap1.release()
        if self.cap2: self.cap2.release()

class AppWindow:
    def __init__(self, root: tk.Tk, node: GUINode):
        self.root = root
        self.node = node
        self.colors = {
            "bg": "#F5F7FA", "nav": "#003A8C", "accent": "#007BFF",
            "card": "#FFFFFF", "muted": "#6B7280", "text": "#0B2545",
            "success": "#28a745", "danger": "#dc3545", "warning": "#ffc107"
        }

        # --- PID Variables ---
        # Heave
        self.pid_heave_on = tk.BooleanVar(value=False)
        self.heave_target = tk.DoubleVar(value=HEAVE_TARGET)
        
        # Pitch
        self.pid_pitch_on = tk.BooleanVar(value=False)
        self.pitch_target = tk.DoubleVar(value=PITCH_TARGET)
        
        # Roll
        self.pid_roll_on = tk.BooleanVar(value=False)
        self.roll_target = tk.DoubleVar(value=ROLL_TARGET)
        
        # Yaw
        self.pid_yaw_on = tk.BooleanVar(value=False)
        self.yaw_target = tk.DoubleVar(value=YAW_TARGET)

        # Detection Variables
        self.qr_var = tk.BooleanVar(value=False)
        self.gate_var = tk.BooleanVar(value=False)
        self.gate_target_mode = tk.StringVar(value="Both")
        self.latest_gate_detection = []
        
        # Color Calibration Variables (HSV)
        self.calib = {
            "red": {
                "h_min": tk.IntVar(value=0), "h_max": tk.IntVar(value=10),
                "s_min": tk.IntVar(value=70), "s_max": tk.IntVar(value=255),
                "v_min": tk.IntVar(value=50), "v_max": tk.IntVar(value=255),
                "h_min2": tk.IntVar(value=170), "h_max2": tk.IntVar(value=180) # Wrap around
            },
            "green": {
                "h_min": tk.IntVar(value=40), "h_max": tk.IntVar(value=85),
                "s_min": tk.IntVar(value=70), "s_max": tk.IntVar(value=255),
                "v_min": tk.IntVar(value=50), "v_max": tk.IntVar(value=255)
            }
        }
        
        self.filter_summary_var = tk.StringVar(value="Filters: —")
        self.status_var = tk.StringVar(value="Ready - ROS 1 Connected")
        self.record_var = tk.StringVar(value="Start Recording")
        
        self.qr_history = collections.deque(maxlen=10)
        self.filter_vars = {}
        self.filter_params = {
            "denoise_strength": tk.DoubleVar(value=10.0),
            "clahe_clip": tk.DoubleVar(value=2.0),
            "color_boost": tk.DoubleVar(value=1.3),
            "edge_low": tk.IntVar(value=100),
            "edge_high": tk.IntVar(value=200),
            "edge_thickness": tk.IntVar(value=1),
        }
        self.last_speed_change = 0.0
        self.last_toggle = 0.0
        self.pressed_keys = {}

        root.title("Pecka GUI — AUV Society IIITDM Kancheepuram")
        root.geometry("1600x800") # Increased default width for 640x480 side-by-side
        root.configure(bg=self.colors["bg"])
        
        root.bind("<Escape>", self.exit_fullscreen)
        root.bind("<KeyPress>", self._on_key_down)
        root.bind("<KeyRelease>", self._on_key_up)

        self._build_header()
        main_frame = tk.Frame(root, bg=self.colors["bg"])
        main_frame.pack(expand=True, fill=tk.BOTH, padx=12, pady=(8,12))
        
        self._build_camera_card(main_frame)
        self._build_controls_card(main_frame)

        status_bar = tk.Frame(root, bg=self.colors["card"], relief="flat", bd=1)
        status_bar.pack(fill=tk.X, side=tk.BOTTOM)
        tk.Label(status_bar, textvariable=self.status_var, bg=self.colors["card"], fg=self.colors["muted"],
                 font=("Segoe UI", 10)).pack(side=tk.TOP, padx=8, pady=4)
        
        tk.Label(status_bar, text="[WASD] Move | [UI] Pitch | [ZX] Heave/Depth | [QE] Roll | [H] Heave PID | [J] Pitch PID | [K] Roll PID | [L] Yaw PID", 
                 bg=self.colors["card"], fg=self.colors["muted"], font=("Segoe UI", 9)).pack(side=tk.TOP, padx=8, pady=4)

        self._tk_image1 = None
        self._tk_image2 = None
        self._last_drawn_time = 0.0
        self.update_interval_ms = 33 
        self.root.after(40, self._periodic_update)

    def _on_key_down(self, event):
        self.pressed_keys[event.keysym] = True
        now = time.time()
        
        # --- Speed Multiplier Controls (+ / -) ---
        global linear_speed_multiplier, angular_speed_multiplier
        
        # Increase Speed (Plus, Equal, or Numpad Add)
        if event.keysym in ['plus', 'equal', 'KP_Add']:
            linear_speed_multiplier = min(linear_speed_multiplier + 0.1, 5.0) # Cap at 5x
            angular_speed_multiplier = min(angular_speed_multiplier + 0.1, 5.0)
            self.status_var.set(f"Speed Multiplier Increased: {linear_speed_multiplier:.1f}x")

        # Decrease Speed (Minus, Underscore, or Numpad Subtract)
        elif event.keysym in ['minus', 'underscore', 'KP_Subtract']:
            linear_speed_multiplier = max(linear_speed_multiplier - 0.1, 0.1) # Floor at 0.1x
            angular_speed_multiplier = max(angular_speed_multiplier - 0.1, 0.1)
            self.status_var.set(f"Speed Multiplier Decreased: {linear_speed_multiplier:.1f}x")

        # --- PID Shortcuts ---
        if now - self.last_toggle > 0.5:
            k = event.keysym.lower()
            toggled = False
            if k == 'h':
                self.pid_heave_on.set(not self.pid_heave_on.get())
                self._on_pid_toggle(DoF.HEAVE)
                toggled = True
            elif k == 'j':
                self.pid_pitch_on.set(not self.pid_pitch_on.get())
                self._on_pid_toggle(DoF.PITCH)
                toggled = True
            elif k == 'k':
                self.pid_roll_on.set(not self.pid_roll_on.get())
                self._on_pid_toggle(DoF.ROLL)
                toggled = True
            elif k == 'l':
                self.pid_yaw_on.set(not self.pid_yaw_on.get())
                self._on_pid_toggle(DoF.YAW)
                toggled = True
            
            if toggled:
                self.last_toggle = now

    def _on_key_up(self, event):
        if event.keysym in self.pressed_keys:
            del self.pressed_keys[event.keysym]

    def _build_header(self):
        header = tk.Frame(self.root, bg=self.colors["nav"], height=64)
        header.pack(fill=tk.X, side=tk.TOP)
        header.pack_propagate(False)

        tk.Label(header, text="AUV SOCIETY", bg=self.colors["nav"],
                 fg="white", font=("Segoe UI", 18, "bold")).pack(side=tk.LEFT, padx=(12, 0))
        tk.Label(header, text="— Pecka Control", bg=self.colors["nav"],
                 fg="#A8C9FF", font=("Segoe UI", 14)).pack(side=tk.LEFT, padx=(0, 6))
        
        rec_btn = tk.Button(header, textvariable=self.record_var, command=self._toggle_recording,
                            bg=self.colors["danger"], fg="white", font=("Segoe UI", 10, "bold"), bd=0, padx=10)
        rec_btn.pack(side=tk.RIGHT, padx=12, pady=15)

    def _build_camera_card(self, parent):
        left = tk.Frame(parent, bg=self.colors["bg"])
        left.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        card = tk.Frame(left, bg=self.colors["card"], relief="raised", bd=1)
        card.pack(padx=8, pady=8, fill=tk.BOTH, expand=True)

        camera_frame = tk.Frame(card, bg=self.colors["card"])
        camera_frame.pack(padx=12, pady=12, fill=tk.BOTH, expand=True)

        # Force frames to exactly 640x480
        camera1_frame = tk.Frame(camera_frame, width=640, height=480, bg="black")
        camera1_frame.pack(side=tk.LEFT, padx=5, expand=False, fill=tk.NONE)
        camera1_frame.pack_propagate(False) # Do not let children resize this frame
        
        self.image_label1 = tk.Label(camera1_frame, bg="black")
        self.image_label1.pack(fill=tk.BOTH, expand=True)

        camera2_frame = tk.Frame(camera_frame, width=640, height=480, bg="black")
        camera2_frame.pack(side=tk.RIGHT, padx=5, expand=False, fill=tk.NONE)
        camera2_frame.pack_propagate(False) # Do not let children resize this frame
        
        self.image_label2 = tk.Label(camera2_frame, bg="black")
        self.image_label2.pack(fill=tk.BOTH, expand=True)

        # --- Dashboard (Telemetry) ---
        dash_row = tk.Frame(card, bg="#EFF3F8", height=40)
        dash_row.pack(fill=tk.X, padx=12, pady=(0,12))
        
        self.dash_labels = {}
        metrics = ["Depth", "Roll", "Pitch", "Yaw"]
        for m in metrics:
            f = tk.Frame(dash_row, bg="#EFF3F8")
            f.pack(side=tk.LEFT, fill=tk.Y, padx=20, pady=5)
            tk.Label(f, text=m.upper(), font=("Segoe UI", 8, "bold"), fg=self.colors["muted"], bg="#EFF3F8").pack(anchor="w")
            l = tk.Label(f, text="0.00", font=("Consolas", 14, "bold"), fg=self.colors["text"], bg="#EFF3F8")
            l.pack(anchor="w")
            self.dash_labels[m] = l

        tk.Label(dash_row, textvariable=self.filter_summary_var, bg="#EFF3F8",
                 fg=self.colors["muted"], font=("Segoe UI", 9)).pack(side=tk.RIGHT, padx=10, pady=10)

    def _build_controls_card(self, parent):
        right = tk.Frame(parent, bg=self.colors["bg"], width=380)
        right.pack(side=tk.RIGHT, fill=tk.Y, padx=(0,8), pady=8)

        # --- GATE STATUS ---
        self.gate_status_indicator = tk.Label(right, text="GATE DETECTION OFF", 
                                              bg=self.colors["card"], fg="#666", 
                                              font=("Segoe UI", 12, "bold"), relief="raised", bd=1, height=2)
        self.gate_status_indicator.pack(fill=tk.X, padx=6, pady=(6,0))

        # --- STABILITY CONTROL (PID) ---
        pcard = tk.LabelFrame(right, text="Stability Control (PID)", bg=self.colors["card"], 
                              font=("Segoe UI", 10, "bold"), padx=5, pady=5)
        pcard.pack(fill=tk.X, padx=6, pady=6)
        
        # Grid layout for PID controls
        # Heave (Keep Textbox)
        ttk.Checkbutton(pcard, text="Heave [H]", variable=self.pid_heave_on, command=lambda: self._on_pid_toggle(DoF.HEAVE)).grid(row=0, column=0, sticky="w")
        tk.Entry(pcard, textvariable=self.heave_target, width=6).grid(row=0, column=1, padx=5)
        ttk.Button(pcard, text="Set", width=4, command=lambda: self._update_pid_target(DoF.HEAVE)).grid(row=0, column=2)

        # Pitch (Remove Textbox)
        ttk.Checkbutton(pcard, text="Pitch [J]", variable=self.pid_pitch_on, command=lambda: self._on_pid_toggle(DoF.PITCH)).grid(row=1, column=0, sticky="w", columnspan=3)

        # Roll (Remove Textbox)
        ttk.Checkbutton(pcard, text="Roll [K]", variable=self.pid_roll_on, command=lambda: self._on_pid_toggle(DoF.ROLL)).grid(row=2, column=0, sticky="w", columnspan=3)

        # Yaw (Remove Textbox)
        ttk.Checkbutton(pcard, text="Yaw [L]", variable=self.pid_yaw_on, command=lambda: self._on_pid_toggle(DoF.YAW)).grid(row=3, column=0, sticky="w", columnspan=3)

        # --- VISION & CALIBRATION (Tabs) ---
        v_notebook = ttk.Notebook(right)
        v_notebook.pack(fill=tk.X, padx=6, pady=6)
        
        # Tab 1: Settings
        tab_sets = tk.Frame(v_notebook, bg=self.colors["card"])
        v_notebook.add(tab_sets, text="Settings")
        
        ttk.Checkbutton(tab_sets, text="QR Detection", variable=self.qr_var, command=self._on_qr_toggle).pack(anchor="w", padx=10, pady=5)
        ttk.Checkbutton(tab_sets, text="Gate Detection", variable=self.gate_var, command=self._on_gate_toggle).pack(anchor="w", padx=10, pady=5)
        
        # Filters Checks
        f_frame = tk.LabelFrame(tab_sets, text="Enable Filters", bg=self.colors["card"])
        f_frame.pack(fill=tk.X, padx=5, pady=5)
        filter_defs = [(0, "WB"), (1, "Denoise"), (2, "CLAHE"), (3, "Boost"), (4, "Edges")]
        for fid, name in filter_defs:
            var = tk.IntVar()
            self.filter_vars[fid] = var
            ttk.Checkbutton(f_frame, text=name, variable=var, 
                            command=lambda f=fid, v=var: self._on_filter_toggle(f, v)).pack(side=tk.LEFT, padx=2)
        
        # Filters Sliders (New)
        s_frame = tk.LabelFrame(tab_sets, text="Filter Params", bg=self.colors["card"])
        s_frame.pack(fill=tk.X, padx=5, pady=5)
        self._build_slider(s_frame, "Denoise", self.filter_params["denoise_strength"], 0.0, 30.0)
        self._build_slider(s_frame, "CLAHE Clip", self.filter_params["clahe_clip"], 0.0, 10.0)
        self._build_slider(s_frame, "Boost", self.filter_params["color_boost"], 1.0, 3.0)
        self._build_slider(s_frame, "Edge Low", self.filter_params["edge_low"], 0, 255)
        self._build_slider(s_frame, "Edge High", self.filter_params["edge_high"], 0, 255)
        self._build_slider(s_frame, "Edge Thick", self.filter_params["edge_thickness"], 1, 5)

        # Tab 2: Red Calibration
        tab_red = tk.Frame(v_notebook, bg=self.colors["card"])
        v_notebook.add(tab_red, text="Red Calib")
        self._build_slider(tab_red, "Hue Low", self.calib["red"]["h_min"], 0, 180)
        self._build_slider(tab_red, "Hue High", self.calib["red"]["h_max"], 0, 180)
        self._build_slider(tab_red, "Sat Low", self.calib["red"]["s_min"], 0, 255)
        self._build_slider(tab_red, "Val Low", self.calib["red"]["v_min"], 0, 255)

        # Tab 3: Green Calibration
        tab_green = tk.Frame(v_notebook, bg=self.colors["card"])
        v_notebook.add(tab_green, text="Green Calib")
        self._build_slider(tab_green, "Hue Low", self.calib["green"]["h_min"], 0, 180)
        self._build_slider(tab_green, "Hue High", self.calib["green"]["h_max"], 0, 180)
        self._build_slider(tab_green, "Sat Low", self.calib["green"]["s_min"], 0, 255)
        self._build_slider(tab_green, "Val Low", self.calib["green"]["v_min"], 0, 255)

        # --- DIAGNOSTICS LIST ---
        dcard = tk.LabelFrame(right, text="Raw Diagnostics", bg=self.colors["card"], font=("Segoe UI", 10, "bold"))
        dcard.pack(fill=tk.BOTH, expand=True, padx=6, pady=6)
        self.diag_text = tk.Text(dcard, width=40, height=10, bg="#EFF3F8", fg=self.colors["text"], font=("Consolas", 8))
        self.diag_text.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
        self.diag_text.configure(state=tk.DISABLED)

    def _build_slider(self, parent, label, variable, min_val, max_val):
        f = tk.Frame(parent, bg=self.colors["card"])
        f.pack(fill=tk.X, padx=5, pady=2)
        tk.Label(f, text=label, width=10, anchor="w", bg=self.colors["card"], font=("Segoe UI", 8)).pack(side=tk.LEFT)
        ttk.Scale(f, from_=min_val, to=max_val, variable=variable, orient="horizontal").pack(side=tk.LEFT, fill=tk.X, expand=True)
        # Check if variable is integer or float for formatting
        if isinstance(variable, tk.IntVar):
            tk.Label(f, textvariable=variable, width=4, bg=self.colors["card"], font=("Consolas", 8)).pack(side=tk.RIGHT)
        else:
            # Create a label that formats the float to 2 decimals
            lbl = tk.Label(f, text="0.00", width=4, bg=self.colors["card"], font=("Consolas", 8))
            lbl.pack(side=tk.RIGHT)
            # Trace the variable to update the label formatted
            def update_lbl(*args):
                try:
                    lbl.config(text=f"{variable.get():.1f}")
                except: pass
            variable.trace_add("write", update_lbl)
            update_lbl()

    def _toggle_recording(self):
        if not self.node.is_recording:
            msg = self.node.start_recording()
            self.record_var.set("Stop Recording")
            self.status_var.set(msg)
        else:
            msg = self.node.stop_recording()
            self.record_var.set("Start Recording")
            self.status_var.set(msg)

    def _on_pid_toggle(self, dof):
        is_on = False
        if dof == DoF.HEAVE:
            is_on = self.pid_heave_on.get()
            if is_on:
                self.node.mc.set_control_mode(DoF.HEAVE, ControlMode.CLOSED_LOOP)
                self.node.mc.set_pid_constants(DoF.HEAVE, HEAVE_KP, HEAVE_KI, HEAVE_KD, HEAVE_ACCEPTABLE_ERROR, HEAVE_OFFSET)
                self.node.mc.set_pid_limits(DoF.HEAVE, -10.0, 10.0, -25.0, 25.0)
                self.node.mc.set_target_point(DoF.HEAVE, self.heave_target.get())
                self.node.closed_loop_enabled.add(DoF.HEAVE)
            else:
                self._disable_pid(DoF.HEAVE)
        
        elif dof == DoF.PITCH:
            is_on = self.pid_pitch_on.get()
            if is_on:
                self.node.mc.set_control_mode(DoF.PITCH, ControlMode.CLOSED_LOOP)
                self.node.mc.set_pid_constants(DoF.PITCH, PITCH_KP, PITCH_KI, PITCH_KD, PITCH_ACCEPTABLE_ERROR)
                self.node.mc.set_pid_limits(DoF.PITCH, -10.0, 10.0, -25.0, 25.0)
                self.node.mc.set_target_point(DoF.PITCH, self.pitch_target.get())
                self.node.closed_loop_enabled.add(DoF.PITCH)
            else:
                self._disable_pid(DoF.PITCH)

        elif dof == DoF.ROLL:
            is_on = self.pid_roll_on.get()
            if is_on:
                self.node.mc.set_control_mode(DoF.ROLL, ControlMode.CLOSED_LOOP)
                self.node.mc.set_pid_constants(DoF.ROLL, ROLL_KP, ROLL_KI, ROLL_KD, ROLL_ACCEPTABLE_ERROR)
                self.node.mc.set_target_point(DoF.ROLL, self.roll_target.get())
                self.node.closed_loop_enabled.add(DoF.ROLL)
            else:
                self._disable_pid(DoF.ROLL)

        elif dof == DoF.YAW:
            is_on = self.pid_yaw_on.get()
            if is_on:
                self.node.mc.set_control_mode(DoF.YAW, ControlMode.CLOSED_LOOP)
                self.node.mc.set_pid_constants(DoF.YAW, YAW_KP, YAW_KI, YAW_KD, YAW_ACCEPTABLE_ERROR)
                self.node.mc.set_pid_limits(DoF.YAW, -10.0, 10.0, -25.0, 25.0)
                self.node.mc.set_target_point(DoF.YAW, self.yaw_target.get())
                self.node.closed_loop_enabled.add(DoF.YAW)
            else:
                self._disable_pid(DoF.YAW)
        
        self.root.focus_set()

    def _disable_pid(self, dof):
        self.node.mc.set_control_mode(dof, ControlMode.OPEN_LOOP)
        self.node.mc.set_thrust(dof, 0.0)
        self.node.closed_loop_enabled.discard(dof)
        self.node.diagnostics[f"Thrust_{dof.name}"] = 0.0

    def _update_pid_target(self, dof):
        if dof == DoF.HEAVE: val = self.heave_target.get()
        elif dof == DoF.PITCH: val = self.pitch_target.get()
        elif dof == DoF.ROLL: val = self.roll_target.get()
        elif dof == DoF.YAW: val = self.yaw_target.get()
        
        if dof in self.node.closed_loop_enabled:
            self.node.mc.set_target_point(dof, val)
            self.status_var.set(f"{dof.name} Target Updated: {val:.2f}")
        self.root.focus_set()

    def _on_qr_toggle(self):
        self.node.qr_detection_enabled = self.qr_var.get()

    def _on_gate_toggle(self):
        self.node.gate_detection_enabled = self.gate_var.get()

    def _on_filter_toggle(self, fid, var):
        if var.get(): self.node.enabled_filters.add(fid)
        else: self.node.enabled_filters.discard(fid)

    def _detect_gate(self, img_rgb):
        if not self.node.gate_detection_enabled:
            return img_rgb

        hsv = cv2.cvtColor(img_rgb, cv2.COLOR_RGB2HSV)
        
        # --- Red Detection ---
        r = self.calib["red"]
        lower1 = np.array([r["h_min"].get(), r["s_min"].get(), r["v_min"].get()])
        upper1 = np.array([r["h_max"].get(), r["s_max"].get(), r["v_max"].get()])
        # Red Wrap around
        lower2 = np.array([r["h_min2"].get(), r["s_min"].get(), r["v_min"].get()])
        upper2 = np.array([r["h_max2"].get(), r["s_max"].get(), r["v_max"].get()])
        
        mask_red = cv2.bitwise_or(cv2.inRange(hsv, lower1, upper1), cv2.inRange(hsv, lower2, upper2))
        mask_red = cv2.morphologyEx(mask_red, cv2.MORPH_OPEN, np.ones((5,5), np.uint8))
        
        contours, _ = cv2.findContours(mask_red, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        if contours:
            c = max(contours, key=cv2.contourArea)
            if cv2.contourArea(c) > 600:
                x, y, w, h = cv2.boundingRect(c)
                cv2.rectangle(img_rgb, (x, y), (x+w, y+h), (255, 0, 0), 3)
                cv2.putText(img_rgb, "RED", (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (255, 0, 0), 2)
                self.latest_gate_detection.append("Red")

        # --- Green Detection ---
        g = self.calib["green"]
        lower_g = np.array([g["h_min"].get(), g["s_min"].get(), g["v_min"].get()])
        upper_g = np.array([g["h_max"].get(), g["s_max"].get(), g["v_max"].get()])
        
        mask_green = cv2.inRange(hsv, lower_g, upper_g)
        mask_green = cv2.morphologyEx(mask_green, cv2.MORPH_OPEN, np.ones((5,5), np.uint8))
        
        contours, _ = cv2.findContours(mask_green, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        if contours:
            c = max(contours, key=cv2.contourArea)
            if cv2.contourArea(c) > 600:
                x, y, w, h = cv2.boundingRect(c)
                cv2.rectangle(img_rgb, (x, y), (x+w, y+h), (0, 255, 0), 3)
                cv2.putText(img_rgb, "GREEN", (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)
                self.latest_gate_detection.append("Green")
        
        return img_rgb
    
    def _detect_qr_codes(self, img):
        if not self.node.qr_detection_enabled: return img
        data, bbox, _ = self.node.qr_detector.detectAndDecode(img)
        if data and bbox is not None:
            bbox = bbox.astype(int)
            cv2.polylines(img, [bbox], isClosed=True, color=(255, 0, 0), thickness=4)
            cv2.putText(img, f"{data}", (bbox[0][0][0], bbox[0][0][1] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 0, 0), 2)
        return img

    def _process_image_pipeline(self, img_bgr):
        if img_bgr is None: return None
        # Convert BGR to RGB for filters? No, filters expect BGR usually, then convert to RGB at end
        # But existing code structure assumed RGB input. Let's fix.
        # process_camera_frame now returns BGR.
        
        # 1. Filters (Assuming implementation uses BGR)
        img_filtered_bgr = self._apply_visual_filters_bgr(img_bgr)
        img_rgb = cv2.cvtColor(img_filtered_bgr, cv2.COLOR_BGR2RGB)

        # 2. Gate
        img_rgb = self._detect_gate(img_rgb)
        
        # 3. QR
        img_rgb = self._detect_qr_codes(img_rgb)
        return img_rgb

    def _apply_visual_filters_bgr(self, bgr):
        if 0 in self.node.enabled_filters: # WB (Simple Gray World)
            lab = cv2.cvtColor(bgr, cv2.COLOR_BGR2LAB)
            l, a, b = cv2.split(lab)
            l = cv2.equalizeHist(l)
            lab = cv2.merge((l, a, b))
            bgr = cv2.cvtColor(lab, cv2.COLOR_LAB2BGR)
        if 1 in self.node.enabled_filters: # Denoise
            h = float(self.filter_params["denoise_strength"].get())
            bgr = cv2.fastNlMeansDenoisingColored(bgr, None, h, h, 7, 21)
        if 2 in self.node.enabled_filters: # CLAHE
            clip = float(self.filter_params["clahe_clip"].get())
            lab = cv2.cvtColor(bgr, cv2.COLOR_BGR2LAB)
            l, a, b = cv2.split(lab)
            clahe = cv2.createCLAHE(clipLimit=clip, tileGridSize=(8, 8))
            l = clahe.apply(l)
            lab = cv2.merge((l, a, b))
            bgr = cv2.cvtColor(lab, cv2.COLOR_LAB2BGR)
        if 3 in self.node.enabled_filters: # Boost
            alpha = float(self.filter_params["color_boost"].get())
            bgr = cv2.convertScaleAbs(bgr, alpha=alpha, beta=0)
        return bgr

    def update_thrust(self, dof, value):
        if abs(self.node.current_thrust_values[dof] - value) > 0.05: 
            self.node.mc.set_thrust(dof, value)
            self.node.current_thrust_values[dof] = value
            self.node.diagnostics[f"Thrust_{dof.name}"] = value
            self.node.active_dof = dof
            return True
        return False
    
    def stop_all_thrusts(self):
        for dof in DoF:
            if dof in self.node.closed_loop_enabled: continue
            if dof != self.node.active_dof and abs(self.node.current_thrust_values[dof]) > 0.1:
                self.node.mc.set_thrust(dof, 0.0)
                self.node.current_thrust_values[dof] = 0.0
                self.node.diagnostics[f"Thrust_{dof.name}"] = 0.0

    def _periodic_update(self):
        # 1. Update Camera Frames (Read from Node)
        try:
            raw1, raw2 = self.node.process_camera_frame()
            if raw1 is not None: self.node.last_image1 = raw1
            if raw2 is not None: self.node.last_image2 = raw2
        except Exception: pass

        # 2. Update GUI Text
        try:
            # Dashboard
            self.dash_labels["Depth"].config(text=f"{self.node.diagnostics.get('Depth', 0.0):.2f}")
            self.dash_labels["Roll"].config(text=f"{self.node.diagnostics.get('Roll', 0.0):.2f}")
            self.dash_labels["Pitch"].config(text=f"{self.node.diagnostics.get('Pitch', 0.0):.2f}")
            self.dash_labels["Yaw"].config(text=f"{self.node.diagnostics.get('Yaw', 0.0):.2f}")

            # Diagnostics List
            self.diag_text.configure(state=tk.NORMAL)
            self.diag_text.delete("1.0", tk.END)
            for k, v in sorted(self.node.diagnostics.items()):
                self.diag_text.insert(tk.END, f"{k}: {v}\n")
            self.diag_text.configure(state=tk.DISABLED)
            
            # Filter Summary
            filt = ", ".join([str(fid) for fid in sorted(self.node.enabled_filters)]) or "—"
            self.filter_summary_var.set(f"Filters: {filt}")
        except Exception: pass

        # 3. Render Images
        now = time.time()
        self.latest_gate_detection = []
        if now - self._last_drawn_time > 1.0/20.0:
            if self.node.last_image1 is not None:
                rgb1 = self._process_image_pipeline(self.node.last_image1.copy())
                # Resize to exact 640x480 resolution using older PIL constant
                img1 = ImageTk.PhotoImage(Image.fromarray(rgb1).resize((640, 480), Image.NEAREST))
                self.image_label1.configure(image=img1)
                self._tk_image1 = img1 
            
            if self.node.last_image2 is not None:
                rgb2 = self._process_image_pipeline(self.node.last_image2.copy())
                # Resize to exact 640x480 resolution using older PIL constant
                img2 = ImageTk.PhotoImage(Image.fromarray(rgb2).resize((640, 480), Image.NEAREST))
                self.image_label2.configure(image=img2)
                self._tk_image2 = img2 
                
            self._last_drawn_time = now

        # 4. Gate Indicator
        unique_gates = list(set(self.latest_gate_detection))
        if not self.gate_var.get():
             self.gate_status_indicator.configure(text="DETECTION OFF", bg="#E0E0E0", fg="#666")
        elif len(unique_gates) == 0:
            self.gate_status_indicator.configure(text="SCANNING...", bg="#E0E0E0", fg="black")
        elif "Red" in unique_gates:
            self.gate_status_indicator.configure(text="RED GATE FOUND", bg="#dc3545", fg="white")
        elif "Green" in unique_gates:
            self.gate_status_indicator.configure(text="GREEN GATE FOUND", bg="#28a745", fg="white")

        # 5. Control Logic
        global linear_speed_multiplier, angular_speed_multiplier
        potential = {}
        kb_thrust = 50.0 * linear_speed_multiplier
        kb_rot = 50.0 * angular_speed_multiplier

        # Surge
        if 'w' in self.pressed_keys: potential[DoF.SURGE] = kb_thrust
        elif 's' in self.pressed_keys: potential[DoF.SURGE] = -kb_thrust*0.5

        # Yaw
        if DoF.YAW not in self.node.closed_loop_enabled:
            if 'd' in self.pressed_keys: potential[DoF.YAW] = kb_rot
            elif 'a' in self.pressed_keys: potential[DoF.YAW] = -kb_rot

        # Pitch
        if DoF.PITCH not in self.node.closed_loop_enabled:
            if 'u' in self.pressed_keys: potential[DoF.PITCH] = kb_rot
            elif 'i' in self.pressed_keys: potential[DoF.PITCH] = -kb_rot
            
        # Roll
        if DoF.ROLL not in self.node.closed_loop_enabled:
            if 'q' in self.pressed_keys: potential[DoF.ROLL] = kb_thrust
            elif 'e' in self.pressed_keys: potential[DoF.ROLL] = -kb_thrust

        # Heave & Depth Control
        # If Heave PID is ON -> Z/X adjusts Target Depth
        if DoF.HEAVE in self.node.closed_loop_enabled:
            adjustment = 0.0
            if 'z' in self.pressed_keys: adjustment = 0.01  # Go Deeper
            elif 'x' in self.pressed_keys: adjustment = -0.01 # Go Shallower
            
            if adjustment != 0.0:
                current_target = self.heave_target.get()
                new_target = current_target + adjustment
                self.heave_target.set(new_target)
                self.node.mc.set_target_point(DoF.HEAVE, new_target)
                self.status_var.set(f"Adjusting Depth Target: {new_target:.2f}")

        # If Heave PID is OFF -> Z/X adjusts Manual Thrust
        else:
            if 'z' in self.pressed_keys: potential[DoF.HEAVE] = kb_thrust
            elif 'x' in self.pressed_keys: potential[DoF.HEAVE] = -kb_thrust

        # Apply Thrusts
        if potential:
            max_dof = max(potential, key=lambda d: abs(potential[d]))
            if (self.node.active_dof != max_dof or 
                abs(self.node.current_thrust_values[max_dof] - potential[max_dof]) > 0.1):
                self.stop_all_thrusts()
                self.update_thrust(max_dof, potential[max_dof])
        else:
            if self.node.active_dof is not None:
                self.update_thrust(self.node.active_dof, 0.0)
                self.node.active_dof = None
            self.stop_all_thrusts()

        self.root.after(self.update_interval_ms, self._periodic_update)

    def exit_fullscreen(self, event=None):
        self.root.attributes('-fullscreen', False)

node = None
linear_speed_multiplier = 1
angular_speed_multiplier = 1

def main():
    global node
    # rospy.init_node('pecka_gui_node', anonymous=True) # Un-comment if not handled by tvmc
    
    node = GUINode()
    node.start_subscriptions()
    
    root = tk.Tk()
    root.attributes('-fullscreen', True)
    app = AppWindow(root, node)
    
    try:
        root.mainloop()
    except KeyboardInterrupt:
        pass

if __name__ == "__main__":
    main()
