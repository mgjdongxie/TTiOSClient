//
//  DDChattingMainViewController.h
//  IOSDuoduo
//
//  Created by 东邪 on 14-5-26.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSMessageInputView.h"
#import "RecorderManager.h"
#import "PlayerManager.h"
#import "DDPhoto.h"
#import "JSMessageTextView.h"
#import "DDMessageEntity.h"
#import "DDChattingModule.h"
#import "DDEmotionsViewController.h"
@class DDChatUtilityViewController;
@class DDEmotionsViewController;
@class DDSessionEntity;
@class DDRecordingView;
@interface DDChattingMainViewController : UIViewController<UITextViewDelegate, JSMessageInputViewDelegate,UITableViewDataSource,UITableViewDelegate,RecordingDelegate,PlayingDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate,UIAlertViewDelegate,DDEmotionsViewControllerDelegate>
{
    DDRecordingView* _recordingView;
}
@property(nonatomic,strong)DDChattingModule* module;
@property(nonatomic,strong)DDChatUtilityViewController *ddUtility;
@property(nonatomic,strong)JSMessageInputView *chatInputView;
@property (assign, nonatomic) CGFloat previousTextViewContentHeight;
@property(nonatomic,weak)IBOutlet UITableView *tableView;
@property(nonatomic,strong)DDEmotionsViewController *emotions;
@property (assign, nonatomic, readonly) UIEdgeInsets originalTableViewContentInset;
@property (nonatomic, strong) UIRefreshControl* refreshControl;
+(instancetype )shareInstance;

-(void)sendImageMessage:(DDPhoto *)photo;
- (void)showChattingContentForSession:(DDSessionEntity*)session;
-(void)insertEmojiFace:(NSString *)string;
-(void)deleteEmojiFace;
@end


@interface DDChattingMainViewController(ChattingInput)
- (void)initialInput;
@end
