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

class Command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Command = null;
    }
    else {
      if (initObj.hasOwnProperty('Command')) {
        this.Command = initObj.Command
      }
      else {
        this.Command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Command
    // Serialize message field [Command]
    bufferOffset = _serializer.uint8(obj.Command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Command
    let len;
    let data = new Command(null);
    // Deserialize message field [Command]
    data.Command = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rose_tvmc_msg/Command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '69dfd90ba64f98112f4e8dae8687b678';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    # mesaage for misc commands
    
    uint8 RESET_THRUSTERS = 0
    uint8 REFRESH = 1
    uint8 SHUT_DOWN = 2
    
    uint8 Command
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Command(null);
    if (msg.Command !== undefined) {
      resolved.Command = msg.Command;
    }
    else {
      resolved.Command = 0
    }

    return resolved;
    }
};

// Constants for message
Command.Constants = {
  RESET_THRUSTERS: 0,
  REFRESH: 1,
  SHUT_DOWN: 2,
}

module.exports = Command;
