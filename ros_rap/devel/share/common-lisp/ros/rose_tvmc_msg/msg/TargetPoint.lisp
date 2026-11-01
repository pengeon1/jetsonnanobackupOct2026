; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude TargetPoint.msg.html

(cl:defclass <TargetPoint> (roslisp-msg-protocol:ros-message)
  ((DoF
    :reader DoF
    :initarg :DoF
    :type cl:fixnum
    :initform 0)
   (Target
    :reader Target
    :initarg :Target
    :type cl:float
    :initform 0.0))
)

(cl:defclass TargetPoint (<TargetPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TargetPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TargetPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<TargetPoint> is deprecated: use rose_tvmc_msg-msg:TargetPoint instead.")))

(cl:ensure-generic-function 'DoF-val :lambda-list '(m))
(cl:defmethod DoF-val ((m <TargetPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:DoF-val is deprecated.  Use rose_tvmc_msg-msg:DoF instead.")
  (DoF m))

(cl:ensure-generic-function 'Target-val :lambda-list '(m))
(cl:defmethod Target-val ((m <TargetPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Target-val is deprecated.  Use rose_tvmc_msg-msg:Target instead.")
  (Target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TargetPoint>) ostream)
  "Serializes a message object of type '<TargetPoint>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TargetPoint>) istream)
  "Deserializes a message object of type '<TargetPoint>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Target) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TargetPoint>)))
  "Returns string type for a message object of type '<TargetPoint>"
  "rose_tvmc_msg/TargetPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TargetPoint)))
  "Returns string type for a message object of type 'TargetPoint"
  "rose_tvmc_msg/TargetPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TargetPoint>)))
  "Returns md5sum for a message object of type '<TargetPoint>"
  "cfb3907c63490480e7c7aa145897923e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TargetPoint)))
  "Returns md5sum for a message object of type 'TargetPoint"
  "cfb3907c63490480e7c7aa145897923e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TargetPoint>)))
  "Returns full string definition for message of type '<TargetPoint>"
  (cl:format cl:nil "# msg to set PID target point~%~%uint8 DoF~%~%float32 Target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TargetPoint)))
  "Returns full string definition for message of type 'TargetPoint"
  (cl:format cl:nil "# msg to set PID target point~%~%uint8 DoF~%~%float32 Target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TargetPoint>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TargetPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'TargetPoint
    (cl:cons ':DoF (DoF msg))
    (cl:cons ':Target (Target msg))
))
