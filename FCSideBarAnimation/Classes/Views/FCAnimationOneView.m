//
//  FCAnimationOneView.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCAnimationOneView.h"

@implementation FCAnimationOneView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {        
        UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(15, 150, 100, 50)];
        testView.backgroundColor = [UIColor blackColor];
        [self addSubview:testView];
        
        UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 300, 100, 50)];
        testLabel.text = @"Test";
        [self addSubview:testLabel];
        
        UIView *testTwoView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 50)];
        testTwoView.backgroundColor = [UIColor blueColor];
        [self addSubview:testTwoView];
        
        UILabel *testTwoLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 50)];
        testTwoLabel.text = @"TestTwo";
        [self addSubview:testTwoLabel];
    }
    return self;
}

@end
