;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::ControlMode)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'ControlMode (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::CONTROLMODE")
  (make-package "ROSE_TVMC_MSG::CONTROLMODE"))

(in-package "ROS")
;;//! \htmlinclude ControlMode.msg.html


(intern "*CLOSED_LOOP*" (find-package "ROSE_TVMC_MSG::CONTROLMODE"))
(shadow '*CLOSED_LOOP* (find-package "ROSE_TVMC_MSG::CONTROLMODE"))
(defconstant rose_tvmc_msg::ControlMode::*CLOSED_LOOP* 0)
(intern "*OPEN_LOOP*" (find-package "ROSE_TVMC_MSG::CONTROLMODE"))
(shadow '*OPEN_LOOP* (find-package "ROSE_TVMC_MSG::CONTROLMODE"))
(defconstant rose_tvmc_msg::ControlMode::*OPEN_LOOP* 1)

(defun rose_tvmc_msg::ControlMode-to-symbol (const)
  (cond
        ((= const 0) 'rose_tvmc_msg::ControlMode::*CLOSED_LOOP*)
        ((= const 1) 'rose_tvmc_msg::ControlMode::*OPEN_LOOP*)
        (t nil)))

(defclass rose_tvmc_msg::ControlMode
  :super ros::object
  :slots (_DoF _Mode ))

(defmethod rose_tvmc_msg::ControlMode
  (:init
   (&key
    ((:DoF __DoF) 0)
    ((:Mode __Mode) 0)
    )
   (send-super :init)
   (setq _DoF (round __DoF))
   (setq _Mode (round __Mode))
   self)
  (:DoF
   (&optional __DoF)
   (if __DoF (setq _DoF __DoF)) _DoF)
  (:Mode
   (&optional __Mode)
   (if __Mode (setq _Mode __Mode)) _Mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _DoF
    1
    ;; uint8 _Mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _DoF
       (write-byte _DoF s)
     ;; uint8 _Mode
       (write-byte _Mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _DoF
     (setq _DoF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _Mode
     (setq _Mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::ControlMode :md5sum-) "8dbf66ce34e76ccbdd459bf828229d49")
(setf (get rose_tvmc_msg::ControlMode :datatype-) "rose_tvmc_msg/ControlMode")
(setf (get rose_tvmc_msg::ControlMode :definition-)
      "
# used to set control type

uint8 CLOSED_LOOP = 0
uint8 OPEN_LOOP = 1

uint8 DoF
uint8 Mode

")



(provide :rose_tvmc_msg/ControlMode "8dbf66ce34e76ccbdd459bf828229d49")


