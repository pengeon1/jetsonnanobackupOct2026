;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc_msg::LEDControl)
  (if (not (find-package "ROSE_TVMC_MSG"))
    (make-package "ROSE_TVMC_MSG"))
  (shadow 'LEDControl (find-package "ROSE_TVMC_MSG")))
(unless (find-package "ROSE_TVMC_MSG::LEDCONTROL")
  (make-package "ROSE_TVMC_MSG::LEDCONTROL"))

(in-package "ROS")
;;//! \htmlinclude LEDControl.msg.html


(defclass rose_tvmc_msg::LEDControl
  :super ros::object
  :slots (_led _R _G _B ))

(defmethod rose_tvmc_msg::LEDControl
  (:init
   (&key
    ((:led __led) 0)
    ((:R __R) 0)
    ((:G __G) 0)
    ((:B __B) 0)
    )
   (send-super :init)
   (setq _led (round __led))
   (setq _R (round __R))
   (setq _G (round __G))
   (setq _B (round __B))
   self)
  (:led
   (&optional __led)
   (if __led (setq _led __led)) _led)
  (:R
   (&optional __R)
   (if __R (setq _R __R)) _R)
  (:G
   (&optional __G)
   (if __G (setq _G __G)) _G)
  (:B
   (&optional __B)
   (if __B (setq _B __B)) _B)
  (:serialization-length
   ()
   (+
    ;; int16 _led
    2
    ;; int16 _R
    2
    ;; int16 _G
    2
    ;; int16 _B
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _led
       (write-word _led s)
     ;; int16 _R
       (write-word _R s)
     ;; int16 _G
       (write-word _G s)
     ;; int16 _B
       (write-word _B s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _led
     (setq _led (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _R
     (setq _R (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _G
     (setq _G (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _B
     (setq _B (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get rose_tvmc_msg::LEDControl :md5sum-) "bff20060035fd92aac543c3a175d7615")
(setf (get rose_tvmc_msg::LEDControl :datatype-) "rose_tvmc_msg/LEDControl")
(setf (get rose_tvmc_msg::LEDControl :definition-)
      "int16 led
int16 R
int16 G
int16 B
")



(provide :rose_tvmc_msg/LEDControl "bff20060035fd92aac543c3a175d7615")


