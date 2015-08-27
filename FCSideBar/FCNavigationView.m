//
//  FCNavigationView.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCNavigationView.h"

@interface FCNavigationView ()

@property (nonatomic, strong) CAShapeLayer *shadowLayer;

@end

@implementation FCNavigationView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    
        self.fcSelectionView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 150, CGRectGetHeight(self.frame))];
        self.fcSelectionView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:self.fcSelectionView];
        
        self.shadowLayer = [CAShapeLayer layer];
        self.shadowLayer.frame = CGRectMake(150, 0, CGRectGetWidth(self.frame) - 150, CGRectGetHeight(self.frame));
        self.shadowLayer.shadowColor = [UIColor blackColor].CGColor;
        CGPathRef shadowPath = [UIBezierPath bezierPathWithRect:self.shadowLayer.bounds].CGPath;
        self.shadowLayer.shadowPath = shadowPath;
        self.shadowLayer.shadowOpacity = 0.8;
        self.shadowLayer.shadowRadius = 3.0;
        [self.layer addSublayer:self.shadowLayer];
    }
    return self;
}

@end
