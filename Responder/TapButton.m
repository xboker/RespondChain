//
//  TapButton.m
//  Responder
//
//  Created by xiekunpeng on 2019/4/4.
//  Copyright © 2019 xboker. All rights reserved.
//

#import "TapButton.h"

@implementation TapButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.hidden == YES || self.alpha < 0.01) {//0.01临界值
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        __block UIView *view = nil;
        ///遍历当前视图的subviews
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //转换坐标
            CGPoint thePoint = [self convertPoint:point toView:obj];
            //子视图调用
            view = [obj hitTest:thePoint withEvent:event];
            if (view) {
                *stop = YES;
            }
        }];
        if (view != nil) {
            return view;
        }else {
            return self;
        }
    }else {
        ///点击区域不在当前视图范围内, 不要响应
        return  nil;
    }
}



- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat x = point.x;
    CGFloat y = point.y;
    CGFloat centerX = self.center.x;
    CGFloat centerY = self.center.y;
    ///点击点与空间中心点距离
    double twoPointOffset = sqrt(pow((x - centerX), 2) + pow(y - centerY, 2));
    //判断是否在圆形区域内
    if (twoPointOffset <= self.frame.size.width / 2) {
        return YES;
    }
    return NO;
}






@end
