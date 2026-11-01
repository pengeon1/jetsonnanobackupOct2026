; Auto-generated. Do not edit!


(cl:in-package rose_tvmc-msg)


;//! \htmlinclude axes.msg.html

(cl:defclass <axes> (roslisp-msg-protocol:ros-message)
  ((ax0
    :reader ax0
    :initarg :ax0
    :type cl:float
    :initform 0.0)
   (ax1
    :reader ax1
    :initarg :ax1
    :type cl:float
    :initform 0.0)
   (ax2
    :reader ax2
    :initarg :ax2
    :type cl:float
    :initform 0.0)
   (ax3
    :reader ax3
    :initarg :ax3
    :type cl:float
    :initform 0.0))
)

(cl:defclass axes (<axes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <axes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'axes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc-msg:<axes> is deprecated: use rose_tvmc-msg:axes instead.")))

(cl:ensure-generic-function 'ax0-val :lambda-list '(m))
(cl:defmethod ax0-val ((m <axes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:ax0-val is deprecated.  Use rose_tvmc-msg:ax0 instead.")
  (ax0 m))

(cl:ensure-generic-function 'ax1-val :lambda-list '(m))
(cl:defmethod ax1-val ((m <axes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:ax1-val is deprecated.  Use rose_tvmc-msg:ax1 instead.")
  (ax1 m))

(cl:ensure-generic-function 'ax2-val :lambda-list '(m))
(cl:defmethod ax2-val ((m <axes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:ax2-val is deprecated.  Use rose_tvmc-msg:ax2 instead.")
  (ax2 m))

(cl:ensure-generic-function 'ax3-val :lambda-list '(m))
(cl:defmethod ax3-val ((m <axes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:ax3-val is deprecated.  Use rose_tvmc-msg:ax3 instead.")
  (ax3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <axes>) ostream)
  "Serializes a message object of type '<axes>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ax0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ax1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ax2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ax3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <axes>) istream)
  "Deserializes a message object of type '<axes>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ax0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ax1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ax2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ax3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<axes>)))
  "Returns string type for a message object of type '<axes>"
  "rose_tvmc/axes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'axes)))
  "Returns string type for a message object of type 'axes"
  "rose_tvmc/axes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<axes>)))
  "Returns md5sum for a message object of type '<axes>"
  "5c8a9eced0236eae16993854fc83c382")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'axes)))
  "Returns md5sum for a message object of type 'axes"
  "5c8a9eced0236eae16993854fc83c382")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<axes>)))
  "Returns full string definition for message of type '<axes>"
  (cl:format cl:nil "float32 ax0~%float32 ax1~%float32 ax2~%float32 ax3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'axes)))
  "Returns full string definition for message of type 'axes"
  (cl:format cl:nil "float32 ax0~%float32 ax1~%float32 ax2~%float32 ax3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <axes>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <axes>))
  "Converts a ROS message object to a list"
  (cl:list 'axes
    (cl:cons ':ax0 (ax0 msg))
    (cl:cons ':ax1 (ax1 msg))
    (cl:cons ':ax2 (ax2 msg))
    (cl:cons ':ax3 (ax3 msg))
))
