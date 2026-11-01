; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude Command.msg.html

(cl:defclass <Command> (roslisp-msg-protocol:ros-message)
  ((Command
    :reader Command
    :initarg :Command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Command (<Command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<Command> is deprecated: use rose_tvmc_msg-msg:Command instead.")))

(cl:ensure-generic-function 'Command-val :lambda-list '(m))
(cl:defmethod Command-val ((m <Command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Command-val is deprecated.  Use rose_tvmc_msg-msg:Command instead.")
  (Command m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Command>)))
    "Constants for message type '<Command>"
  '((:RESET_THRUSTERS . 0)
    (:REFRESH . 1)
    (:SHUT_DOWN . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Command)))
    "Constants for message type 'Command"
  '((:RESET_THRUSTERS . 0)
    (:REFRESH . 1)
    (:SHUT_DOWN . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Command>) ostream)
  "Serializes a message object of type '<Command>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Command)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Command>) istream)
  "Deserializes a message object of type '<Command>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Command)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Command>)))
  "Returns string type for a message object of type '<Command>"
  "rose_tvmc_msg/Command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Command)))
  "Returns string type for a message object of type 'Command"
  "rose_tvmc_msg/Command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Command>)))
  "Returns md5sum for a message object of type '<Command>"
  "69dfd90ba64f98112f4e8dae8687b678")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Command)))
  "Returns md5sum for a message object of type 'Command"
  "69dfd90ba64f98112f4e8dae8687b678")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Command>)))
  "Returns full string definition for message of type '<Command>"
  (cl:format cl:nil "~%~%# mesaage for misc commands~%~%uint8 RESET_THRUSTERS = 0~%uint8 REFRESH = 1~%uint8 SHUT_DOWN = 2~%~%uint8 Command~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Command)))
  "Returns full string definition for message of type 'Command"
  (cl:format cl:nil "~%~%# mesaage for misc commands~%~%uint8 RESET_THRUSTERS = 0~%uint8 REFRESH = 1~%uint8 SHUT_DOWN = 2~%~%uint8 Command~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Command>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Command>))
  "Converts a ROS message object to a list"
  (cl:list 'Command
    (cl:cons ':Command (Command msg))
))
