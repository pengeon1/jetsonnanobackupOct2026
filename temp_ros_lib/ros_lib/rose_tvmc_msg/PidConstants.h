#ifndef _ROS_rose_tvmc_msg_PidConstants_h
#define _ROS_rose_tvmc_msg_PidConstants_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class PidConstants : public ros::Msg
  {
    public:
      typedef uint8_t _DoF_type;
      _DoF_type DoF;
      typedef float _Kp_type;
      _Kp_type Kp;
      typedef float _Ki_type;
      _Ki_type Ki;
      typedef float _Kd_type;
      _Kd_type Kd;
      typedef float _AcceptableError_type;
      _AcceptableError_type AcceptableError;
      typedef float _Ko_type;
      _Ko_type Ko;

    PidConstants():
      DoF(0),
      Kp(0),
      Ki(0),
      Kd(0),
      AcceptableError(0),
      Ko(0)
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
      } u_Kp;
      u_Kp.real = this->Kp;
      *(outbuffer + offset + 0) = (u_Kp.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Kp.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Kp.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Kp.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Kp);
      union {
        float real;
        uint32_t base;
      } u_Ki;
      u_Ki.real = this->Ki;
      *(outbuffer + offset + 0) = (u_Ki.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Ki.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Ki.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Ki.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Ki);
      union {
        float real;
        uint32_t base;
      } u_Kd;
      u_Kd.real = this->Kd;
      *(outbuffer + offset + 0) = (u_Kd.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Kd.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Kd.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Kd.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Kd);
      union {
        float real;
        uint32_t base;
      } u_AcceptableError;
      u_AcceptableError.real = this->AcceptableError;
      *(outbuffer + offset + 0) = (u_AcceptableError.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_AcceptableError.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_AcceptableError.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_AcceptableError.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->AcceptableError);
      union {
        float real;
        uint32_t base;
      } u_Ko;
      u_Ko.real = this->Ko;
      *(outbuffer + offset + 0) = (u_Ko.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_Ko.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_Ko.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_Ko.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->Ko);
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
      } u_Kp;
      u_Kp.base = 0;
      u_Kp.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Kp.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Kp.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Kp.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Kp = u_Kp.real;
      offset += sizeof(this->Kp);
      union {
        float real;
        uint32_t base;
      } u_Ki;
      u_Ki.base = 0;
      u_Ki.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Ki.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Ki.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Ki.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Ki = u_Ki.real;
      offset += sizeof(this->Ki);
      union {
        float real;
        uint32_t base;
      } u_Kd;
      u_Kd.base = 0;
      u_Kd.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Kd.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Kd.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Kd.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Kd = u_Kd.real;
      offset += sizeof(this->Kd);
      union {
        float real;
        uint32_t base;
      } u_AcceptableError;
      u_AcceptableError.base = 0;
      u_AcceptableError.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_AcceptableError.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_AcceptableError.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_AcceptableError.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->AcceptableError = u_AcceptableError.real;
      offset += sizeof(this->AcceptableError);
      union {
        float real;
        uint32_t base;
      } u_Ko;
      u_Ko.base = 0;
      u_Ko.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_Ko.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_Ko.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_Ko.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->Ko = u_Ko.real;
      offset += sizeof(this->Ko);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/PidConstants"; };
    virtual const char * getMD5() override { return "ab0837d7d3687bd9352e4861b8c19aae"; };

  };

}
#endif
