;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc::motion_command_msg)
  (if (not (find-package "ROSE_TVMC"))
    (make-package "ROSE_TVMC"))
  (shadow 'motion_command_msg (find-package "ROSE_TVMC")))
(unless (find-package "ROSE_TVMC::MOTION_COMMAND_MSG")
  (make-package "ROSE_TVMC::MOTION_COMMAND_MSG"))

(in-package "ROS")
;;//! \htmlinclude motion_command_msg.msg.html


(defclass rose_tvmc::motion_command_msg
  :super ros::object
  :slots (_command _angle ))

(defmethod rose_tvmc::motion_command_msg
  (:init
   (&key
    ((:command __command) 0)
    ((:angle __angle) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   (setq _angle (round __angle))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; int8 _command
    1
    ;; int16 _angle
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _command
       (write-byte _command s)
     ;; int16 _angle
       (write-word _angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _command 127) (setq _command (- _command 256)))
   ;; int16 _angle
     (setq _angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get rose_tvmc::motion_command_msg :md5sum-) "c5114ba45b42d6bb0cb680791df349c7")
(setf (get rose_tvmc::motion_command_msg :datatype-) "rose_tvmc/motion_command_msg")
(setf (get rose_tvmc::motion_command_msg :definition-)
      "int8 command
int16 angle

")



(provide :rose_tvmc/motion_command_msg "c5114ba45b42d6bb0cb680791df349c7")


