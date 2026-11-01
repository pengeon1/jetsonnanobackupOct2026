;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::Thrust)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'Thrust (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::THRUST")
  (make-package "ROSE_TVMC_MSG::THRUST"))

(in-package "ROS")
;;//! \htmlinclude Thrust.msg.html


(defclass rose_tvmc_msg::Thrust
  :super ros::object
  :slots (_DoF _Thrust ))

(defmethod rose_tvmc_msg::Thrust
  (:init
   (&key
    ((:DoF __DoF) 0)
    ((:Thrust __Thrust) 0.0)
    )
   (send-super :init)
   (setq _DoF (round __DoF))
   (setq _Thrust (float __Thrust))
   self)
  (:DoF
   (&optional __DoF)
   (if __DoF (setq _DoF __DoF)) _DoF)
  (:Thrust
   (&optional __Thrust)
   (if __Thrust (setq _Thrust __Thrust)) _Thrust)
  (:serialization-length
   ()
   (+
    ;; uint8 _DoF
    1
    ;; float32 _Thrust
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DoF
       (write-byte _DoF s)
     ;; float32 _Thrust
       (sys::poke _Thrust (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DoF
     (setq _DoF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Thrust
     (setq _Thrust (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::Thrust :md5sum-) "ae40b7f50edb53b85f4ec460f5721260")
(setf (get rose_tvmc_msg::Thrust :datatype-) "rose_tvmc_msg/Thrust")
(setf (get rose_tvmc_msg::Thrust :definition-)
      "
# msg to set thrust for open loop control

uint8 DoF

float32 Thrust

")



(provide :rose_tvmc_msg/Thrust "ae40b7f50edb53b85f4ec460f5721260")


