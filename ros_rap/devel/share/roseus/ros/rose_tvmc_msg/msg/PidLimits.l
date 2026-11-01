;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::PidLimits)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'PidLimits (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::PIDLIMITS")
  (make-package "ROSE_TVMC_MSG::PIDLIMITS"))

(in-package "ROS")
;;//! \htmlinclude PidLimits.msg.html


(defclass rose_tvmc_msg::PidLimits
  :super ros::object
  :slots (_DoF _OutputMin _OutputMax _IntegralMin _IntegralMax ))

(defmethod rose_tvmc_msg::PidLimits
  (:init
   (&key
    ((:DoF __DoF) 0)
    ((:OutputMin __OutputMin) 0.0)
    ((:OutputMax __OutputMax) 0.0)
    ((:IntegralMin __IntegralMin) 0.0)
    ((:IntegralMax __IntegralMax) 0.0)
    )
   (send-super :init)
   (setq _DoF (round __DoF))
   (setq _OutputMin (float __OutputMin))
   (setq _OutputMax (float __OutputMax))
   (setq _IntegralMin (float __IntegralMin))
   (setq _IntegralMax (float __IntegralMax))
   self)
  (:DoF
   (&optional __DoF)
   (if __DoF (setq _DoF __DoF)) _DoF)
  (:OutputMin
   (&optional __OutputMin)
   (if __OutputMin (setq _OutputMin __OutputMin)) _OutputMin)
  (:OutputMax
   (&optional __OutputMax)
   (if __OutputMax (setq _OutputMax __OutputMax)) _OutputMax)
  (:IntegralMin
   (&optional __IntegralMin)
   (if __IntegralMin (setq _IntegralMin __IntegralMin)) _IntegralMin)
  (:IntegralMax
   (&optional __IntegralMax)
   (if __IntegralMax (setq _IntegralMax __IntegralMax)) _IntegralMax)
  (:serialization-length
   ()
   (+
    ;; uint8 _DoF
    1
    ;; float32 _OutputMin
    4
    ;; float32 _OutputMax
    4
    ;; float32 _IntegralMin
    4
    ;; float32 _IntegralMax
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DoF
       (write-byte _DoF s)
     ;; float32 _OutputMin
       (sys::poke _OutputMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _OutputMax
       (sys::poke _OutputMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _IntegralMin
       (sys::poke _IntegralMin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _IntegralMax
       (sys::poke _IntegralMax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DoF
     (setq _DoF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _OutputMin
     (setq _OutputMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _OutputMax
     (setq _OutputMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _IntegralMin
     (setq _IntegralMin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _IntegralMax
     (setq _IntegralMax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::PidLimits :md5sum-) "27ce4f57b16098ce45a25e0685714b1b")
(setf (get rose_tvmc_msg::PidLimits :datatype-) "rose_tvmc_msg/PidLimits")
(setf (get rose_tvmc_msg::PidLimits :definition-)
      "
# message to set pid limits

uint8 DoF

float32 OutputMin
float32 OutputMax
float32 IntegralMin
float32 IntegralMax



")



(provide :rose_tvmc_msg/PidLimits "27ce4f57b16098ce45a25e0685714b1b")


