//
//  DDTouchDownGestureRecognizer.m
//  IOSDuoduo
//
//  Created by 独嘉 on 14-6-11.
//  Copyright (c) 2014年 dujia. All rights reserved.
//

#import "DDTouchDownGestureRecognizer.h"

#define Response_Y                  -30

@implementation DDTouchDownGestureRecognizer
{
    BOOL _inside;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    self.button.touchDown();
    _inside = YES;
    if (self.touchDown)
    {
        self.touchDown();
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (point.y < Response_Y)
    {
        if (_inside)
        {
            _inside = NO;
            self.moveOutside();
        }
    }
    if (point.y > Response_Y)
    {
        if (!_inside)
        {
            _inside = YES;
            self.moveInside();
        }
    }
    DDLog(@"%@",NSStringFromCGPoint(point));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (point.y > Response_Y)
    {
        self.touchEnd(YES);
    }
    else
    {
        self.touchEnd(NO);
    }
}
@end
