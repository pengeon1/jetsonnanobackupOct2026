; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude Thrust.msg.html

(cl:defclass <Thrust> (roslisp-msg-protocol:ros-message)
  ((DoF
    :reader DoF
    :initarg :DoF
    :type cl:fixnum
    :initform 0)
   (Thrust
    :reader Thrust
    :initarg :Thrust
    :type cl:float
    :initform 0.0))
)

(cl:defclass Thrust (<Thrust>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Thrust>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Thrust)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<Thrust> is deprecated: use rose_tvmc_msg-msg:Thrust instead.")))

(cl:ensure-generic-function 'DoF-val :lambda-list '(m))
(cl:defmethod DoF-val ((m <Thrust>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:DoF-val is deprecated.  Use rose_tvmc_msg-msg:DoF instead.")
  (DoF m))

(cl:ensure-generic-function 'Thrust-val :lambda-list '(m))
(cl:defmethod Thrust-val ((m <Thrust>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Thrust-val is deprecated.  Use rose_tvmc_msg-msg:Thrust instead.")
  (Thrust m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Thrust>) ostream)
  "Serializes a message object of type '<Thrust>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Thrust))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Thrust>) istream)
  "Deserializes a message object of type '<Thrust>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Thrust) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Thrust>)))
  "Returns string type for a message object of type '<Thrust>"
  "rose_tvmc_msg/Thrust")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Thrust)))
  "Returns string type for a message object of type 'Thrust"
  "rose_tvmc_msg/Thrust")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Thrust>)))
  "Returns md5sum for a message object of type '<Thrust>"
  "ae40b7f50edb53b85f4ec460f5721260")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Thrust)))
  "Returns md5sum for a message object of type 'Thrust"
  "ae40b7f50edb53b85f4ec460f5721260")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Thrust>)))
  "Returns full string definition for message of type '<Thrust>"
  (cl:format cl:nil "~%# msg to set thrust for open loop control~%~%uint8 DoF~%~%float32 Thrust~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Thrust)))
  "Returns full string definition for message of type 'Thrust"
  (cl:format cl:nil "~%# msg to set thrust for open loop control~%~%uint8 DoF~%~%float32 Thrust~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Thrust>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Thrust>))
  "Converts a ROS message object to a list"
  (cl:list 'Thrust
    (cl:cons ':DoF (DoF msg))
    (cl:cons ':Thrust (Thrust msg))
))
