//
//  FCAnimationBaseView.h
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/24.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCAnimationBaseView : UIView

- (void) setCustomBackgroundColor:(UIColor*)backgroundColor;

- (void) removeAnimation;
- (void) userPanAnimateWithX:(float)animationX y:(float)animationY;
- (void) resetPanAnimate;
- (void) confirmPanAnimate;

@end
