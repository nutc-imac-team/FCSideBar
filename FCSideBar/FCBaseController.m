//
//  FCBaseController.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/25.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCBaseController.h"
#import "FCAnimationBaseView.h"

@interface FCBaseController ()

@property (nonatomic, strong) FCAnimationBaseView *fcAnimationBaseView;

@end

@implementation FCBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fcAnimationBaseView = [[FCAnimationBaseView alloc] initWithFrame:self.view.frame];
    self.view = self.fcAnimationBaseView;
}

- (void) setCustomSuperViewBackgroundColor:(UIColor*)customBackgroundColor {
    [self.fcAnimationBaseView setCustomBackgroundColor:customBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
