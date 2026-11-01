#ifndef _ROS_rose_tvmc_controller_h
#define _ROS_rose_tvmc_controller_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "rose_tvmc/axes.h"

namespace rose_tvmc
{

  class controller : public ros::Msg
  {
    public:
      typedef rose_tvmc::axes _vals_type;
      _vals_type vals;
      typedef float _left_trigger_type;
      _left_trigger_type left_trigger;
      typedef float _right_trigger_type;
      _right_trigger_type right_trigger;
      typedef int32_t _left_bumper_type;
      _left_bumper_type left_bumper;
      typedef int32_t _right_bumper_type;
      _right_bumper_type right_bumper;
      typedef int32_t _pitch_reset_type;
      _pitch_reset_type pitch_reset;
      typedef int32_t _pitch_hold_type;
      _pitch_hold_type pitch_hold;
      typedef int32_t _yaw_hold_type;
      _yaw_hold_type yaw_hold;

    controller():
      vals(),
      left_trigger(0),
      right_trigger(0),
      left_bumper(0),
      right_bumper(0),
      pitch_reset(0),
      pitch_hold(0),
      yaw_hold(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += this->vals.serialize(outbuffer + offset);
      union {
        float real;
        uint32_t base;
      } u_left_trigger;
      u_left_trigger.real = this->left_trigger;
      *(outbuffer + offset + 0) = (u_left_trigger.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_left_trigger.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_left_trigger.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_left_trigger.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->left_trigger);
      union {
        float real;
        uint32_t base;
      } u_right_trigger;
      u_right_trigger.real = this->right_trigger;
      *(outbuffer + offset + 0) = (u_right_trigger.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_right_trigger.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_right_trigger.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_right_trigger.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->right_trigger);
      union {
        int32_t real;
        uint32_t base;
      } u_left_bumper;
      u_left_bumper.real = this->left_bumper;
      *(outbuffer + offset + 0) = (u_left_bumper.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_left_bumper.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_left_bumper.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_left_bumper.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->left_bumper);
      union {
        int32_t real;
        uint32_t base;
      } u_right_bumper;
      u_right_bumper.real = this->right_bumper;
      *(outbuffer + offset + 0) = (u_right_bumper.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_right_bumper.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_right_bumper.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_right_bumper.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->right_bumper);
      union {
        int32_t real;
        uint32_t base;
      } u_pitch_reset;
      u_pitch_reset.real = this->pitch_reset;
      *(outbuffer + offset + 0) = (u_pitch_reset.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_pitch_reset.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_pitch_reset.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_pitch_reset.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->pitch_reset);
      union {
        int32_t real;
        uint32_t base;
      } u_pitch_hold;
      u_pitch_hold.real = this->pitch_hold;
      *(outbuffer + offset + 0) = (u_pitch_hold.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_pitch_hold.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_pitch_hold.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_pitch_hold.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->pitch_hold);
      union {
        int32_t real;
        uint32_t base;
      } u_yaw_hold;
      u_yaw_hold.real = this->yaw_hold;
      *(outbuffer + offset + 0) = (u_yaw_hold.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_yaw_hold.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_yaw_hold.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_yaw_hold.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->yaw_hold);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += this->vals.deserialize(inbuffer + offset);
      union {
        float real;
        uint32_t base;
      } u_left_trigger;
      u_left_trigger.base = 0;
      u_left_trigger.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_left_trigger.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_left_trigger.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_left_trigger.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->left_trigger = u_left_trigger.real;
      offset += sizeof(this->left_trigger);
      union {
        float real;
        uint32_t base;
      } u_right_trigger;
      u_right_trigger.base = 0;
      u_right_trigger.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_right_trigger.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_right_trigger.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_right_trigger.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->right_trigger = u_right_trigger.real;
      offset += sizeof(this->right_trigger);
      union {
        int32_t real;
        uint32_t base;
      } u_left_bumper;
      u_left_bumper.base = 0;
      u_left_bumper.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_left_bumper.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_left_bumper.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_left_bumper.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->left_bumper = u_left_bumper.real;
      offset += sizeof(this->left_bumper);
      union {
        int32_t real;
        uint32_t base;
      } u_right_bumper;
      u_right_bumper.base = 0;
      u_right_bumper.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_right_bumper.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_right_bumper.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_right_bumper.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->right_bumper = u_right_bumper.real;
      offset += sizeof(this->right_bumper);
      union {
        int32_t real;
        uint32_t base;
      } u_pitch_reset;
      u_pitch_reset.base = 0;
      u_pitch_reset.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_pitch_reset.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_pitch_reset.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_pitch_reset.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->pitch_reset = u_pitch_reset.real;
      offset += sizeof(this->pitch_reset);
      union {
        int32_t real;
        uint32_t base;
      } u_pitch_hold;
      u_pitch_hold.base = 0;
      u_pitch_hold.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_pitch_hold.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_pitch_hold.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_pitch_hold.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->pitch_hold = u_pitch_hold.real;
      offset += sizeof(this->pitch_hold);
      union {
        int32_t real;
        uint32_t base;
      } u_yaw_hold;
      u_yaw_hold.base = 0;
      u_yaw_hold.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_yaw_hold.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_yaw_hold.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_yaw_hold.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->yaw_hold = u_yaw_hold.real;
      offset += sizeof(this->yaw_hold);
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc/controller"; };
    virtual const char * getMD5() override { return "74b3d4a3dd07d5b868ac6ae15eb0fe4b"; };

  };

}
#endif
