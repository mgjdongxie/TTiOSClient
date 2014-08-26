//
//  DDReceiveKickoffAPI.m
//  Mogujie4iPhone
//
//  Created by 独嘉 on 14-6-29.
//  Copyright (c) 2014年 juangua. All rights reserved.
//

#import "DDReceiveKickoffAPI.h"

@implementation DDReceiveKickoffAPI
- (int)responseServiceID
{
    return DDSERVICE_LOGIN;
}

/**
 *  数据包中的commandID
 *
 *  @return commandID
 */
- (int)responseCommandID
{
    return DDCMD_LOGIN_KICK_USER;
}

/**
 *  解析数据包
 *
 *  @return 解析数据包的block
 */
- (UnrequestAPIAnalysis)unrequestAnalysis
{
    UnrequestAPIAnalysis analysis = (id)^(NSData* data)
    {
        return nil;
    };
    return analysis;
}

@end
