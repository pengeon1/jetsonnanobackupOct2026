;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::Command)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'Command (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::COMMAND")
  (make-package "ROSE_TVMC_MSG::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude Command.msg.html


(intern "*RESET_THRUSTERS*" (find-package "ROSE_TVMC_MSG::COMMAND"))
(shadow '*RESET_THRUSTERS* (find-package "ROSE_TVMC_MSG::COMMAND"))
(defconstant rose_tvmc_msg::Command::*RESET_THRUSTERS* 0)
(intern "*REFRESH*" (find-package "ROSE_TVMC_MSG::COMMAND"))
(shadow '*REFRESH* (find-package "ROSE_TVMC_MSG::COMMAND"))
(defconstant rose_tvmc_msg::Command::*REFRESH* 1)
(intern "*SHUT_DOWN*" (find-package "ROSE_TVMC_MSG::COMMAND"))
(shadow '*SHUT_DOWN* (find-package "ROSE_TVMC_MSG::COMMAND"))
(defconstant rose_tvmc_msg::Command::*SHUT_DOWN* 2)

(defun rose_tvmc_msg::Command-to-symbol (const)
  (cond
        ((= const 0) 'rose_tvmc_msg::Command::*RESET_THRUSTERS*)
        ((= const 1) 'rose_tvmc_msg::Command::*REFRESH*)
        ((= const 2) 'rose_tvmc_msg::Command::*SHUT_DOWN*)
        (t nil)))

(defclass rose_tvmc_msg::Command
  :super ros::object
  :slots (_Command ))

(defmethod rose_tvmc_msg::Command
  (:init
   (&key
    ((:Command __Command) 0)
    )
   (send-super :init)
   (setq _Command (round __Command))
   self)
  (:Command
   (&optional __Command)
   (if __Command (setq _Command __Command)) _Command)
  (:serialization-length
   ()
   (+
    ;; uint8 _Command
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _Command
       (write-byte _Command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _Command
     (setq _Command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::Command :md5sum-) "69dfd90ba64f98112f4e8dae8687b678")
(setf (get rose_tvmc_msg::Command :datatype-) "rose_tvmc_msg/Command")
(setf (get rose_tvmc_msg::Command :definition-)
      "

# mesaage for misc commands

uint8 RESET_THRUSTERS = 0
uint8 REFRESH = 1
uint8 SHUT_DOWN = 2

uint8 Command


")



(provide :rose_tvmc_msg/Command "69dfd90ba64f98112f4e8dae8687b678")


