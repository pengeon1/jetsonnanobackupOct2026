; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude PidConstants.msg.html

(cl:defclass <PidConstants> (roslisp-msg-protocol:ros-message)
  ((DoF
    :reader DoF
    :initarg :DoF
    :type cl:fixnum
    :initform 0)
   (Kp
    :reader Kp
    :initarg :Kp
    :type cl:float
    :initform 0.0)
   (Ki
    :reader Ki
    :initarg :Ki
    :type cl:float
    :initform 0.0)
   (Kd
    :reader Kd
    :initarg :Kd
    :type cl:float
    :initform 0.0)
   (AcceptableError
    :reader AcceptableError
    :initarg :AcceptableError
    :type cl:float
    :initform 0.0)
   (Ko
    :reader Ko
    :initarg :Ko
    :type cl:float
    :initform 0.0))
)

(cl:defclass PidConstants (<PidConstants>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PidConstants>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PidConstants)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<PidConstants> is deprecated: use rose_tvmc_msg-msg:PidConstants instead.")))

(cl:ensure-generic-function 'DoF-val :lambda-list '(m))
(cl:defmethod DoF-val ((m <PidConstants>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:DoF-val is deprecated.  Use rose_tvmc_msg-msg:DoF instead.")
  (DoF m))

(cl:ensure-generic-function 'Kp-val :lambda-list '(m))
(cl:defmethod Kp-val ((m <PidConstants>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Kp-val is deprecated.  Use rose_tvmc_msg-msg:Kp instead.")
  (Kp m))

(cl:ensure-generic-function 'Ki-val :lambda-list '(m))
(cl:defmethod Ki-val ((m <PidConstants>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Ki-val is deprecated.  Use rose_tvmc_msg-msg:Ki instead.")
  (Ki m))

(cl:ensure-generic-function 'Kd-val :lambda-list '(m))
(cl:defmethod Kd-val ((m <PidConstants>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Kd-val is deprecated.  Use rose_tvmc_msg-msg:Kd instead.")
  (Kd m))

(cl:ensure-generic-function 'AcceptableError-val :lambda-list '(m))
(cl:defmethod AcceptableError-val ((m <PidConstants>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:AcceptableError-val is deprecated.  Use rose_tvmc_msg-msg:AcceptableError instead.")
  (AcceptableError m))

(cl:ensure-generic-function 'Ko-val :lambda-list '(m))
(cl:defmethod Ko-val ((m <PidConstants>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:Ko-val is deprecated.  Use rose_tvmc_msg-msg:Ko instead.")
  (Ko m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PidConstants>) ostream)
  "Serializes a message object of type '<PidConstants>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Kp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ki))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Kd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'AcceptableError))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Ko))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PidConstants>) istream)
  "Deserializes a message object of type '<PidConstants>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'DoF)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Kp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ki) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Kd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'AcceptableError) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Ko) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PidConstants>)))
  "Returns string type for a message object of type '<PidConstants>"
  "rose_tvmc_msg/PidConstants")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PidConstants)))
  "Returns string type for a message object of type 'PidConstants"
  "rose_tvmc_msg/PidConstants")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PidConstants>)))
  "Returns md5sum for a message object of type '<PidConstants>"
  "ab0837d7d3687bd9352e4861b8c19aae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PidConstants)))
  "Returns md5sum for a message object of type 'PidConstants"
  "ab0837d7d3687bd9352e4861b8c19aae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PidConstants>)))
  "Returns full string definition for message of type '<PidConstants>"
  (cl:format cl:nil "~%# message to set pid constants~%~%uint8 DoF~%~%float32 Kp~%float32 Ki~%float32 Kd~%~%float32 AcceptableError~%~%float32 Ko~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PidConstants)))
  "Returns full string definition for message of type 'PidConstants"
  (cl:format cl:nil "~%# message to set pid constants~%~%uint8 DoF~%~%float32 Kp~%float32 Ki~%float32 Kd~%~%float32 AcceptableError~%~%float32 Ko~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PidConstants>))
  (cl:+ 0
     1
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PidConstants>))
  "Converts a ROS message object to a list"
  (cl:list 'PidConstants
    (cl:cons ':DoF (DoF msg))
    (cl:cons ':Kp (Kp msg))
    (cl:cons ':Ki (Ki msg))
    (cl:cons ':Kd (Kd msg))
    (cl:cons ':AcceptableError (AcceptableError msg))
    (cl:cons ':Ko (Ko msg))
))
