#ifndef _ROS_rose_tvmc_pwm_values_msg_h
#define _ROS_rose_tvmc_pwm_values_msg_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc
{

  class pwm_values_msg : public ros::Msg
  {
    public:
      int16_t values[4];

    pwm_values_msg():
      values()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      for( uint32_t i = 0; i < 4; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_valuesi;
      u_valuesi.real = this->values[i];
      *(outbuffer + offset + 0) = (u_valuesi.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_valuesi.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->values[i]);
      }
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      for( uint32_t i = 0; i < 4; i++){
      union {
        int16_t real;
        uint16_t base;
      } u_valuesi;
      u_valuesi.base = 0;
      u_valuesi.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_valuesi.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->values[i] = u_valuesi.real;
      offset += sizeof(this->values[i]);
      }
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc/pwm_values_msg"; };
    virtual const char * getMD5() override { return "8f967bd898cbaf6fd252a0ed17c7e1c9"; };

  };

}
#endif
