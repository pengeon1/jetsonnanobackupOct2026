;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc::sensor_data_msg)
  (if (not (find-package "ROSE_TVMC"))
    (make-package "ROSE_TVMC"))
  (shadow 'sensor_data_msg (find-package "ROSE_TVMC")))
(unless (find-package "ROSE_TVMC::SENSOR_DATA_MSG")
  (make-package "ROSE_TVMC::SENSOR_DATA_MSG"))

(in-package "ROS")
;;//! \htmlinclude sensor_data_msg.msg.html


(defclass rose_tvmc::sensor_data_msg
  :super ros::object
  :slots (_depth _yaw _pitch _roll ))

(defmethod rose_tvmc::sensor_data_msg
  (:init
   (&key
    ((:depth __depth) 0.0)
    ((:yaw __yaw) 0.0)
    ((:pitch __pitch) 0.0)
    ((:roll __roll) 0.0)
    )
   (send-super :init)
   (setq _depth (float __depth))
   (setq _yaw (float __yaw))
   (setq _pitch (float __pitch))
   (setq _roll (float __roll))
   self)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:serialization-length
   ()
   (+
    ;; float32 _depth
    4
    ;; float32 _yaw
    4
    ;; float32 _pitch
    4
    ;; float32 _roll
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc::sensor_data_msg :md5sum-) "843d06a79c410bbc60062b14e656ce9a")
(setf (get rose_tvmc::sensor_data_msg :datatype-) "rose_tvmc/sensor_data_msg")
(setf (get rose_tvmc::sensor_data_msg :definition-)
      "float32  depth
float32  yaw
float32  pitch
float32  roll

")



(provide :rose_tvmc/sensor_data_msg "843d06a79c410bbc60062b14e656ce9a")


