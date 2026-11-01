#ifndef _ROS_rose_tvmc_msg_LEDControl_h
#define _ROS_rose_tvmc_msg_LEDControl_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class LEDControl : public ros::Msg
  {
    public:
      typedef int16_t _led_type;
      _led_type led;
      typedef int16_t _R_type;
      _R_type R;
      typedef int16_t _G_type;
      _G_type G;
      typedef int16_t _B_type;
      _B_type B;

    LEDControl():
      led(0),
      R(0),
      G(0),
      B(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int16_t real;
        uint16_t base;
      } u_led;
      u_led.real = this->led;
      *(outbuffer + offset + 0) = (u_led.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_led.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->led);
      union {
        int16_t real;
        uint16_t base;
      } u_R;
      u_R.real = this->R;
      *(outbuffer + offset + 0) = (u_R.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_R.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->R);
      union {
        int16_t real;
        uint16_t base;
      } u_G;
      u_G.real = this->G;
      *(outbuffer + offset + 0) = (u_G.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_G.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->G);
      union {
        int16_t real;
        uint16_t base;
      } u_B;
      u_B.real = this->B;
      *(outbuffer + offset + 0) = (u_B.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_B.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->B);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int16_t real;
        uint16_t base;
      } u_led;
      u_led.base = 0;
      u_led.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_led.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->led = u_led.real;
      offset += sizeof(this->led);
      union {
        int16_t real;
        uint16_t base;
      } u_R;
      u_R.base = 0;
      u_R.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_R.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->R = u_R.real;
      offset += sizeof(this->R);
      union {
        int16_t real;
        uint16_t base;
      } u_G;
      u_G.base = 0;
      u_G.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_G.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->G = u_G.real;
      offset += sizeof(this->G);
      union {
        int16_t real;
        uint16_t base;
      } u_B;
      u_B.base = 0;
      u_B.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_B.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->B = u_B.real;
      offset += sizeof(this->B);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/LEDControl"; };
    virtual const char * getMD5() override { return "bff20060035fd92aac543c3a175d7615"; };

  };

}
#endif
