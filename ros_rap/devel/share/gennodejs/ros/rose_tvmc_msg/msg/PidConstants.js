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

class PidConstants {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DoF = null;
      this.Kp = null;
      this.Ki = null;
      this.Kd = null;
      this.AcceptableError = null;
      this.Ko = null;
    }
    else {
      if (initObj.hasOwnProperty('DoF')) {
        this.DoF = initObj.DoF
      }
      else {
        this.DoF = 0;
      }
      if (initObj.hasOwnProperty('Kp')) {
        this.Kp = initObj.Kp
      }
      else {
        this.Kp = 0.0;
      }
      if (initObj.hasOwnProperty('Ki')) {
        this.Ki = initObj.Ki
      }
      else {
        this.Ki = 0.0;
      }
      if (initObj.hasOwnProperty('Kd')) {
        this.Kd = initObj.Kd
      }
      else {
        this.Kd = 0.0;
      }
      if (initObj.hasOwnProperty('AcceptableError')) {
        this.AcceptableError = initObj.AcceptableError
      }
      else {
        this.AcceptableError = 0.0;
      }
      if (initObj.hasOwnProperty('Ko')) {
        this.Ko = initObj.Ko
      }
      else {
        this.Ko = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PidConstants
    // Serialize message field [DoF]
    bufferOffset = _serializer.uint8(obj.DoF, buffer, bufferOffset);
    // Serialize message field [Kp]
    bufferOffset = _serializer.float32(obj.Kp, buffer, bufferOffset);
    // Serialize message field [Ki]
    bufferOffset = _serializer.float32(obj.Ki, buffer, bufferOffset);
    // Serialize message field [Kd]
    bufferOffset = _serializer.float32(obj.Kd, buffer, bufferOffset);
    // Serialize message field [AcceptableError]
    bufferOffset = _serializer.float32(obj.AcceptableError, buffer, bufferOffset);
    // Serialize message field [Ko]
    bufferOffset = _serializer.float32(obj.Ko, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PidConstants
    let len;
    let data = new PidConstants(null);
    // Deserialize message field [DoF]
    data.DoF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Kp]
    data.Kp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Ki]
    data.Ki = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Kd]
    data.Kd = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [AcceptableError]
    data.AcceptableError = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Ko]
    data.Ko = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/PidConstants';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ab0837d7d3687bd9352e4861b8c19aae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # message to set pid constants
    
    uint8 DoF
    
    float32 Kp
    float32 Ki
    float32 Kd
    
    float32 AcceptableError
    
    float32 Ko
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PidConstants(null);
    if (msg.DoF !== undefined) {
      resolved.DoF = msg.DoF;
    }
    else {
      resolved.DoF = 0
    }

    if (msg.Kp !== undefined) {
      resolved.Kp = msg.Kp;
    }
    else {
      resolved.Kp = 0.0
    }

    if (msg.Ki !== undefined) {
      resolved.Ki = msg.Ki;
    }
    else {
      resolved.Ki = 0.0
    }

    if (msg.Kd !== undefined) {
      resolved.Kd = msg.Kd;
    }
    else {
      resolved.Kd = 0.0
    }

    if (msg.AcceptableError !== undefined) {
      resolved.AcceptableError = msg.AcceptableError;
    }
    else {
      resolved.AcceptableError = 0.0
    }

    if (msg.Ko !== undefined) {
      resolved.Ko = msg.Ko;
    }
    else {
      resolved.Ko = 0.0
    }

    return resolved;
    }
};

module.exports = PidConstants;
