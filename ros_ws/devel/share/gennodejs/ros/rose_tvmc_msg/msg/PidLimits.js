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

class PidLimits {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DoF = null;
      this.OutputMin = null;
      this.OutputMax = null;
      this.IntegralMin = null;
      this.IntegralMax = null;
    }
    else {
      if (initObj.hasOwnProperty('DoF')) {
        this.DoF = initObj.DoF
      }
      else {
        this.DoF = 0;
      }
      if (initObj.hasOwnProperty('OutputMin')) {
        this.OutputMin = initObj.OutputMin
      }
      else {
        this.OutputMin = 0.0;
      }
      if (initObj.hasOwnProperty('OutputMax')) {
        this.OutputMax = initObj.OutputMax
      }
      else {
        this.OutputMax = 0.0;
      }
      if (initObj.hasOwnProperty('IntegralMin')) {
        this.IntegralMin = initObj.IntegralMin
      }
      else {
        this.IntegralMin = 0.0;
      }
      if (initObj.hasOwnProperty('IntegralMax')) {
        this.IntegralMax = initObj.IntegralMax
      }
      else {
        this.IntegralMax = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PidLimits
    // Serialize message field [DoF]
    bufferOffset = _serializer.uint8(obj.DoF, buffer, bufferOffset);
    // Serialize message field [OutputMin]
    bufferOffset = _serializer.float32(obj.OutputMin, buffer, bufferOffset);
    // Serialize message field [OutputMax]
    bufferOffset = _serializer.float32(obj.OutputMax, buffer, bufferOffset);
    // Serialize message field [IntegralMin]
    bufferOffset = _serializer.float32(obj.IntegralMin, buffer, bufferOffset);
    // Serialize message field [IntegralMax]
    bufferOffset = _serializer.float32(obj.IntegralMax, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PidLimits
    let len;
    let data = new PidLimits(null);
    // Deserialize message field [DoF]
    data.DoF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [OutputMin]
    data.OutputMin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [OutputMax]
    data.OutputMax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [IntegralMin]
    data.IntegralMin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [IntegralMax]
    data.IntegralMax = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/PidLimits';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '27ce4f57b16098ce45a25e0685714b1b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # message to set pid limits
    
    uint8 DoF
    
    float32 OutputMin
    float32 OutputMax
    float32 IntegralMin
    float32 IntegralMax
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PidLimits(null);
    if (msg.DoF !== undefined) {
      resolved.DoF = msg.DoF;
    }
    else {
      resolved.DoF = 0
    }

    if (msg.OutputMin !== undefined) {
      resolved.OutputMin = msg.OutputMin;
    }
    else {
      resolved.OutputMin = 0.0
    }

    if (msg.OutputMax !== undefined) {
      resolved.OutputMax = msg.OutputMax;
    }
    else {
      resolved.OutputMax = 0.0
    }

    if (msg.IntegralMin !== undefined) {
      resolved.IntegralMin = msg.IntegralMin;
    }
    else {
      resolved.IntegralMin = 0.0
    }

    if (msg.IntegralMax !== undefined) {
      resolved.IntegralMax = msg.IntegralMax;
    }
    else {
      resolved.IntegralMax = 0.0
    }

    return resolved;
    }
};

module.exports = PidLimits;
