//
//  FCDemoView.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/25.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCDemoView.h"

@implementation FCDemoView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.demoButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - 50, CGRectGetMidY(self.frame) - 25, 100, 50)];
        self.demoButton.backgroundColor = [UIColor blackColor];
        self.demoButton.alpha = 0.7;
        self.demoButton.layer.cornerRadius = 5;
        [self.demoButton setTitle:@"Demo" forState:UIControlStateNormal];
        [self addSubview:self.demoButton];
    }
    return self;
}

@end
