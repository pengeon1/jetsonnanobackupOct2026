#!/usr/bin/env python3
import time
import threading

import rospy
from std_msgs.msg import Float32
from geometry_msgs.msg import Vector3
from statemachine import StateMachine, State
from tvmc import MotionController, DoF, ControlMode

from rose_tvmc_msg.msg import LEDControl

SURGE_TIME = 5
YAW_TIME = 1.5
HEAVE_DOWN_TIME = 4
HEAVE_UP_TIME = 3

# globals
CURRENT_YAW = 0
START_YAW = 0
REVERSE_YAW = -1
DATA_SOURCE = "sensors"

HEAVE_KP = -40 #-90 # -160
HEAVE_KI = 0.09 #0
HEAVE_KD = 4.7 #0.47 #5.2 #-30
HEAVE_TARGET = 0.3 #0.25 #0.5
HEAVE_ACCEPTABLE_ERROR = 0.01
HEAVE_OFFSET = -0.11 #-0.16 #-4

PITCH_KP = -0.12 #-0.2 #10
PITCH_KI = 0.0015
PITCH_KD = 0.2 #0.15 #4
PITCH_TARGET = 0
PITCH_ACCEPTABLE_ERROR = 0.7 #1.5
PITCH_OFFSET = -0.5 #1 # this is new

ROLL_KP = 0.1 #0.15 #1
ROLL_KI = 0
ROLL_KD = 0.4
ROLL_TARGET = 0
ROLL_ACCEPTABLE_ERROR = 1.5

# YAW_KP = 0.4 #2
# YAW_KI = 0 #0.13
# YAW_KD = 0.3 #0.5
# YAW_TARGET = 0
# YAW_ACCEPTABLE_ERROR = 1.5
YAW_KP = 0#0.19
YAW_KI = 0#0.00 #0.12
YAW_KD = 0#0.1
YAW_TARGET = 0#0
YAW_ACCEPTABLE_ERROR = 0#1.5


class QualificationTask(StateMachine):
    wait_to_start = State(initial=True)
    initializing_sensors = State()
    heaving_down = State()
    heaving_up = State()
    surging_forward = State()
    yaw_90 = State()
    finished = State(final=True)

    start_initializing_sensors = wait_to_start.to(initializing_sensors)
    heave_down = initializing_sensors.to(heaving_down)
    surge_forward = heaving_down.to(surging_forward)
    yaw_90_after_surging = surging_forward.to(yaw_90)
    surging_after_yaw_90 = yaw_90.to(surging_forward)
    heave_up = surging_forward.to(heaving_up)
    finish = heaving_up.to(finished)

    def __init__(self):
        self.m = MotionController()
        self.orientation_sub = None
        self.depth_sub = None
        self.current_yaw = None
        self.current_depth = None
        self.timer = None
        self.count = 0

        super(QualificationTask, self).__init__()

    def on_enter_wait_to_start(self):
        print("Waiting to start.")
        self.m.start()
        time.sleep(0)
        self.start_initializing_sensors()

    def on_depth(self, depth: Float32):

        self.current_depth = depth.data
        # print(self.current_depth)
        # rospy.loginfo(f"Current Depth: {self.current_depth}")
        
        self.m.set_current_point(DoF.HEAVE, depth.data)
    
    def on_orientation(self, vec: Vector3):
        self.current_yaw = vec.z

        # Set current yaw in the motion controller
        self.m.set_current_point(DoF.YAW, vec.z)

    def on_enter_initializing_sensors(self):
        print("Initializing Sensors.")
        self.m.set_pid_constants(DoF.YAW, YAW_KP, YAW_KI, YAW_KD, YAW_ACCEPTABLE_ERROR)
        self.orientation_sub = rospy.Subscriber(
            f"/{DATA_SOURCE}/orientation", Vector3, self.on_orientation
        )
        self.depth_sub = rospy.Subscriber(f"/{DATA_SOURCE}/depth", Float32, self.on_depth)
        self.m.set_control_mode(DoF.HEAVE, ControlMode.OPEN_LOOP)
        self.heave_down()
        # self.surge_forward_directly()


    def timer_asynchd(self):
        print("Timer HD started")
        time.sleep(HEAVE_DOWN_TIME)
        self.m.set_control_mode(DoF.HEAVE, ControlMode.CLOSED_LOOP)
        self.timer=None
        self.surge_forward()

    def on_enter_heave_down(self):
        time.sleep(4)
        print("Heaving Down.")
        self.m.set_thrust(DoF.HEAVE, -50)
        if self.timer is None:
            self.timer = threading.Thread(target=self.timer_asynchd, daemon=True)
            self.timer.start()

    def on_exit_heave_down(self):
        print("Stopping Heave.")
        self.m.set_thrust(DoF.HEAVE, 0)
        self.m.set_control_mode(DoF.SURGE, ControlMode.OPEN_LOOP)
    

    def timer_asyncy(self):
        print("Timer Y started")
        time.sleep(YAW_TIME)
        self.m.set_control_mode(DoF.YAW, ControlMode.CLOSED_LOOP)
        self.timer=None
        self.surging_after_yaw_90()

    def on_enter_yaw_90(self):
        time.sleep(4)
        print("Attempting to yaw 90.")
        self.m.set_thrust(DoF.YAW, 50)
        if self.timer is None:
            self.timer = threading.Thread(target=self.timer_asyncy, daemon=True)
            self.timer.start()
    
    def on_exit_yaw_90(self):
        print("Stopping Yaw.")
        self.m.set_thrust(DoF.YAW, 0)
        # self.disable_pitch_pid()
        self.m.set_control_mode(DoF.SURGE, ControlMode.OPEN_LOOP)


    def timer_asyncs(self):
        print("Timer S started")
        time.sleep(SURGE_TIME)
        self.m.set_control_mode(DoF.SURGE, ControlMode.CLOSED_LOOP)
        self.count+=1
        self.timer=None
        if(self.count==4):
            self.heave_up()
        else:
            self.yaw_90_after_surging()
        
    def on_enter_surging_forward(self):
        #self.enable_pitch_pid()
        time.sleep(4)
        print("Surging forward")
        self.m.set_thrust(DoF.SURGE, 50)

        if self.timer is None:
            self.timer = threading.Thread(target=self.timer_asyncs, daemon=True)
            self.timer.start()

    def on_exit_surging_forward(self):
        print("Stopping Surge.")
        self.m.set_thrust(DoF.SURGE, 0)
        # self.disable_pitch_pid()
        self.m.set_control_mode(DoF.YAW, ControlMode.OPEN_LOOP)
       

    def timer_asynchu(self):
        print("Timer HU started")
        time.sleep(HEAVE_UP_TIME)
        self.finish()

    def on_enter_heave_up(self):
        time.sleep(4)
        self.m.set_control_mode(DoF.YAW, ControlMode.CLOSED_LOOP)
        print("Heaving up.")
        self.m.set_thrust(DoF.HEAVE, 50)
        if self.timer is None:
            self.timer = threading.Thread(target=self.timer_asynchu, daemon=True)
            self.timer.start()

    def on_exit_heave_up(self):
        print("Stopping Heave.")
        self.m.set_thrust(DoF.HEAVE, 0)


    def on_finished(self):
        print("Task Finished.")
        self.m.set_control_mode(DoF.HEAVE, ControlMode.CLOSED_LOOP)


if __name__ == "__main__":
    rospy.init_node("qualification_task")
    task = QualificationTask()
    rospy.spin()