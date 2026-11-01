// Auto-generated. Do not edit!

// (in-package rose_tvmc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class axes {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ax0 = null;
      this.ax1 = null;
      this.ax2 = null;
      this.ax3 = null;
    }
    else {
      if (initObj.hasOwnProperty('ax0')) {
        this.ax0 = initObj.ax0
      }
      else {
        this.ax0 = 0.0;
      }
      if (initObj.hasOwnProperty('ax1')) {
        this.ax1 = initObj.ax1
      }
      else {
        this.ax1 = 0.0;
      }
      if (initObj.hasOwnProperty('ax2')) {
        this.ax2 = initObj.ax2
      }
      else {
        this.ax2 = 0.0;
      }
      if (initObj.hasOwnProperty('ax3')) {
        this.ax3 = initObj.ax3
      }
      else {
        this.ax3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type axes
    // Serialize message field [ax0]
    bufferOffset = _serializer.float32(obj.ax0, buffer, bufferOffset);
    // Serialize message field [ax1]
    bufferOffset = _serializer.float32(obj.ax1, buffer, bufferOffset);
    // Serialize message field [ax2]
    bufferOffset = _serializer.float32(obj.ax2, buffer, bufferOffset);
    // Serialize message field [ax3]
    bufferOffset = _serializer.float32(obj.ax3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type axes
    let len;
    let data = new axes(null);
    // Deserialize message field [ax0]
    data.ax0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ax1]
    data.ax1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ax2]
    data.ax2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ax3]
    data.ax3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc/axes';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c8a9eced0236eae16993854fc83c382';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 ax0
    float32 ax1
    float32 ax2
    float32 ax3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new axes(null);
    if (msg.ax0 !== undefined) {
      resolved.ax0 = msg.ax0;
    }
    else {
      resolved.ax0 = 0.0
    }

    if (msg.ax1 !== undefined) {
      resolved.ax1 = msg.ax1;
    }
    else {
      resolved.ax1 = 0.0
    }

    if (msg.ax2 !== undefined) {
      resolved.ax2 = msg.ax2;
    }
    else {
      resolved.ax2 = 0.0
    }

    if (msg.ax3 !== undefined) {
      resolved.ax3 = msg.ax3;
    }
    else {
      resolved.ax3 = 0.0
    }

    return resolved;
    }
};

module.exports = axes;
