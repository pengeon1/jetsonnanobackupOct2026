#ifndef _ROS_rose_tvmc_msg_Thrust_h
#define _ROS_rose_tvmc_msg_Thrust_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class Thrust : public ros::Msg
  {
    public:
      typedef uint8_t _DoF_type;
      _DoF_type DoF;
      typedef float _Thrust_type;
      _Thrust_type Thrust;

    Thrust():
      DoF(0),
      Thrust(0)
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
      } u_Thrust;
      u_Thrust.real = this->Thrust;
      *(outbuffer + offset + 0) = (u_Thrust.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Thrust.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Thrust.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Thrust.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Thrust);
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
      } u_Thrust;
      u_Thrust.base = 0;
      u_Thrust.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Thrust.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Thrust.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Thrust.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Thrust = u_Thrust.real;
      offset += sizeof(this->Thrust);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/Thrust"; };
    virtual const char * getMD5() override { return "ae40b7f50edb53b85f4ec460f5721260"; };

  };

}
#endif
