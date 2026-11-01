; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude CurrentPoint.msg.html

(cl:defclass <CurrentPoint> (roslisp-msg-protocol:ros-message)
  ((DoF
    :reader DoF
    :initarg :DoF
    :type cl:fixnum
    :initform 0)
   (Current
    :reader Current
    :initarg :Current
    :type cl:float
    :initform 0.0))
)

(cl:defclass CurrentPoint (<CurrentPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CurrentPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CurrentPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<CurrentPoint> is deprecated: use rose_tvmc_msg-msg:CurrentPoint instead.")))

(cl:ensure-generic-function 'DoF-val :lambda-list '(m))
(cl:defmethod DoF-val ((m <CurrentPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:DoF-val is deprecated.  Use rose_tvmc_msg-msg:DoF instead.")
  (DoF m))

(cl:ensure-generic-function 'Current-val :lambda-list '(m))
(cl:defmethod Current-val ((m <CurrentPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Current-val is deprecated.  Use rose_tvmc_msg-msg:Current instead.")
  (Current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CurrentPoint>) ostream)
  "Serializes a message object of type '<CurrentPoint>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CurrentPoint>) istream)
  "Deserializes a message object of type '<CurrentPoint>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Current) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CurrentPoint>)))
  "Returns string type for a message object of type '<CurrentPoint>"
  "rose_tvmc_msg/CurrentPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CurrentPoint)))
  "Returns string type for a message object of type 'CurrentPoint"
  "rose_tvmc_msg/CurrentPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CurrentPoint>)))
  "Returns md5sum for a message object of type '<CurrentPoint>"
  "76b78cb8d12895bbed908073bee7ad46")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CurrentPoint)))
  "Returns md5sum for a message object of type 'CurrentPoint"
  "76b78cb8d12895bbed908073bee7ad46")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CurrentPoint>)))
  "Returns full string definition for message of type '<CurrentPoint>"
  (cl:format cl:nil "~%# msg to set PID current point~%~%uint8 DoF~%~%float32 Current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CurrentPoint)))
  "Returns full string definition for message of type 'CurrentPoint"
  (cl:format cl:nil "~%# msg to set PID current point~%~%uint8 DoF~%~%float32 Current~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CurrentPoint>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CurrentPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'CurrentPoint
    (cl:cons ':DoF (DoF msg))
    (cl:cons ':Current (Current msg))
))
