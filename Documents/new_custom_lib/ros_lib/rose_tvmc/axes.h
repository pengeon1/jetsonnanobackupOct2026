#ifndef _ROS_rose_tvmc_axes_h
#define _ROS_rose_tvmc_axes_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc
{

  class axes : public ros::Msg
  {
    public:
      typedef float _ax0_type;
      _ax0_type ax0;
      typedef float _ax1_type;
      _ax1_type ax1;
      typedef float _ax2_type;
      _ax2_type ax2;
      typedef float _ax3_type;
      _ax3_type ax3;

    axes():
      ax0(0),
      ax1(0),
      ax2(0),
      ax3(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_ax0;
      u_ax0.real = this->ax0;
      *(outbuffer + offset + 0) = (u_ax0.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ax0.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ax0.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ax0.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ax0);
      union {
        float real;
        uint32_t base;
      } u_ax1;
      u_ax1.real = this->ax1;
      *(outbuffer + offset + 0) = (u_ax1.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ax1.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ax1.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ax1.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ax1);
      union {
        float real;
        uint32_t base;
      } u_ax2;
      u_ax2.real = this->ax2;
      *(outbuffer + offset + 0) = (u_ax2.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ax2.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ax2.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ax2.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ax2);
      union {
        float real;
        uint32_t base;
      } u_ax3;
      u_ax3.real = this->ax3;
      *(outbuffer + offset + 0) = (u_ax3.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_ax3.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_ax3.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_ax3.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->ax3);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        float real;
        uint32_t base;
      } u_ax0;
      u_ax0.base = 0;
      u_ax0.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ax0.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ax0.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ax0.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ax0 = u_ax0.real;
      offset += sizeof(this->ax0);
      union {
        float real;
        uint32_t base;
      } u_ax1;
      u_ax1.base = 0;
      u_ax1.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ax1.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ax1.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ax1.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ax1 = u_ax1.real;
      offset += sizeof(this->ax1);
      union {
        float real;
        uint32_t base;
      } u_ax2;
      u_ax2.base = 0;
      u_ax2.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ax2.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ax2.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ax2.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ax2 = u_ax2.real;
      offset += sizeof(this->ax2);
      union {
        float real;
        uint32_t base;
      } u_ax3;
      u_ax3.base = 0;
      u_ax3.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_ax3.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_ax3.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_ax3.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->ax3 = u_ax3.real;
      offset += sizeof(this->ax3);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc/axes"; };
    virtual const char * getMD5() override { return "5c8a9eced0236eae16993854fc83c382"; };

  };

}
#endif
