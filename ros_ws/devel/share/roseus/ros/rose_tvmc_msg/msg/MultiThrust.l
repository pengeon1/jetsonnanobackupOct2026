;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::MultiThrust)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'MultiThrust (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::MULTITHRUST")
  (make-package "ROSE_TVMC_MSG::MULTITHRUST"))

(in-package "ROS")
;;//! \htmlinclude MultiThrust.msg.html


(defclass rose_tvmc_msg::MultiThrust
  :super ros::object
  :slots (_surge _sway _heave _roll _pitch _yaw ))

(defmethod rose_tvmc_msg::MultiThrust
  (:init
   (&key
    ((:surge __surge) 0.0)
    ((:sway __sway) 0.0)
    ((:heave __heave) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _surge (float __surge))
   (setq _sway (float __sway))
   (setq _heave (float __heave))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   self)
  (:surge
   (&optional __surge)
   (if __surge (setq _surge __surge)) _surge)
  (:sway
   (&optional __sway)
   (if __sway (setq _sway __sway)) _sway)
  (:heave
   (&optional __heave)
   (if __heave (setq _heave __heave)) _heave)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _surge
    4
    ;; float32 _sway
    4
    ;; float32 _heave
    4
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _surge
       (sys::poke _surge (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sway
       (sys::poke _sway (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heave
       (sys::poke _heave (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _surge
     (setq _surge (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sway
     (setq _sway (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heave
     (setq _heave (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::MultiThrust :md5sum-) "f11dfad4a1e1233988ef17df221cdc39")
(setf (get rose_tvmc_msg::MultiThrust :datatype-) "rose_tvmc_msg/MultiThrust")
(setf (get rose_tvmc_msg::MultiThrust :definition-)
      "float32 surge
float32 sway
float32 heave
float32 roll
float32 pitch
float32 yaw
")



(provide :rose_tvmc_msg/MultiThrust "f11dfad4a1e1233988ef17df221cdc39")


