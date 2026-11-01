// Auto-generated. Do not edit!

// (in-package rose_tvmc.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let axes = require('./axes.js');

//-----------------------------------------------------------

class controller {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vals = null;
      this.left_trigger = null;
      this.right_trigger = null;
      this.left_bumper = null;
      this.right_bumper = null;
      this.pitch_reset = null;
      this.pitch_hold = null;
      this.yaw_hold = null;
    }
    else {
      if (initObj.hasOwnProperty('vals')) {
        this.vals = initObj.vals
      }
      else {
        this.vals = new axes();
      }
      if (initObj.hasOwnProperty('left_trigger')) {
        this.left_trigger = initObj.left_trigger
      }
      else {
        this.left_trigger = 0.0;
      }
      if (initObj.hasOwnProperty('right_trigger')) {
        this.right_trigger = initObj.right_trigger
      }
      else {
        this.right_trigger = 0.0;
      }
      if (initObj.hasOwnProperty('left_bumper')) {
        this.left_bumper = initObj.left_bumper
      }
      else {
        this.left_bumper = 0;
      }
      if (initObj.hasOwnProperty('right_bumper')) {
        this.right_bumper = initObj.right_bumper
      }
      else {
        this.right_bumper = 0;
      }
      if (initObj.hasOwnProperty('pitch_reset')) {
        this.pitch_reset = initObj.pitch_reset
      }
      else {
        this.pitch_reset = 0;
      }
      if (initObj.hasOwnProperty('pitch_hold')) {
        this.pitch_hold = initObj.pitch_hold
      }
      else {
        this.pitch_hold = 0;
      }
      if (initObj.hasOwnProperty('yaw_hold')) {
        this.yaw_hold = initObj.yaw_hold
      }
      else {
        this.yaw_hold = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controller
    // Serialize message field [vals]
    bufferOffset = axes.serialize(obj.vals, buffer, bufferOffset);
    // Serialize message field [left_trigger]
    bufferOffset = _serializer.float32(obj.left_trigger, buffer, bufferOffset);
    // Serialize message field [right_trigger]
    bufferOffset = _serializer.float32(obj.right_trigger, buffer, bufferOffset);
    // Serialize message field [left_bumper]
    bufferOffset = _serializer.int32(obj.left_bumper, buffer, bufferOffset);
    // Serialize message field [right_bumper]
    bufferOffset = _serializer.int32(obj.right_bumper, buffer, bufferOffset);
    // Serialize message field [pitch_reset]
    bufferOffset = _serializer.int32(obj.pitch_reset, buffer, bufferOffset);
    // Serialize message field [pitch_hold]
    bufferOffset = _serializer.int32(obj.pitch_hold, buffer, bufferOffset);
    // Serialize message field [yaw_hold]
    bufferOffset = _serializer.int32(obj.yaw_hold, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controller
    let len;
    let data = new controller(null);
    // Deserialize message field [vals]
    data.vals = axes.deserialize(buffer, bufferOffset);
    // Deserialize message field [left_trigger]
    data.left_trigger = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_trigger]
    data.right_trigger = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_bumper]
    data.left_bumper = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [right_bumper]
    data.right_bumper = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pitch_reset]
    data.pitch_reset = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pitch_hold]
    data.pitch_hold = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [yaw_hold]
    data.yaw_hold = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc/controller';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '74b3d4a3dd07d5b868ac6ae15eb0fe4b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    axes vals
    float32 left_trigger
    float32 right_trigger
    int32 left_bumper
    int32 right_bumper
    int32 pitch_reset
    int32 pitch_hold
    int32 yaw_hold
    
    
    ================================================================================
    MSG: rose_tvmc/axes
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
    const resolved = new controller(null);
    if (msg.vals !== undefined) {
      resolved.vals = axes.Resolve(msg.vals)
    }
    else {
      resolved.vals = new axes()
    }

    if (msg.left_trigger !== undefined) {
      resolved.left_trigger = msg.left_trigger;
    }
    else {
      resolved.left_trigger = 0.0
    }

    if (msg.right_trigger !== undefined) {
      resolved.right_trigger = msg.right_trigger;
    }
    else {
      resolved.right_trigger = 0.0
    }

    if (msg.left_bumper !== undefined) {
      resolved.left_bumper = msg.left_bumper;
    }
    else {
      resolved.left_bumper = 0
    }

    if (msg.right_bumper !== undefined) {
      resolved.right_bumper = msg.right_bumper;
    }
    else {
      resolved.right_bumper = 0
    }

    if (msg.pitch_reset !== undefined) {
      resolved.pitch_reset = msg.pitch_reset;
    }
    else {
      resolved.pitch_reset = 0
    }

    if (msg.pitch_hold !== undefined) {
      resolved.pitch_hold = msg.pitch_hold;
    }
    else {
      resolved.pitch_hold = 0
    }

    if (msg.yaw_hold !== undefined) {
      resolved.yaw_hold = msg.yaw_hold;
    }
    else {
      resolved.yaw_hold = 0
    }

    return resolved;
    }
};

module.exports = controller;
