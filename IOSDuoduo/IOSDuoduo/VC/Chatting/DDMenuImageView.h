//
//  DDMenuImageView.h
//  IOSDuoduo
//
//  Created by 独嘉 on 14-6-12.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDMenuImageView;
typedef NS_ENUM(NSUInteger, DDImageShowMenu)
{
    DDShowEarphonePlay                      = 1,        //听筒播放
    DDShowSpeakerPlay                       = 1 << 1,   //扬声器播放
    DDShowSendAgain                         = 1 << 2,   //重发
    DDShowCopy                              = 1 << 3,   //复制
    DDShowPreview                           = 1 << 4    //图片预览
};

@protocol DDMenuImageViewDelegate <NSObject>

- (void)clickTheCopy:(DDMenuImageView*)imageView;
- (void)clickTheEarphonePlay:(DDMenuImageView*)imageView;
- (void)clickTheSpeakerPlay:(DDMenuImageView*)imageView;
- (void)clickTheSendAgain:(DDMenuImageView*)imageView;
- (void)clickThePreview:(DDMenuImageView*)imageView;

- (void)tapTheImageView:(DDMenuImageView*)imageView;

@end

@interface DDMenuImageView : UIImageView
@property (nonatomic,assign)id<DDMenuImageViewDelegate> delegate;
@property (nonatomic,assign)DDImageShowMenu showMenu;
@end
