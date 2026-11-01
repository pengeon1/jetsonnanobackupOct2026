;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::CurrentPoint)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'CurrentPoint (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::CURRENTPOINT")
  (make-package "ROSE_TVMC_MSG::CURRENTPOINT"))

(in-package "ROS")
;;//! \htmlinclude CurrentPoint.msg.html


(defclass rose_tvmc_msg::CurrentPoint
  :super ros::object
  :slots (_DoF _Current ))

(defmethod rose_tvmc_msg::CurrentPoint
  (:init
   (&key
    ((:DoF __DoF) 0)
    ((:Current __Current) 0.0)
    )
   (send-super :init)
   (setq _DoF (round __DoF))
   (setq _Current (float __Current))
   self)
  (:DoF
   (&optional __DoF)
   (if __DoF (setq _DoF __DoF)) _DoF)
  (:Current
   (&optional __Current)
   (if __Current (setq _Current __Current)) _Current)
  (:serialization-length
   ()
   (+
    ;; uint8 _DoF
    1
    ;; float32 _Current
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DoF
       (write-byte _DoF s)
     ;; float32 _Current
       (sys::poke _Current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DoF
     (setq _DoF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Current
     (setq _Current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::CurrentPoint :md5sum-) "76b78cb8d12895bbed908073bee7ad46")
(setf (get rose_tvmc_msg::CurrentPoint :datatype-) "rose_tvmc_msg/CurrentPoint")
(setf (get rose_tvmc_msg::CurrentPoint :definition-)
      "
# msg to set PID current point

uint8 DoF

float32 Current

")



(provide :rose_tvmc_msg/CurrentPoint "76b78cb8d12895bbed908073bee7ad46")


