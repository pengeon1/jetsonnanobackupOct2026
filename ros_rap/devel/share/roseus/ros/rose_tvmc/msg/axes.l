;; Auto-generated. Do not edit!


(when (boundp 'rose_tvmc::axes)
  (if (not (find-package "ROSE_TVMC"))
    (make-package "ROSE_TVMC"))
  (shadow 'axes (find-package "ROSE_TVMC")))
(unless (find-package "ROSE_TVMC::AXES")
  (make-package "ROSE_TVMC::AXES"))

(in-package "ROS")
;;//! \htmlinclude axes.msg.html


(defclass rose_tvmc::axes
  :super ros::object
  :slots (_ax0 _ax1 _ax2 _ax3 ))

(defmethod rose_tvmc::axes
  (:init
   (&key
    ((:ax0 __ax0) 0.0)
    ((:ax1 __ax1) 0.0)
    ((:ax2 __ax2) 0.0)
    ((:ax3 __ax3) 0.0)
    )
   (send-super :init)
   (setq _ax0 (float __ax0))
   (setq _ax1 (float __ax1))
   (setq _ax2 (float __ax2))
   (setq _ax3 (float __ax3))
   self)
  (:ax0
   (&optional __ax0)
   (if __ax0 (setq _ax0 __ax0)) _ax0)
  (:ax1
   (&optional __ax1)
   (if __ax1 (setq _ax1 __ax1)) _ax1)
  (:ax2
   (&optional __ax2)
   (if __ax2 (setq _ax2 __ax2)) _ax2)
  (:ax3
   (&optional __ax3)
   (if __ax3 (setq _ax3 __ax3)) _ax3)
  (:serialization-length
   ()
   (+
    ;; float32 _ax0
    4
    ;; float32 _ax1
    4
    ;; float32 _ax2
    4
    ;; float32 _ax3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _ax0
       (sys::poke _ax0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ax1
       (sys::poke _ax1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ax2
       (sys::poke _ax2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ax3
       (sys::poke _ax3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _ax0
     (setq _ax0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ax1
     (setq _ax1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ax2
     (setq _ax2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ax3
     (setq _ax3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rose_tvmc::axes :md5sum-) "5c8a9eced0236eae16993854fc83c382")
(setf (get rose_tvmc::axes :datatype-) "rose_tvmc/axes")
(setf (get rose_tvmc::axes :definition-)
      "float32 ax0
float32 ax1
float32 ax2
float32 ax3

")



(provide :rose_tvmc/axes "5c8a9eced0236eae16993854fc83c382")


