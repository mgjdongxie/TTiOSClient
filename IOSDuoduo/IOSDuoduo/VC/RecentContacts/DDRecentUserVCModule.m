//
//  DDRecentUserVCModule.m
//  IOSDuoduo
//
//  Created by 独嘉 on 14-5-26.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import "DDRecentUserVCModule.h"
#import "DDRecentConactsAPI.h"
#import "DDUserModule.h"
#import "DDDatabaseUtil.h"

@interface DDRecentUserVCModule (PrivateAPI)

- (void)p_saveLocalRecentContacts;

@end

@implementation DDRecentUserVCModule
- (void)loadRecentContacts:(DDLoadRecentUsersCompletion)completion
{
    [[DDUserModule shareInstance] loadAllRecentUsers:completion];
}

@end
