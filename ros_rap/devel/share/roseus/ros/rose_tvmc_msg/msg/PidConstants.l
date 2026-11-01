;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::PidConstants)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'PidConstants (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::PIDCONSTANTS")
  (make-package "ROSE_TVMC_MSG::PIDCONSTANTS"))

(in-package "ROS")
;;//! \htmlinclude PidConstants.msg.html


(defclass rose_tvmc_msg::PidConstants
  :super ros::object
  :slots (_DoF _Kp _Ki _Kd _AcceptableError _Ko ))

(defmethod rose_tvmc_msg::PidConstants
  (:init
   (&key
    ((:DoF __DoF) 0)
    ((:Kp __Kp) 0.0)
    ((:Ki __Ki) 0.0)
    ((:Kd __Kd) 0.0)
    ((:AcceptableError __AcceptableError) 0.0)
    ((:Ko __Ko) 0.0)
    )
   (send-super :init)
   (setq _DoF (round __DoF))
   (setq _Kp (float __Kp))
   (setq _Ki (float __Ki))
   (setq _Kd (float __Kd))
   (setq _AcceptableError (float __AcceptableError))
   (setq _Ko (float __Ko))
   self)
  (:DoF
   (&optional __DoF)
   (if __DoF (setq _DoF __DoF)) _DoF)
  (:Kp
   (&optional __Kp)
   (if __Kp (setq _Kp __Kp)) _Kp)
  (:Ki
   (&optional __Ki)
   (if __Ki (setq _Ki __Ki)) _Ki)
  (:Kd
   (&optional __Kd)
   (if __Kd (setq _Kd __Kd)) _Kd)
  (:AcceptableError
   (&optional __AcceptableError)
   (if __AcceptableError (setq _AcceptableError __AcceptableError)) _AcceptableError)
  (:Ko
   (&optional __Ko)
   (if __Ko (setq _Ko __Ko)) _Ko)
  (:serialization-length
   ()
   (+
    ;; uint8 _DoF
    1
    ;; float32 _Kp
    4
    ;; float32 _Ki
    4
    ;; float32 _Kd
    4
    ;; float32 _AcceptableError
    4
    ;; float32 _Ko
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DoF
       (write-byte _DoF s)
     ;; float32 _Kp
       (sys::poke _Kp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Ki
       (sys::poke _Ki (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Kd
       (sys::poke _Kd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _AcceptableError
       (sys::poke _AcceptableError (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Ko
       (sys::poke _Ko (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DoF
     (setq _DoF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Kp
     (setq _Kp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Ki
     (setq _Ki (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Kd
     (setq _Kd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _AcceptableError
     (setq _AcceptableError (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Ko
     (setq _Ko (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::PidConstants :md5sum-) "ab0837d7d3687bd9352e4861b8c19aae")
(setf (get rose_tvmc_msg::PidConstants :datatype-) "rose_tvmc_msg/PidConstants")
(setf (get rose_tvmc_msg::PidConstants :definition-)
      "
# message to set pid constants

uint8 DoF

float32 Kp
float32 Ki
float32 Kd

float32 AcceptableError

float32 Ko

")



(provide :rose_tvmc_msg/PidConstants "ab0837d7d3687bd9352e4861b8c19aae")


