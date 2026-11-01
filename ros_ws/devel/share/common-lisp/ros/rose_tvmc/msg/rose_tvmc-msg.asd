
(cl:in-package :asdf)

(defsystem "rose_tvmc-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "axes" :depends-on ("_package_axes"))
    (:file "_package_axes" :depends-on ("_package"))
    (:file "controller" :depends-on ("_package_controller"))
    (:file "_package_controller" :depends-on ("_package"))
    (:file "motion_command_msg" :depends-on ("_package_motion_command_msg"))
    (:file "_package_motion_command_msg" :depends-on ("_package"))
    (:file "pwm_values_msg" :depends-on ("_package_pwm_values_msg"))
    (:file "_package_pwm_values_msg" :depends-on ("_package"))
    (:file "sensor_data_msg" :depends-on ("_package_sensor_data_msg"))
    (:file "_package_sensor_data_msg" :depends-on ("_package"))
  ))