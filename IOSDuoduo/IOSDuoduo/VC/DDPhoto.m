//
//  DDPhoto.m
//  IOSDuoduo
//
//  Created by 东邪 on 14-6-6.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import "DDPhoto.h"

@implementation DDPhoto
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.localPath=nil;
        self.resultUrl=nil;
        self.imageRef = nil;
        self.image= nil;
    }
    return self;
}
- (void)dealloc
{
    self.localPath=nil;
    self.resultUrl=nil;
    CGImageRelease(self.imageRef);
    self.image= nil;
}
@end
