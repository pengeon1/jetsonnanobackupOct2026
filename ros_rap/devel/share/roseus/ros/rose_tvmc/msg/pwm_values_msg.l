;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc::pwm_values_msg)
  (if (not (find-package "ROSE_TVMC"))
    (make-package "ROSE_TVMC"))
  (shadow 'pwm_values_msg (find-package "ROSE_TVMC")))
(unless (find-package "ROSE_TVMC::PWM_VALUES_MSG")
  (make-package "ROSE_TVMC::PWM_VALUES_MSG"))

(in-package "ROS")
;;//! \htmlinclude pwm_values_msg.msg.html


(defclass rose_tvmc::pwm_values_msg
  :super ros::object
  :slots (_values ))

(defmethod rose_tvmc::pwm_values_msg
  (:init
   (&key
    ((:values __values) (make-array 4 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _values __values)
   self)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; int16[4] _values
    (* 2    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[4] _values
     (dotimes (i 4)
       (write-word (elt _values i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[4] _values
   (dotimes (i (length _values))
     (setf (elt _values i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get rose_tvmc::pwm_values_msg :md5sum-) "8f967bd898cbaf6fd252a0ed17c7e1c9")
(setf (get rose_tvmc::pwm_values_msg :datatype-) "rose_tvmc/pwm_values_msg")
(setf (get rose_tvmc::pwm_values_msg :definition-)
      "int16[4] values
")



(provide :rose_tvmc/pwm_values_msg "8f967bd898cbaf6fd252a0ed17c7e1c9")


