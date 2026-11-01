; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude DoF.msg.html

(cl:defclass <DoF> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass DoF (<DoF>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DoF>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DoF)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<DoF> is deprecated: use rose_tvmc_msg-msg:DoF instead.")))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DoF>)))
    "Constants for message type '<DoF>"
  '((:SURGE . 0)
    (:SWAY . 1)
    (:HEAVE . 2)
    (:ROLL . 3)
    (:PITCH . 4)
    (:YAW . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DoF)))
    "Constants for message type 'DoF"
  '((:SURGE . 0)
    (:SWAY . 1)
    (:HEAVE . 2)
    (:ROLL . 3)
    (:PITCH . 4)
    (:YAW . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DoF>) ostream)
  "Serializes a message object of type '<DoF>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DoF>) istream)
  "Deserializes a message object of type '<DoF>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DoF>)))
  "Returns string type for a message object of type '<DoF>"
  "rose_tvmc_msg/DoF")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DoF)))
  "Returns string type for a message object of type 'DoF"
  "rose_tvmc_msg/DoF")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DoF>)))
  "Returns md5sum for a message object of type '<DoF>"
  "64f26c9f1200d4d44f88dfc98f9d202e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DoF)))
  "Returns md5sum for a message object of type 'DoF"
  "64f26c9f1200d4d44f88dfc98f9d202e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DoF>)))
  "Returns full string definition for message of type '<DoF>"
  (cl:format cl:nil "~%# constants to use to represent degrees of freedom~%~%uint8 SURGE = 0~%uint8 SWAY = 1~%uint8 HEAVE = 2~%uint8 ROLL = 3~%uint8 PITCH = 4~%uint8 YAW = 5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DoF)))
  "Returns full string definition for message of type 'DoF"
  (cl:format cl:nil "~%# constants to use to represent degrees of freedom~%~%uint8 SURGE = 0~%uint8 SWAY = 1~%uint8 HEAVE = 2~%uint8 ROLL = 3~%uint8 PITCH = 4~%uint8 YAW = 5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DoF>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DoF>))
  "Converts a ROS message object to a list"
  (cl:list 'DoF
))
