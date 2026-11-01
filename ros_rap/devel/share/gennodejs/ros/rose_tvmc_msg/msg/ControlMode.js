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

class ControlMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DoF = null;
      this.Mode = null;
    }
    else {
      if (initObj.hasOwnProperty('DoF')) {
        this.DoF = initObj.DoF
      }
      else {
        this.DoF = 0;
      }
      if (initObj.hasOwnProperty('Mode')) {
        this.Mode = initObj.Mode
      }
      else {
        this.Mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlMode
    // Serialize message field [DoF]
    bufferOffset = _serializer.uint8(obj.DoF, buffer, bufferOffset);
    // Serialize message field [Mode]
    bufferOffset = _serializer.uint8(obj.Mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlMode
    let len;
    let data = new ControlMode(null);
    // Deserialize message field [DoF]
    data.DoF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Mode]
    data.Mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/ControlMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8dbf66ce34e76ccbdd459bf828229d49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # used to set control type
    
    uint8 CLOSED_LOOP = 0
    uint8 OPEN_LOOP = 1
    
    uint8 DoF
    uint8 Mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlMode(null);
    if (msg.DoF !== undefined) {
      resolved.DoF = msg.DoF;
    }
    else {
      resolved.DoF = 0
    }

    if (msg.Mode !== undefined) {
      resolved.Mode = msg.Mode;
    }
    else {
      resolved.Mode = 0
    }

    return resolved;
    }
};

// Constants for message
ControlMode.Constants = {
  CLOSED_LOOP: 0,
  OPEN_LOOP: 1,
}

module.exports = ControlMode;
