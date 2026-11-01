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

class MultiThrust {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.surge = null;
      this.sway = null;
      this.heave = null;
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('surge')) {
        this.surge = initObj.surge
      }
      else {
        this.surge = 0.0;
      }
      if (initObj.hasOwnProperty('sway')) {
        this.sway = initObj.sway
      }
      else {
        this.sway = 0.0;
      }
      if (initObj.hasOwnProperty('heave')) {
        this.heave = initObj.heave
      }
      else {
        this.heave = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultiThrust
    // Serialize message field [surge]
    bufferOffset = _serializer.float32(obj.surge, buffer, bufferOffset);
    // Serialize message field [sway]
    bufferOffset = _serializer.float32(obj.sway, buffer, bufferOffset);
    // Serialize message field [heave]
    bufferOffset = _serializer.float32(obj.heave, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultiThrust
    let len;
    let data = new MultiThrust(null);
    // Deserialize message field [surge]
    data.surge = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sway]
    data.sway = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heave]
    data.heave = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/MultiThrust';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f11dfad4a1e1233988ef17df221cdc39';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 surge
    float32 sway
    float32 heave
    float32 roll
    float32 pitch
    float32 yaw
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultiThrust(null);
    if (msg.surge !== undefined) {
      resolved.surge = msg.surge;
    }
    else {
      resolved.surge = 0.0
    }

    if (msg.sway !== undefined) {
      resolved.sway = msg.sway;
    }
    else {
      resolved.sway = 0.0
    }

    if (msg.heave !== undefined) {
      resolved.heave = msg.heave;
    }
    else {
      resolved.heave = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    return resolved;
    }
};

module.exports = MultiThrust;
