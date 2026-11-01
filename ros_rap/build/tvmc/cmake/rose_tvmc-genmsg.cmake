# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rose_tvmc: 5 messages, 0 services")

set(MSG_I_FLAGS "-Irose_tvmc:/home/jetson/ros_rap/src/tvmc/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rose_tvmc_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" NAME_WE)
add_custom_target(_rose_tvmc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rose_tvmc" "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" ""
)

get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" NAME_WE)
add_custom_target(_rose_tvmc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rose_tvmc" "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" ""
)

get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" NAME_WE)
add_custom_target(_rose_tvmc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rose_tvmc" "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" ""
)

get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" NAME_WE)
add_custom_target(_rose_tvmc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rose_tvmc" "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" "rose_tvmc/axes"
)

get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" NAME_WE)
add_custom_target(_rose_tvmc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rose_tvmc" "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_cpp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_cpp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_cpp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/controller.msg"
  "${MSG_I_FLAGS}"
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_cpp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
)

### Generating Services

### Generating Module File
_generate_module_cpp(rose_tvmc
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rose_tvmc_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rose_tvmc_generate_messages rose_tvmc_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_cpp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_cpp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_cpp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_cpp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_cpp _rose_tvmc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rose_tvmc_gencpp)
add_dependencies(rose_tvmc_gencpp rose_tvmc_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rose_tvmc_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
)
_generate_msg_eus(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
)
_generate_msg_eus(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
)
_generate_msg_eus(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/controller.msg"
  "${MSG_I_FLAGS}"
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
)
_generate_msg_eus(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
)

### Generating Services

### Generating Module File
_generate_module_eus(rose_tvmc
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rose_tvmc_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rose_tvmc_generate_messages rose_tvmc_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_eus _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_eus _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_eus _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_eus _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_eus _rose_tvmc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rose_tvmc_geneus)
add_dependencies(rose_tvmc_geneus rose_tvmc_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rose_tvmc_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_lisp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_lisp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_lisp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/controller.msg"
  "${MSG_I_FLAGS}"
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
)
_generate_msg_lisp(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
)

### Generating Services

### Generating Module File
_generate_module_lisp(rose_tvmc
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rose_tvmc_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rose_tvmc_generate_messages rose_tvmc_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_lisp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_lisp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_lisp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_lisp _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_lisp _rose_tvmc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rose_tvmc_genlisp)
add_dependencies(rose_tvmc_genlisp rose_tvmc_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rose_tvmc_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
)
_generate_msg_nodejs(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
)
_generate_msg_nodejs(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
)
_generate_msg_nodejs(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/controller.msg"
  "${MSG_I_FLAGS}"
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
)
_generate_msg_nodejs(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
)

### Generating Services

### Generating Module File
_generate_module_nodejs(rose_tvmc
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rose_tvmc_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rose_tvmc_generate_messages rose_tvmc_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_nodejs _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_nodejs _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_nodejs _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_nodejs _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_nodejs _rose_tvmc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rose_tvmc_gennodejs)
add_dependencies(rose_tvmc_gennodejs rose_tvmc_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rose_tvmc_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
)
_generate_msg_py(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
)
_generate_msg_py(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
)
_generate_msg_py(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/controller.msg"
  "${MSG_I_FLAGS}"
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
)
_generate_msg_py(rose_tvmc
  "/home/jetson/ros_rap/src/tvmc/msg/axes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
)

### Generating Services

### Generating Module File
_generate_module_py(rose_tvmc
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rose_tvmc_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rose_tvmc_generate_messages rose_tvmc_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/motion_command_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_py _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/pwm_values_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_py _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/sensor_data_msg.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_py _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/controller.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_py _rose_tvmc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/ros_rap/src/tvmc/msg/axes.msg" NAME_WE)
add_dependencies(rose_tvmc_generate_messages_py _rose_tvmc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rose_tvmc_genpy)
add_dependencies(rose_tvmc_genpy rose_tvmc_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rose_tvmc_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rose_tvmc
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rose_tvmc_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rose_tvmc
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rose_tvmc_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rose_tvmc
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rose_tvmc_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rose_tvmc
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rose_tvmc_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rose_tvmc
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rose_tvmc_generate_messages_py std_msgs_generate_messages_py)
endif()
