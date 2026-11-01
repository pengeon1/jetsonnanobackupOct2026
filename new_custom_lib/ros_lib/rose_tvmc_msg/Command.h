#ifndef _ROS_rose_tvmc_msg_Command_h
#define _ROS_rose_tvmc_msg_Command_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class Command : public ros::Msg
  {
    public:
      typedef uint8_t _Command_type;
      _Command_type Command;
      enum { RESET_THRUSTERS =  0 };
      enum { REFRESH =  1 };
      enum { SHUT_DOWN =  2 };

    Command():
      Command(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->Command >> (8 * 0)) & 0xFF;
      offset += sizeof(this->Command);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->Command =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->Command);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/Command"; };
    virtual const char * getMD5() override { return "69dfd90ba64f98112f4e8dae8687b678"; };

  };

}
#endif
