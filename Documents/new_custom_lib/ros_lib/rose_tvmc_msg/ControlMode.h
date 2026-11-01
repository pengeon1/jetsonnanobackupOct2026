#ifndef _ROS_rose_tvmc_msg_ControlMode_h
#define _ROS_rose_tvmc_msg_ControlMode_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class ControlMode : public ros::Msg
  {
    public:
      typedef uint8_t _DoF_type;
      _DoF_type DoF;
      typedef uint8_t _Mode_type;
      _Mode_type Mode;
      enum { CLOSED_LOOP =  0 };
      enum { OPEN_LOOP =  1 };

    ControlMode():
      DoF(0),
      Mode(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->DoF >> (8 * 0)) & 0xFF;
      offset += sizeof(this->DoF);
      *(outbuffer + offset + 0) = (this->Mode >> (8 * 0)) & 0xFF;
      offset += sizeof(this->Mode);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->DoF =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->DoF);
      this->Mode =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->Mode);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/ControlMode"; };
    virtual const char * getMD5() override { return "8dbf66ce34e76ccbdd459bf828229d49"; };

  };

}
#endif
