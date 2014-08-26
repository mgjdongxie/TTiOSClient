/************************************************************
 * @file         GroupEntity.m
 * @author       快刀<kuaidao@mogujie.com>
 * summery       群实体信息
 ************************************************************/

#import "DDGroupEntity.h"
#import "DDUserEntity.h"
@implementation DDGroupEntity

//注：由于groupId和userId会存在重复情况，对groupId加个前缀
-(void)setGroupId:(NSString*)gId;
{
 
        _groupId = gId;
    
}


- (void)setGroupUserIds:(NSMutableArray *)groupUserIds
{
    if (_groupUserIds)
    {
        _groupUserIds = nil;
        _fixGroupUserIds = nil;
    }
    _groupUserIds = groupUserIds;
    [groupUserIds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self addFixOrderGroupUserIDS:obj];
    }];
    
}



//-(void)sortGroupUsers
//{
//    if([_groupUserIds count] < 2)
//        return;
//    [_groupUserIds sortUsingComparator:
//         ^NSComparisonResult(NSString* uId1, NSString* uId2)
//         {
//             StateMaintenanceManager* stateMaintenanceManager = [StateMaintenanceManager instance];
//             UserState user1OnlineState = [stateMaintenanceManager getUserStateForUserID:uId1];
//             UserState user2OnlineState = [stateMaintenanceManager getUserStateForUserID:uId2];
//             if((user1OnlineState == USER_STATUS_ONLINE) &&
//                (user2OnlineState == USER_STATUS_LEAVE || user2OnlineState == USER_STATUS_OFFLINE))
//             {
//                 return NSOrderedAscending;
//             }
//             else if(user1OnlineState == USER_STATUS_LEAVE && user2OnlineState == USER_STATUS_OFFLINE)
//             {
//                 return NSOrderedAscending;
//             }
//             else if (user2OnlineState == USER_STATUS_ONLINE &&
//                    (user1OnlineState == USER_STATUS_LEAVE || user1OnlineState == USER_STATUS_OFFLINE))
//             {
//                return NSOrderedDescending;
//             }
//             else if(user2OnlineState == USER_STATUS_LEAVE && user1OnlineState == USER_STATUS_OFFLINE)
//             {
//                 return NSOrderedDescending;
//             }
//             else
//             {
//                 return NSOrderedSame;
//             }
//         }];
//}

-(void)copyContent:(DDGroupEntity*)entity
{
    self.groupType = entity.groupType;
    self.lastUpdateTime = entity.lastUpdateTime;
    self.name = entity.name;
    self.avatar = entity.avatar;
    self.groupUserIds = entity.groupUserIds;
}

+(NSString *)getSessionId:(NSString *)groupId
{
    return groupId;
}

- (void)addFixOrderGroupUserIDS:(NSString*)ID
{
    if (!_fixGroupUserIds)
    {
        _fixGroupUserIds = [[NSMutableArray alloc] init];
    }
    [_fixGroupUserIds addObject:ID];
}

@end
