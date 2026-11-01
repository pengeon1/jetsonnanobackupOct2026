// Auto-generated. Do not edit!

// (in-package rose_tvmc_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TargetPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DoF = null;
      this.Target = null;
    }
    else {
      if (initObj.hasOwnProperty('DoF')) {
        this.DoF = initObj.DoF
      }
      else {
        this.DoF = 0;
      }
      if (initObj.hasOwnProperty('Target')) {
        this.Target = initObj.Target
      }
      else {
        this.Target = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TargetPoint
    // Serialize message field [DoF]
    bufferOffset = _serializer.uint8(obj.DoF, buffer, bufferOffset);
    // Serialize message field [Target]
    bufferOffset = _serializer.float32(obj.Target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TargetPoint
    let len;
    let data = new TargetPoint(null);
    // Deserialize message field [DoF]
    data.DoF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Target]
    data.Target = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/TargetPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cfb3907c63490480e7c7aa145897923e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # msg to set PID target point
    
    uint8 DoF
    
    float32 Target
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TargetPoint(null);
    if (msg.DoF !== undefined) {
      resolved.DoF = msg.DoF;
    }
    else {
      resolved.DoF = 0
    }

    if (msg.Target !== undefined) {
      resolved.Target = msg.Target;
    }
    else {
      resolved.Target = 0.0
    }

    return resolved;
    }
};

module.exports = TargetPoint;
