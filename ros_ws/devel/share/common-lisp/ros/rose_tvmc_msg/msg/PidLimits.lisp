; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude PidLimits.msg.html

(cl:defclass <PidLimits> (roslisp-msg-protocol:ros-message)
  ((DoF
    :reader DoF
    :initarg :DoF
    :type cl:fixnum
    :initform 0)
   (OutputMin
    :reader OutputMin
    :initarg :OutputMin
    :type cl:float
    :initform 0.0)
   (OutputMax
    :reader OutputMax
    :initarg :OutputMax
    :type cl:float
    :initform 0.0)
   (IntegralMin
    :reader IntegralMin
    :initarg :IntegralMin
    :type cl:float
    :initform 0.0)
   (IntegralMax
    :reader IntegralMax
    :initarg :IntegralMax
    :type cl:float
    :initform 0.0))
)

(cl:defclass PidLimits (<PidLimits>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PidLimits>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PidLimits)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<PidLimits> is deprecated: use rose_tvmc_msg-msg:PidLimits instead.")))

(cl:ensure-generic-function 'DoF-val :lambda-list '(m))
(cl:defmethod DoF-val ((m <PidLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:DoF-val is deprecated.  Use rose_tvmc_msg-msg:DoF instead.")
  (DoF m))

(cl:ensure-generic-function 'OutputMin-val :lambda-list '(m))
(cl:defmethod OutputMin-val ((m <PidLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:OutputMin-val is deprecated.  Use rose_tvmc_msg-msg:OutputMin instead.")
  (OutputMin m))

(cl:ensure-generic-function 'OutputMax-val :lambda-list '(m))
(cl:defmethod OutputMax-val ((m <PidLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:OutputMax-val is deprecated.  Use rose_tvmc_msg-msg:OutputMax instead.")
  (OutputMax m))

(cl:ensure-generic-function 'IntegralMin-val :lambda-list '(m))
(cl:defmethod IntegralMin-val ((m <PidLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:IntegralMin-val is deprecated.  Use rose_tvmc_msg-msg:IntegralMin instead.")
  (IntegralMin m))

(cl:ensure-generic-function 'IntegralMax-val :lambda-list '(m))
(cl:defmethod IntegralMax-val ((m <PidLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:IntegralMax-val is deprecated.  Use rose_tvmc_msg-msg:IntegralMax instead.")
  (IntegralMax m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PidLimits>) ostream)
  "Serializes a message object of type '<PidLimits>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'OutputMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'OutputMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'IntegralMin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'IntegralMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PidLimits>) istream)
  "Deserializes a message object of type '<PidLimits>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'OutputMin) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'OutputMax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'IntegralMin) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'IntegralMax) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PidLimits>)))
  "Returns string type for a message object of type '<PidLimits>"
  "rose_tvmc_msg/PidLimits")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PidLimits)))
  "Returns string type for a message object of type 'PidLimits"
  "rose_tvmc_msg/PidLimits")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PidLimits>)))
  "Returns md5sum for a message object of type '<PidLimits>"
  "27ce4f57b16098ce45a25e0685714b1b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PidLimits)))
  "Returns md5sum for a message object of type 'PidLimits"
  "27ce4f57b16098ce45a25e0685714b1b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PidLimits>)))
  "Returns full string definition for message of type '<PidLimits>"
  (cl:format cl:nil "~%# message to set pid limits~%~%uint8 DoF~%~%float32 OutputMin~%float32 OutputMax~%float32 IntegralMin~%float32 IntegralMax~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PidLimits)))
  "Returns full string definition for message of type 'PidLimits"
  (cl:format cl:nil "~%# message to set pid limits~%~%uint8 DoF~%~%float32 OutputMin~%float32 OutputMax~%float32 IntegralMin~%float32 IntegralMax~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PidLimits>))
  (cl:+ 0
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PidLimits>))
  "Converts a ROS message object to a list"
  (cl:list 'PidLimits
    (cl:cons ':DoF (DoF msg))
    (cl:cons ':OutputMin (OutputMin msg))
    (cl:cons ':OutputMax (OutputMax msg))
    (cl:cons ':IntegralMin (IntegralMin msg))
    (cl:cons ':IntegralMax (IntegralMax msg))
))
