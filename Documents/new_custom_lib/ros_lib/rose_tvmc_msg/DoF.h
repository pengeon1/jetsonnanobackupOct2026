#ifndef _ROS_rose_tvmc_msg_DoF_h
#define _ROS_rose_tvmc_msg_DoF_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace rose_tvmc_msg
{

  class DoF : public ros::Msg
  {
    public:
      enum { SURGE =  0 };
      enum { SWAY =  1 };
      enum { HEAVE =  2 };
      enum { ROLL =  3 };
      enum { PITCH =  4 };
      enum { YAW =  5 };

    DoF()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
     return offset;
    }

    virtual const char * getType() override { return "rose_tvmc_msg/DoF"; };
    virtual const char * getMD5() override { return "64f26c9f1200d4d44f88dfc98f9d202e"; };

  };

}
#endif
