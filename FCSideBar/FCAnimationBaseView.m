//
//  FCAnimationBaseView.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/24.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCAnimationBaseView.h"

static const NSTimeInterval kSideAnimationDuration = 0.25;
static const NSTimeInterval kShortSideAnimationDuration = 0.1;


@interface FCAnimationBaseView ()

@property (nonatomic, strong) CAShapeLayer *animationBackgroundColorLayer;
@property (nonatomic, strong) UIBezierPath *confirmFromPath;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic) BOOL removeDisplay;

@end

@implementation FCAnimationBaseView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.animationBackgroundColorLayer = [CAShapeLayer layer];
        self.animationBackgroundColorLayer.path = [UIBezierPath bezierPathWithRect:self.frame].CGPath;
        self.animationBackgroundColorLayer.shadowColor = [UIColor blackColor].CGColor;
        self.animationBackgroundColorLayer.shadowOpacity = 0.5;
        self.animationBackgroundColorLayer.shadowRadius = 3.0;
        [self.layer addSublayer:self.animationBackgroundColorLayer];
        
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetPanAnimate)];
        [self.tapGesture setNumberOfTouchesRequired:1];
        [self.tapGesture setNumberOfTapsRequired:1];
        [self addGestureRecognizer:self.tapGesture];
    }
    return self;
}

- (void) setCustomBackgroundColor:(UIColor*)backgroundColor {
    self.animationBackgroundColorLayer.fillColor = backgroundColor.CGColor;
}

- (void) removeAnimation {
    UIBezierPath *originPath = [UIBezierPath bezierPath];
    [originPath moveToPoint:CGPointMake(0, 0)];
    [originPath addCurveToPoint:CGPointMake(0, CGRectGetMaxY(self.frame)) controlPoint1:CGPointMake(0, CGRectGetHeight(self.frame) / 2) controlPoint2:CGPointMake(0, CGRectGetHeight(self.frame) / 2 + 5)];
    [originPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [originPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), 0)];
    [originPath closePath];
    CABasicAnimation *fcRemoveAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    [fcRemoveAnimation setDuration:kSideAnimationDuration];
    [fcRemoveAnimation setDelegate:self];
    [fcRemoveAnimation setFromValue:(NSValue*)self.animationBackgroundColorLayer.path];
    [fcRemoveAnimation setToValue:(NSValue*)originPath.CGPath];
    [fcRemoveAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    self.removeDisplay = true;
    [self.animationBackgroundColorLayer addAnimation:fcRemoveAnimation forKey:@"removeAnimation"];
    self.animationBackgroundColorLayer.path = originPath.CGPath;
}

- (void) userPanAnimateWithX:(float)animationX y:(float)animationY {
    for (UIView *subView in self.subviews) {
        [UIView animateWithDuration:kShortSideAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionCurveLinear animations:^{
            subView.alpha = 0;
        } completion:nil];
        
    }
    
    UIBezierPath *userPath = [UIBezierPath bezierPath];
    
    [userPath moveToPoint:CGPointMake(0, 0)];
    [userPath addCurveToPoint:CGPointMake(0, CGRectGetMaxY(self.frame)) controlPoint1:CGPointMake(animationX, animationY) controlPoint2:CGPointMake(animationX, animationY + 1)];
    [userPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [userPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), 0)];
    [userPath closePath];
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPath];
    
    [shadowPath moveToPoint:CGPointMake(0, 0)];
    [shadowPath addCurveToPoint:CGPointMake(0, CGRectGetMaxY(self.frame)) controlPoint1:CGPointMake(animationX - 1, animationY) controlPoint2:CGPointMake(animationX - 1, animationY + 1)];
    [shadowPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))];
    [shadowPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), 0)];
    [shadowPath closePath];
    
    self.confirmFromPath = userPath;
    self.animationBackgroundColorLayer.path = userPath.CGPath;
    self.animationBackgroundColorLayer.shadowPath = shadowPath.CGPath;
}

- (void) confirmPanAnimate {
    UIBezierPath *confirmPath = [UIBezierPath bezierPath];
    [confirmPath moveToPoint:CGPointMake(150, 0)];
    [confirmPath addCurveToPoint:CGPointMake(150, CGRectGetHeight(self.frame)) controlPoint1:CGPointMake(150, 0) controlPoint2:CGPointMake(150, CGRectGetHeight(self.frame))];
    [confirmPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), CGRectGetHeight(self.frame))];
    [confirmPath addLineToPoint:CGPointMake(CGRectGetMaxX(self.frame), 0)];
    [confirmPath closePath];
    
    self.animationBackgroundColorLayer.shadowPath = confirmPath.CGPath;
    
    CABasicAnimation *fcDisplayAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    [fcDisplayAnimation setDuration:kSideAnimationDuration];
    [fcDisplayAnimation setDelegate:self];
    [fcDisplayAnimation setFromValue:(NSValue*)self.confirmFromPath.CGPath];
    [fcDisplayAnimation setToValue:(NSValue*)confirmPath.CGPath];
    [fcDisplayAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    self.removeDisplay = false;
    [self.animationBackgroundColorLayer addAnimation:fcDisplayAnimation forKey:@"displayAnimation"];
    self.animationBackgroundColorLayer.path = confirmPath.CGPath;
}

- (void) resetPanAnimate {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    for (UIView *subView in self.subviews) {
        [UIView animateWithDuration:kShortSideAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionCurveLinear animations:^{
            subView.alpha = 1;
        } completion:nil];
    }
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:kSideAnimationDuration animations:^{
        weakSelf.window.frame = CGRectMake(0, 0, CGRectGetWidth(weakSelf.window.frame), CGRectGetHeight(weakSelf.window.frame));
    } completion:^(BOOL finished) {
        if (finished) {
            weakSelf.window.frame = CGRectMake(0, 0, CGRectGetWidth(weakSelf.window.frame), CGRectGetHeight(self.window.frame));
            weakSelf.animationBackgroundColorLayer.path = [UIBezierPath bezierPathWithRect:weakSelf.frame].CGPath;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"didResetPanAnimate" object:nil];
            
        }
    }];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        if (self.removeDisplay) {
            [self resetPanAnimate];
        } else {
            self.window.frame = CGRectMake(150, 0, CGRectGetWidth(self.window.frame), CGRectGetHeight(self.window.frame));
            self.animationBackgroundColorLayer.path = [UIBezierPath bezierPathWithRect:self.frame].CGPath;
            for (UIView *subView in self.subviews) {
                subView.alpha = 1;
            }
        }
    }
}

@end
