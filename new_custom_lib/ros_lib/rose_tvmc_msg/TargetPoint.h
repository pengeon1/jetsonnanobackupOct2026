#ifndef _ROS_rose_tvmc_msg_TargetPoint_h
#define _ROS_rose_tvmc_msg_TargetPoint_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class TargetPoint : public ros::Msg
  {
    public:
      typedef uint8_t _DoF_type;
      _DoF_type DoF;
      typedef float _Target_type;
      _Target_type Target;

    TargetPoint():
      DoF(0),
      Target(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->DoF >> (8 * 0)) & 0xFF;
      offset += sizeof(this->DoF);
      union {
        float real;
        uint32_t base;
      } u_Target;
      u_Target.real = this->Target;
      *(outbuffer + offset + 0) = (u_Target.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Target.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Target.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Target.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Target);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      this->DoF =  ((uint8_t) (*(inbuffer + offset)));
      offset += sizeof(this->DoF);
      union {
        float real;
        uint32_t base;
      } u_Target;
      u_Target.base = 0;
      u_Target.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Target.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Target.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Target.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Target = u_Target.real;
      offset += sizeof(this->Target);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/TargetPoint"; };
    virtual const char * getMD5() override { return "cfb3907c63490480e7c7aa145897923e"; };

  };

}
#endif
