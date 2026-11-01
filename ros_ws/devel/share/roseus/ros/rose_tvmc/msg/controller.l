;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc::controller)
  (if (not (find-package "ROSE_TVMC"))
    (make-package "ROSE_TVMC"))
  (shadow 'controller (find-package "ROSE_TVMC")))
(unless (find-package "ROSE_TVMC::CONTROLLER")
  (make-package "ROSE_TVMC::CONTROLLER"))

(in-package "ROS")
;;//! \htmlinclude controller.msg.html


(defclass rose_tvmc::controller
  :super ros::object
  :slots (_vals _left_trigger _right_trigger _left_bumper _right_bumper _pitch_reset _pitch_hold _yaw_hold ))

(defmethod rose_tvmc::controller
  (:init
   (&key
    ((:vals __vals) (instance rose_tvmc::axes :init))
    ((:left_trigger __left_trigger) 0.0)
    ((:right_trigger __right_trigger) 0.0)
    ((:left_bumper __left_bumper) 0)
    ((:right_bumper __right_bumper) 0)
    ((:pitch_reset __pitch_reset) 0)
    ((:pitch_hold __pitch_hold) 0)
    ((:yaw_hold __yaw_hold) 0)
    )
   (send-super :init)
   (setq _vals __vals)
   (setq _left_trigger (float __left_trigger))
   (setq _right_trigger (float __right_trigger))
   (setq _left_bumper (round __left_bumper))
   (setq _right_bumper (round __right_bumper))
   (setq _pitch_reset (round __pitch_reset))
   (setq _pitch_hold (round __pitch_hold))
   (setq _yaw_hold (round __yaw_hold))
   self)
  (:vals
   (&rest __vals)
   (if (keywordp (car __vals))
       (send* _vals __vals)
     (progn
       (if __vals (setq _vals (car __vals)))
       _vals)))
  (:left_trigger
   (&optional __left_trigger)
   (if __left_trigger (setq _left_trigger __left_trigger)) _left_trigger)
  (:right_trigger
   (&optional __right_trigger)
   (if __right_trigger (setq _right_trigger __right_trigger)) _right_trigger)
  (:left_bumper
   (&optional __left_bumper)
   (if __left_bumper (setq _left_bumper __left_bumper)) _left_bumper)
  (:right_bumper
   (&optional __right_bumper)
   (if __right_bumper (setq _right_bumper __right_bumper)) _right_bumper)
  (:pitch_reset
   (&optional __pitch_reset)
   (if __pitch_reset (setq _pitch_reset __pitch_reset)) _pitch_reset)
  (:pitch_hold
   (&optional __pitch_hold)
   (if __pitch_hold (setq _pitch_hold __pitch_hold)) _pitch_hold)
  (:yaw_hold
   (&optional __yaw_hold)
   (if __yaw_hold (setq _yaw_hold __yaw_hold)) _yaw_hold)
  (:serialization-length
   ()
   (+
    ;; rose_tvmc/axes _vals
    (send _vals :serialization-length)
    ;; float32 _left_trigger
    4
    ;; float32 _right_trigger
    4
    ;; int32 _left_bumper
    4
    ;; int32 _right_bumper
    4
    ;; int32 _pitch_reset
    4
    ;; int32 _pitch_hold
    4
    ;; int32 _yaw_hold
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; rose_tvmc/axes _vals
       (send _vals :serialize s)
     ;; float32 _left_trigger
       (sys::poke _left_trigger (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_trigger
       (sys::poke _right_trigger (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _left_bumper
       (write-long _left_bumper s)
     ;; int32 _right_bumper
       (write-long _right_bumper s)
     ;; int32 _pitch_reset
       (write-long _pitch_reset s)
     ;; int32 _pitch_hold
       (write-long _pitch_hold s)
     ;; int32 _yaw_hold
       (write-long _yaw_hold s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; rose_tvmc/axes _vals
     (send _vals :deserialize buf ptr-) (incf ptr- (send _vals :serialization-length))
   ;; float32 _left_trigger
     (setq _left_trigger (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_trigger
     (setq _right_trigger (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _left_bumper
     (setq _left_bumper (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _right_bumper
     (setq _right_bumper (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pitch_reset
     (setq _pitch_reset (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pitch_hold
     (setq _pitch_hold (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _yaw_hold
     (setq _yaw_hold (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc::controller :md5sum-) "74b3d4a3dd07d5b868ac6ae15eb0fe4b")
(setf (get rose_tvmc::controller :datatype-) "rose_tvmc/controller")
(setf (get rose_tvmc::controller :definition-)
      "axes vals
float32 left_trigger
float32 right_trigger
int32 left_bumper
int32 right_bumper
int32 pitch_reset
int32 pitch_hold
int32 yaw_hold


================================================================================
MSG: rose_tvmc/axes
float32 ax0
float32 ax1
float32 ax2
float32 ax3

")



(provide :rose_tvmc/controller "74b3d4a3dd07d5b868ac6ae15eb0fe4b")


