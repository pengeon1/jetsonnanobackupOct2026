; Auto-generated. Do not edit!


(cl:in-package rose_tvmc-msg)


;//! \htmlinclude sensor_data_msg.msg.html

(cl:defclass <sensor_data_msg> (roslisp-msg-protocol:ros-message)
  ((depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0))
)

(cl:defclass sensor_data_msg (<sensor_data_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sensor_data_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sensor_data_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc-msg:<sensor_data_msg> is deprecated: use rose_tvmc-msg:sensor_data_msg instead.")))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <sensor_data_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:depth-val is deprecated.  Use rose_tvmc-msg:depth instead.")
  (depth m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <sensor_data_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:yaw-val is deprecated.  Use rose_tvmc-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <sensor_data_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:pitch-val is deprecated.  Use rose_tvmc-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <sensor_data_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:roll-val is deprecated.  Use rose_tvmc-msg:roll instead.")
  (roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sensor_data_msg>) ostream)
  "Serializes a message object of type '<sensor_data_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sensor_data_msg>) istream)
  "Deserializes a message object of type '<sensor_data_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sensor_data_msg>)))
  "Returns string type for a message object of type '<sensor_data_msg>"
  "rose_tvmc/sensor_data_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sensor_data_msg)))
  "Returns string type for a message object of type 'sensor_data_msg"
  "rose_tvmc/sensor_data_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sensor_data_msg>)))
  "Returns md5sum for a message object of type '<sensor_data_msg>"
  "843d06a79c410bbc60062b14e656ce9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sensor_data_msg)))
  "Returns md5sum for a message object of type 'sensor_data_msg"
  "843d06a79c410bbc60062b14e656ce9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sensor_data_msg>)))
  "Returns full string definition for message of type '<sensor_data_msg>"
  (cl:format cl:nil "float32  depth~%float32  yaw~%float32  pitch~%float32  roll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sensor_data_msg)))
  "Returns full string definition for message of type 'sensor_data_msg"
  (cl:format cl:nil "float32  depth~%float32  yaw~%float32  pitch~%float32  roll~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sensor_data_msg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sensor_data_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'sensor_data_msg
    (cl:cons ':depth (depth msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
))
