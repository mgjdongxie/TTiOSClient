//
//
//  UIImage+DDAddition.m
//  IOSDuoduo
//
//  Created by 独嘉 on 14-6-15.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import "UIImage+DDAddition.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <SDWebImage/SDImageCache.h>
#import "DDPhotosCache.h"
@implementation UIImage (DDAddition)
+ (void)initWithLocalPath:(NSString*)path completion:(DDLoadAssetImageCompletion)completion
{
    NSData* data = [[DDPhotosCache sharedPhotoCache] photoFromDiskCacheForKey:path];
    UIImage *image = [[UIImage alloc] initWithData:data];
    if (image)
    {
        completion(image,nil);
    }
}

+ (UIImage*)imageWithName:(NSString*)imageName
{
    NSString *bundlePath=[[NSBundle mainBundle]pathForResource:@"Resource" ofType:@"bundle"];
    if ([bundlePath length]>0)
    {
        NSBundle *imageBundle=[NSBundle bundleWithPath:bundlePath];
        if (imageBundle!=nil)
        {
            NSString *path=[imageBundle pathForResource:imageName ofType:@"png"inDirectory:nil];
            if ([path length]>0)
            {
                UIImage *image=[UIImage imageWithContentsOfFile:path];
                return image;
            }
        }
    }
    return nil;
}


@end

/*
@implementation UIImage (DDAddition)
+ (void)initWithLocalPath:(NSString*)path completion:(DDLoadAssetImageCompletion)completion
{
    UIImage* image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:path];
    if (image)
    {
        completion(image,nil);
    }
    else
    {
        ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
        [lib assetForURL:[NSURL URLWithString:path] resultBlock:^(ALAsset *asset)
         {
             //在这里使用asset来获取图片
             ALAssetRepresentation *assetRep = [asset defaultRepresentation];
             CGImageRef imgRef = [assetRep fullResolutionImage];
             UIImage *img = [UIImage imageWithCGImage:imgRef
                                                scale:assetRep.scale
                                          orientation:(UIImageOrientation)assetRep.orientation];
             [[SDImageCache sharedImageCache] storeImage:img forKey:path toDisk:YES];
             completion(img,nil);
         }
            failureBlock:^(NSError *error)
         {
             completion(nil,error);
         }
         ];
    }
}
@end*/
