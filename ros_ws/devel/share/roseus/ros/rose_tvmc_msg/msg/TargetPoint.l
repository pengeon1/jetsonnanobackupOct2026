;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::TargetPoint)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'TargetPoint (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::TARGETPOINT")
  (make-package "ROSE_TVMC_MSG::TARGETPOINT"))

(in-package "ROS")
;;//! \htmlinclude TargetPoint.msg.html


(defclass rose_tvmc_msg::TargetPoint
  :super ros::object
  :slots (_DoF _Target ))

(defmethod rose_tvmc_msg::TargetPoint
  (:init
   (&key
    ((:DoF __DoF) 0)
    ((:Target __Target) 0.0)
    )
   (send-super :init)
   (setq _DoF (round __DoF))
   (setq _Target (float __Target))
   self)
  (:DoF
   (&optional __DoF)
   (if __DoF (setq _DoF __DoF)) _DoF)
  (:Target
   (&optional __Target)
   (if __Target (setq _Target __Target)) _Target)
  (:serialization-length
   ()
   (+
    ;; uint8 _DoF
    1
    ;; float32 _Target
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DoF
       (write-byte _DoF s)
     ;; float32 _Target
       (sys::poke _Target (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DoF
     (setq _DoF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Target
     (setq _Target (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::TargetPoint :md5sum-) "cfb3907c63490480e7c7aa145897923e")
(setf (get rose_tvmc_msg::TargetPoint :datatype-) "rose_tvmc_msg/TargetPoint")
(setf (get rose_tvmc_msg::TargetPoint :definition-)
      "# msg to set PID target point

uint8 DoF

float32 Target

")



(provide :rose_tvmc_msg/TargetPoint "cfb3907c63490480e7c7aa145897923e")


