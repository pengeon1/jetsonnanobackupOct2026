; Auto-generated. Do not edit!


(cl:in-package rose_tvmc-msg)


;//! \htmlinclude pwm_values_msg.msg.html

(cl:defclass <pwm_values_msg> (roslisp-msg-protocol:ros-message)
  ((values
    :reader values
    :initarg :values
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 4 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass pwm_values_msg (<pwm_values_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pwm_values_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pwm_values_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rose_tvmc-msg:<pwm_values_msg> is deprecated: use rose_tvmc-msg:pwm_values_msg instead.")))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <pwm_values_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rose_tvmc-msg:values-val is deprecated.  Use rose_tvmc-msg:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pwm_values_msg>) ostream)
  "Serializes a message object of type '<pwm_values_msg>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pwm_values_msg>) istream)
  "Deserializes a message object of type '<pwm_values_msg>"
  (cl:setf (cl:slot-value msg 'values) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'values)))
    (cl:dotimes (i 4)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pwm_values_msg>)))
  "Returns string type for a message object of type '<pwm_values_msg>"
  "rose_tvmc/pwm_values_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pwm_values_msg)))
  "Returns string type for a message object of type 'pwm_values_msg"
  "rose_tvmc/pwm_values_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pwm_values_msg>)))
  "Returns md5sum for a message object of type '<pwm_values_msg>"
  "8f967bd898cbaf6fd252a0ed17c7e1c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pwm_values_msg)))
  "Returns md5sum for a message object of type 'pwm_values_msg"
  "8f967bd898cbaf6fd252a0ed17c7e1c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pwm_values_msg>)))
  "Returns full string definition for message of type '<pwm_values_msg>"
  (cl:format cl:nil "int16[4] values~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pwm_values_msg)))
  "Returns full string definition for message of type 'pwm_values_msg"
  (cl:format cl:nil "int16[4] values~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pwm_values_msg>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pwm_values_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'pwm_values_msg
    (cl:cons ':values (values msg))
))
