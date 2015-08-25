//
//  FCDemoController.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/25.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCDemoController.h"
#import "FCAnimationNavigationController.h"
#import "FCAnimationOneController.h"
#import "FCAnimationTwoController.h"
#import "FCAnimationThreeController.h"
#import "FCDemoView.h"

@interface FCDemoController () <FCCustomSideBarCellDelegate>

@property (nonatomic, strong) FCAnimationNavigationController *fcAnimationNavigationController;
@property (nonatomic, strong) FCAnimationOneController *fcAnimationOneController;
@property (nonatomic, strong) FCAnimationTwoController *fcAnimationTwoController;
@property (nonatomic, strong) FCAnimationThreeController *fcAnimationThreeController;
@property (nonatomic, strong) FCDemoView *fcDemoView;
@property (nonatomic, strong) UIView *tempView;

@end

@implementation FCDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fcDemoView = [[FCDemoView alloc] initWithFrame:self.view.frame];
    self.view = self.fcDemoView;
    
    [self.fcDemoView.demoButton addTarget:self action:@selector(demoAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.fcAnimationNavigationController = [[FCAnimationNavigationController alloc] init];
    
    self.fcAnimationOneController = [[FCAnimationOneController alloc] init];
//    self.fcAnimationOneController.sideBarName = @"ControllerOne";
    
    self.fcAnimationTwoController = [[FCAnimationTwoController alloc] init];
//    self.fcAnimationTwoController.sideBarName = @"ControllerTwo";

    self.fcAnimationThreeController = [[FCAnimationThreeController alloc] init];
//    self.fcAnimationThreeController.sideBarName = @"ControllerThree";
    
    self.fcAnimationNavigationController.customViewControllers = @[self.fcAnimationOneController, self.fcAnimationTwoController, self.fcAnimationThreeController];
    
    self.fcAnimationNavigationController.customCellDelegate = self;
}

- (void) demoAction {
    self.tempView = self.fcAnimationNavigationController.view;
    [self.view addSubview:self.tempView];
    CATransition *transition = [CATransition animation];
    [transition setDelegate:self];
    [transition setDuration:0.5f];
    
    [transition setType:kCATransitionFade];
    [transition setSubtype:kCATransitionFromRight];
    [transition setType:@"cube"];
    [self.view.layer addAnimation:transition forKey:@"myTransition"];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self presentViewController:self.fcAnimationNavigationController animated:NO completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor*) fcCustomViewColor {
    return [UIColor whiteColor];
}

- (FCNavigationViewCell*) fcCustomView:(UITableView *)customView fcCustomSideBarCellAtRow:(NSInteger)cellRow {
    FCNavigationViewCell *customCell = [customView dequeueReusableCellWithIdentifier:@"customIdentifier"];
    if (!customCell) {
        customCell = [[FCNavigationViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customIdentifier"];
    }
    customCell.nameLabel.text = [NSString stringWithFormat:@"ViewController%ld", (long)cellRow];
    return customCell;
}


@end
