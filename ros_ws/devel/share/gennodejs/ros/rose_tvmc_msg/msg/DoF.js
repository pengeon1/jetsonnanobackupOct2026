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

class DoF {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DoF
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DoF
    let len;
    let data = new DoF(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/DoF';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '64f26c9f1200d4d44f88dfc98f9d202e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # constants to use to represent degrees of freedom
    
    uint8 SURGE = 0
    uint8 SWAY = 1
    uint8 HEAVE = 2
    uint8 ROLL = 3
    uint8 PITCH = 4
    uint8 YAW = 5
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DoF(null);
    return resolved;
    }
};

// Constants for message
DoF.Constants = {
  SURGE: 0,
  SWAY: 1,
  HEAVE: 2,
  ROLL: 3,
  PITCH: 4,
  YAW: 5,
}

module.exports = DoF;
