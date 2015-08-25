//
//  FCAnimationTwoController.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCAnimationTwoController.h"
#import "FCAnimationTwoView.h"

@interface FCAnimationTwoController ()

@property (nonatomic, strong) FCAnimationTwoView *fcAnimationTwoView;

@end

@implementation FCAnimationTwoController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.fcAnimationTwoView = [[FCAnimationTwoView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.fcAnimationTwoView];
    
    [self setCustomSuperViewBackgroundColor:[UIColor blueColor]];
    
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
