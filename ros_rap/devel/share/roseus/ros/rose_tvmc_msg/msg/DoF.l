;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::DoF)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'DoF (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::DOF")
  (make-package "ROSE_TVMC_MSG::DOF"))

(in-package "ROS")
;;//! \htmlinclude DoF.msg.html


(intern "*SURGE*" (find-package "ROSE_TVMC_MSG::DOF"))
(shadow '*SURGE* (find-package "ROSE_TVMC_MSG::DOF"))
(defconstant rose_tvmc_msg::DoF::*SURGE* 0)
(intern "*SWAY*" (find-package "ROSE_TVMC_MSG::DOF"))
(shadow '*SWAY* (find-package "ROSE_TVMC_MSG::DOF"))
(defconstant rose_tvmc_msg::DoF::*SWAY* 1)
(intern "*HEAVE*" (find-package "ROSE_TVMC_MSG::DOF"))
(shadow '*HEAVE* (find-package "ROSE_TVMC_MSG::DOF"))
(defconstant rose_tvmc_msg::DoF::*HEAVE* 2)
(intern "*ROLL*" (find-package "ROSE_TVMC_MSG::DOF"))
(shadow '*ROLL* (find-package "ROSE_TVMC_MSG::DOF"))
(defconstant rose_tvmc_msg::DoF::*ROLL* 3)
(intern "*PITCH*" (find-package "ROSE_TVMC_MSG::DOF"))
(shadow '*PITCH* (find-package "ROSE_TVMC_MSG::DOF"))
(defconstant rose_tvmc_msg::DoF::*PITCH* 4)
(intern "*YAW*" (find-package "ROSE_TVMC_MSG::DOF"))
(shadow '*YAW* (find-package "ROSE_TVMC_MSG::DOF"))
(defconstant rose_tvmc_msg::DoF::*YAW* 5)

(defun rose_tvmc_msg::DoF-to-symbol (const)
  (cond
        ((= const 0) 'rose_tvmc_msg::DoF::*SURGE*)
        ((= const 1) 'rose_tvmc_msg::DoF::*SWAY*)
        ((= const 2) 'rose_tvmc_msg::DoF::*HEAVE*)
        ((= const 3) 'rose_tvmc_msg::DoF::*ROLL*)
        ((= const 4) 'rose_tvmc_msg::DoF::*PITCH*)
        ((= const 5) 'rose_tvmc_msg::DoF::*YAW*)
        (t nil)))

(defclass rose_tvmc_msg::DoF
  :super ros::object
  :slots ())

(defmethod rose_tvmc_msg::DoF
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get rose_tvmc_msg::DoF :md5sum-) "64f26c9f1200d4d44f88dfc98f9d202e")
(setf (get rose_tvmc_msg::DoF :datatype-) "rose_tvmc_msg/DoF")
(setf (get rose_tvmc_msg::DoF :definition-)
      "
# constants to use to represent degrees of freedom

uint8 SURGE = 0
uint8 SWAY = 1
uint8 HEAVE = 2
uint8 ROLL = 3
uint8 PITCH = 4
uint8 YAW = 5

")



(provide :rose_tvmc_msg/DoF "64f26c9f1200d4d44f88dfc98f9d202e")


