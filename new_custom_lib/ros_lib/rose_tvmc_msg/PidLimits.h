#ifndef _ROS_rose_tvmc_msg_PidLimits_h
#define _ROS_rose_tvmc_msg_PidLimits_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class PidLimits : public ros::Msg
  {
    public:
      typedef uint8_t _DoF_type;
      _DoF_type DoF;
      typedef float _OutputMin_type;
      _OutputMin_type OutputMin;
      typedef float _OutputMax_type;
      _OutputMax_type OutputMax;
      typedef float _IntegralMin_type;
      _IntegralMin_type IntegralMin;
      typedef float _IntegralMax_type;
      _IntegralMax_type IntegralMax;

    PidLimits():
      DoF(0),
      OutputMin(0),
      OutputMax(0),
      IntegralMin(0),
      IntegralMax(0)
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
      } u_OutputMin;
      u_OutputMin.real = this->OutputMin;
      *(outbuffer + offset + 0) = (u_OutputMin.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_OutputMin.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_OutputMin.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_OutputMin.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->OutputMin);
      union {
        float real;
        uint32_t base;
      } u_OutputMax;
      u_OutputMax.real = this->OutputMax;
      *(outbuffer + offset + 0) = (u_OutputMax.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_OutputMax.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_OutputMax.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_OutputMax.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->OutputMax);
      union {
        float real;
        uint32_t base;
      } u_IntegralMin;
      u_IntegralMin.real = this->IntegralMin;
      *(outbuffer + offset + 0) = (u_IntegralMin.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_IntegralMin.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_IntegralMin.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_IntegralMin.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->IntegralMin);
      union {
        float real;
        uint32_t base;
      } u_IntegralMax;
      u_IntegralMax.real = this->IntegralMax;
      *(outbuffer + offset + 0) = (u_IntegralMax.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_IntegralMax.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_IntegralMax.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_IntegralMax.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->IntegralMax);
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
      } u_OutputMin;
      u_OutputMin.base = 0;
      u_OutputMin.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_OutputMin.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_OutputMin.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_OutputMin.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->OutputMin = u_OutputMin.real;
      offset += sizeof(this->OutputMin);
      union {
        float real;
        uint32_t base;
      } u_OutputMax;
      u_OutputMax.base = 0;
      u_OutputMax.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_OutputMax.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_OutputMax.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_OutputMax.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->OutputMax = u_OutputMax.real;
      offset += sizeof(this->OutputMax);
      union {
        float real;
        uint32_t base;
      } u_IntegralMin;
      u_IntegralMin.base = 0;
      u_IntegralMin.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_IntegralMin.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_IntegralMin.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_IntegralMin.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->IntegralMin = u_IntegralMin.real;
      offset += sizeof(this->IntegralMin);
      union {
        float real;
        uint32_t base;
      } u_IntegralMax;
      u_IntegralMax.base = 0;
      u_IntegralMax.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_IntegralMax.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_IntegralMax.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_IntegralMax.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->IntegralMax = u_IntegralMax.real;
      offset += sizeof(this->IntegralMax);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/PidLimits"; };
    virtual const char * getMD5() override { return "27ce4f57b16098ce45a25e0685714b1b"; };

  };

}
#endif
