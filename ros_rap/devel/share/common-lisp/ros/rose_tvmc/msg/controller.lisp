; Auto-generated. Do not edit!


(cl:in-package rose_tvmc-msg)


;//! \htmlinclude controller.msg.html

(cl:defclass <controller> (roslisp-msg-protocol:ros-message)
  ((vals
    :reader vals
    :initarg :vals
    :type rose_tvmc-msg:axes
    :initform (cl:make-instance 'rose_tvmc-msg:axes))
   (left_trigger
    :reader left_trigger
    :initarg :left_trigger
    :type cl:float
    :initform 0.0)
   (right_trigger
    :reader right_trigger
    :initarg :right_trigger
    :type cl:float
    :initform 0.0)
   (left_bumper
    :reader left_bumper
    :initarg :left_bumper
    :type cl:integer
    :initform 0)
   (right_bumper
    :reader right_bumper
    :initarg :right_bumper
    :type cl:integer
    :initform 0)
   (pitch_reset
    :reader pitch_reset
    :initarg :pitch_reset
    :type cl:integer
    :initform 0)
   (pitch_hold
    :reader pitch_hold
    :initarg :pitch_hold
    :type cl:integer
    :initform 0)
   (yaw_hold
    :reader yaw_hold
    :initarg :yaw_hold
    :type cl:integer
    :initform 0))
)

(cl:defclass controller (<controller>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controller>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controller)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc-msg:<controller> is deprecated: use rose_tvmc-msg:controller instead.")))

(cl:ensure-generic-function 'vals-val :lambda-list '(m))
(cl:defmethod vals-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:vals-val is deprecated.  Use rose_tvmc-msg:vals instead.")
  (vals m))

(cl:ensure-generic-function 'left_trigger-val :lambda-list '(m))
(cl:defmethod left_trigger-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:left_trigger-val is deprecated.  Use rose_tvmc-msg:left_trigger instead.")
  (left_trigger m))

(cl:ensure-generic-function 'right_trigger-val :lambda-list '(m))
(cl:defmethod right_trigger-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:right_trigger-val is deprecated.  Use rose_tvmc-msg:right_trigger instead.")
  (right_trigger m))

(cl:ensure-generic-function 'left_bumper-val :lambda-list '(m))
(cl:defmethod left_bumper-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:left_bumper-val is deprecated.  Use rose_tvmc-msg:left_bumper instead.")
  (left_bumper m))

(cl:ensure-generic-function 'right_bumper-val :lambda-list '(m))
(cl:defmethod right_bumper-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:right_bumper-val is deprecated.  Use rose_tvmc-msg:right_bumper instead.")
  (right_bumper m))

(cl:ensure-generic-function 'pitch_reset-val :lambda-list '(m))
(cl:defmethod pitch_reset-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:pitch_reset-val is deprecated.  Use rose_tvmc-msg:pitch_reset instead.")
  (pitch_reset m))

(cl:ensure-generic-function 'pitch_hold-val :lambda-list '(m))
(cl:defmethod pitch_hold-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:pitch_hold-val is deprecated.  Use rose_tvmc-msg:pitch_hold instead.")
  (pitch_hold m))

(cl:ensure-generic-function 'yaw_hold-val :lambda-list '(m))
(cl:defmethod yaw_hold-val ((m <controller>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:yaw_hold-val is deprecated.  Use rose_tvmc-msg:yaw_hold instead.")
  (yaw_hold m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controller>) ostream)
  "Serializes a message object of type '<controller>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vals) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_trigger))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_trigger))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'left_bumper)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_bumper)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pitch_reset)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pitch_hold)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yaw_hold)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controller>) istream)
  "Deserializes a message object of type '<controller>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vals) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_trigger) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_trigger) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_bumper) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_bumper) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pitch_reset) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pitch_hold) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yaw_hold) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controller>)))
  "Returns string type for a message object of type '<controller>"
  "rose_tvmc/controller")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controller)))
  "Returns string type for a message object of type 'controller"
  "rose_tvmc/controller")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controller>)))
  "Returns md5sum for a message object of type '<controller>"
  "74b3d4a3dd07d5b868ac6ae15eb0fe4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controller)))
  "Returns md5sum for a message object of type 'controller"
  "74b3d4a3dd07d5b868ac6ae15eb0fe4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controller>)))
  "Returns full string definition for message of type '<controller>"
  (cl:format cl:nil "axes vals~%float32 left_trigger~%float32 right_trigger~%int32 left_bumper~%int32 right_bumper~%int32 pitch_reset~%int32 pitch_hold~%int32 yaw_hold~%~%~%================================================================================~%MSG: rose_tvmc/axes~%float32 ax0~%float32 ax1~%float32 ax2~%float32 ax3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controller)))
  "Returns full string definition for message of type 'controller"
  (cl:format cl:nil "axes vals~%float32 left_trigger~%float32 right_trigger~%int32 left_bumper~%int32 right_bumper~%int32 pitch_reset~%int32 pitch_hold~%int32 yaw_hold~%~%~%================================================================================~%MSG: rose_tvmc/axes~%float32 ax0~%float32 ax1~%float32 ax2~%float32 ax3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controller>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vals))
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controller>))
  "Converts a ROS message object to a list"
  (cl:list 'controller
    (cl:cons ':vals (vals msg))
    (cl:cons ':left_trigger (left_trigger msg))
    (cl:cons ':right_trigger (right_trigger msg))
    (cl:cons ':left_bumper (left_bumper msg))
    (cl:cons ':right_bumper (right_bumper msg))
    (cl:cons ':pitch_reset (pitch_reset msg))
    (cl:cons ':pitch_hold (pitch_hold msg))
    (cl:cons ':yaw_hold (yaw_hold msg))
))
