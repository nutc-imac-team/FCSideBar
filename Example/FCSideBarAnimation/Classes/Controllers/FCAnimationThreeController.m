//
//  FCAnimationThreeController.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCAnimationThreeController.h"
#import "FCAnimationThreeView.h"

@interface FCAnimationThreeController ()

@property (nonatomic, strong) FCAnimationThreeView *fcAnimationThreeView;

@end

@implementation FCAnimationThreeController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.fcAnimationThreeView = [[FCAnimationThreeView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.fcAnimationThreeView];

    [self setCustomSuperViewBackgroundColor:[UIColor brownColor]];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
