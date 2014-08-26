//
//  UIImage+DDAddition.h
//  IOSDuoduo
//
//  Created by 独嘉 on 14-6-15.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DDLoadAssetImageCompletion)(UIImage* image,NSError* error);

@interface UIImage (DDAddition)
+ (void)initWithLocalPath:(NSString*)path completion:(DDLoadAssetImageCompletion)completion;
+ (UIImage*)imageWithName:(NSString*)imageName;
@end
