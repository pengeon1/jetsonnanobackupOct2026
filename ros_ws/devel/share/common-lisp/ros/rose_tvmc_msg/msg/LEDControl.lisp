; Auto-generated. Do not edit!


(cl:in-package rose_tvmc_msg-msg)


;//! \htmlinclude LEDControl.msg.html

(cl:defclass <LEDControl> (roslisp-msg-protocol:ros-message)
  ((led
    :reader led
    :initarg :led
    :type cl:fixnum
    :initform 0)
   (R
    :reader R
    :initarg :R
    :type cl:fixnum
    :initform 0)
   (G
    :reader G
    :initarg :G
    :type cl:fixnum
    :initform 0)
   (B
    :reader B
    :initarg :B
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LEDControl (<LEDControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LEDControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LEDControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc_msg-msg:<LEDControl> is deprecated: use rose_tvmc_msg-msg:LEDControl instead.")))

(cl:ensure-generic-function 'led-val :lambda-list '(m))
(cl:defmethod led-val ((m <LEDControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:led-val is deprecated.  Use rose_tvmc_msg-msg:led instead.")
  (led m))

(cl:ensure-generic-function 'R-val :lambda-list '(m))
(cl:defmethod R-val ((m <LEDControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:R-val is deprecated.  Use rose_tvmc_msg-msg:R instead.")
  (R m))

(cl:ensure-generic-function 'G-val :lambda-list '(m))
(cl:defmethod G-val ((m <LEDControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:G-val is deprecated.  Use rose_tvmc_msg-msg:G instead.")
  (G m))

(cl:ensure-generic-function 'B-val :lambda-list '(m))
(cl:defmethod B-val ((m <LEDControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc_msg-msg:B-val is deprecated.  Use rose_tvmc_msg-msg:B instead.")
  (B m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LEDControl>) ostream)
  "Serializes a message object of type '<LEDControl>"
  (cl:let* ((signed (cl:slot-value msg 'led)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'R)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'G)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LEDControl>) istream)
  "Deserializes a message object of type '<LEDControl>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'led) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'R) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'G) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LEDControl>)))
  "Returns string type for a message object of type '<LEDControl>"
  "rose_tvmc_msg/LEDControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LEDControl)))
  "Returns string type for a message object of type 'LEDControl"
  "rose_tvmc_msg/LEDControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LEDControl>)))
  "Returns md5sum for a message object of type '<LEDControl>"
  "bff20060035fd92aac543c3a175d7615")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LEDControl)))
  "Returns md5sum for a message object of type 'LEDControl"
  "bff20060035fd92aac543c3a175d7615")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LEDControl>)))
  "Returns full string definition for message of type '<LEDControl>"
  (cl:format cl:nil "int16 led~%int16 R~%int16 G~%int16 B~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LEDControl)))
  "Returns full string definition for message of type 'LEDControl"
  (cl:format cl:nil "int16 led~%int16 R~%int16 G~%int16 B~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LEDControl>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LEDControl>))
  "Converts a ROS message object to a list"
  (cl:list 'LEDControl
    (cl:cons ':led (led msg))
    (cl:cons ':R (R msg))
    (cl:cons ':G (G msg))
    (cl:cons ':B (B msg))
))
