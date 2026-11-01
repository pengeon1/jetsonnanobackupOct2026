#ifndef _ROS_rose_tvmc_msg_CurrentPoint_h
#define _ROS_rose_tvmc_msg_CurrentPoint_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class CurrentPoint : public ros::Msg
  {
    public:
      typedef uint8_t _DoF_type;
      _DoF_type DoF;
      typedef float _Current_type;
      _Current_type Current;

    CurrentPoint():
      DoF(0),
      Current(0)
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
      } u_Current;
      u_Current.real = this->Current;
      *(outbuffer + offset + 0) = (u_Current.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Current.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Current.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Current.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Current);
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
      } u_Current;
      u_Current.base = 0;
      u_Current.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Current.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Current.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Current.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Current = u_Current.real;
      offset += sizeof(this->Current);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/CurrentPoint"; };
    virtual const char * getMD5() override { return "76b78cb8d12895bbed908073bee7ad46"; };

  };

}
#endif
