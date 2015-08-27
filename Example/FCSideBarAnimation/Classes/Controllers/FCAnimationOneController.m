//
//  FCAnimationOneController.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCAnimationOneController.h"
#import "FCAnimationOneView.h"

@interface FCAnimationOneController ()

@property (nonatomic, strong) FCAnimationOneView *fcAnimationOneView;

@end

@implementation FCAnimationOneController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.fcAnimationOneView = [[FCAnimationOneView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.fcAnimationOneView];
    [self setCustomSuperViewBackgroundColor:[UIColor greenColor]];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
