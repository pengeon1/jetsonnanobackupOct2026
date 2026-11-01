; Auto-generated. Do not edit!


(cl:in-package rose_tvmc-msg)


;//! \htmlinclude motion_command_msg.msg.html

(cl:defclass <motion_command_msg> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:fixnum
    :initform 0))
)

(cl:defclass motion_command_msg (<motion_command_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motion_command_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motion_command_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc-msg:<motion_command_msg> is deprecated: use rose_tvmc-msg:motion_command_msg instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <motion_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:command-val is deprecated.  Use rose_tvmc-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <motion_command_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:angle-val is deprecated.  Use rose_tvmc-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motion_command_msg>) ostream)
  "Serializes a message object of type '<motion_command_msg>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motion_command_msg>) istream)
  "Deserializes a message object of type '<motion_command_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motion_command_msg>)))
  "Returns string type for a message object of type '<motion_command_msg>"
  "rose_tvmc/motion_command_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motion_command_msg)))
  "Returns string type for a message object of type 'motion_command_msg"
  "rose_tvmc/motion_command_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motion_command_msg>)))
  "Returns md5sum for a message object of type '<motion_command_msg>"
  "c5114ba45b42d6bb0cb680791df349c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motion_command_msg)))
  "Returns md5sum for a message object of type 'motion_command_msg"
  "c5114ba45b42d6bb0cb680791df349c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motion_command_msg>)))
  "Returns full string definition for message of type '<motion_command_msg>"
  (cl:format cl:nil "int8 command~%int16 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motion_command_msg)))
  "Returns full string definition for message of type 'motion_command_msg"
  (cl:format cl:nil "int8 command~%int16 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motion_command_msg>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motion_command_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'motion_command_msg
    (cl:cons ':command (command msg))
    (cl:cons ':angle (angle msg))
))
