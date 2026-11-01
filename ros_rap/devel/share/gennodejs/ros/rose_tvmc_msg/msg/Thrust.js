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

class Thrust {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DoF = null;
      this.Thrust = null;
    }
    else {
      if (initObj.hasOwnProperty('DoF')) {
        this.DoF = initObj.DoF
      }
      else {
        this.DoF = 0;
      }
      if (initObj.hasOwnProperty('Thrust')) {
        this.Thrust = initObj.Thrust
      }
      else {
        this.Thrust = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Thrust
    // Serialize message field [DoF]
    bufferOffset = _serializer.uint8(obj.DoF, buffer, bufferOffset);
    // Serialize message field [Thrust]
    bufferOffset = _serializer.float32(obj.Thrust, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Thrust
    let len;
    let data = new Thrust(null);
    // Deserialize message field [DoF]
    data.DoF = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Thrust]
    data.Thrust = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/Thrust';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ae40b7f50edb53b85f4ec460f5721260';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # msg to set thrust for open loop control
    
    uint8 DoF
    
    float32 Thrust
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Thrust(null);
    if (msg.DoF !== undefined) {
      resolved.DoF = msg.DoF;
    }
    else {
      resolved.DoF = 0
    }

    if (msg.Thrust !== undefined) {
      resolved.Thrust = msg.Thrust;
    }
    else {
      resolved.Thrust = 0.0
    }

    return resolved;
    }
};

module.exports = Thrust;
