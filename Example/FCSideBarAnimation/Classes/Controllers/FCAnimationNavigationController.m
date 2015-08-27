//
//  FCAnimationNavigationController.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCAnimationNavigationController.h"
#import "FCNavigationView.h"
#import "FCAnimationBaseView.h"
#import "FCBaseController.h"

@interface FCAnimationNavigationController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) FCNavigationView *fcNavigationView;
@property (nonatomic, strong) UIPanGestureRecognizer *fcNavigationDisplayGesture;
@property (nonatomic, strong) UIWindow *fcNavigationWindow;
@property (nonatomic) BOOL isTouchFromZero;

@end

@implementation FCAnimationNavigationController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[self.customViewControllers[0]];
    self.navigationBar.hidden = YES;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    self.fcNavigationDisplayGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(displayPanGesture:)];
    [self.view addGestureRecognizer:self.fcNavigationDisplayGesture];
    self.fcNavigationView = [[FCNavigationView alloc] initWithFrame:self.view.frame];
    self.fcNavigationView.fcSelectionView.delegate = self;
    self.fcNavigationView.fcSelectionView.dataSource = self;
    self.fcNavigationView.fcSelectionView.backgroundColor = (self.customCellDelegate) ? [self. customCellDelegate fcCustomViewColor] : [UIColor whiteColor] ;
    
    self.fcNavigationWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.fcNavigationWindow.windowLevel = self.view.window.windowLevel - 1;
    self.fcNavigationWindow.backgroundColor = [UIColor whiteColor];
    self.fcNavigationWindow.hidden = YES;
    [self.fcNavigationWindow addSubview:self.fcNavigationView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didResetAnimateAction) name:@"didResetPanAnimate" object:nil];
}

- (void) didResetAnimateAction {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    self.fcNavigationView.fcSelectionView.userInteractionEnabled = YES;
    [self.fcNavigationDisplayGesture setEnabled:YES];
}

- (void) removeNavigation {
    [self.fcNavigationDisplayGesture setEnabled:YES];
    self.isTouchFromZero = false;
    [(FCAnimationBaseView*)self.visibleViewController.view removeAnimation];
}

- (void) displayPanGesture:(UIPanGestureRecognizer*)panGesture {
    if (self.isTouchFromZero) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        self.fcNavigationWindow.hidden = NO;
        if (panGesture.state == UIGestureRecognizerStateEnded && [panGesture locationInView:self.view].x < CGRectGetWidth([UIScreen mainScreen].bounds) / 2) {
            [panGesture setEnabled:NO];
            [self removeNavigation];
            self.isTouchFromZero = false;
        } else if ([panGesture locationInView:self.view].x >= 150) {
            self.isTouchFromZero = false;
            [panGesture setEnabled:NO];
            self.fcNavigationWindow.hidden = NO;
            [(FCAnimationBaseView*)self.visibleViewController.view confirmPanAnimate];
        } else {
            float moveX = [panGesture locationInView:self.view].x;
            [(FCAnimationBaseView*)self.visibleViewController.view userPanAnimateWithX:moveX y:[panGesture locationInView:self.view].y];
        }
    } else {
        if (panGesture.state == UIGestureRecognizerStateBegan && [panGesture locationInView:self.view].x < 150) {
            self.isTouchFromZero = true;
        } else {
            self.fcNavigationWindow.hidden = YES;
            self.isTouchFromZero = false;
        }
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.customViewControllers.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FCNavigationViewCell *cell;
    if (self.customCellDelegate) {
        cell = [self.customCellDelegate fcCustomView:self.fcNavigationView.fcSelectionView fcCustomSideBarCellAtRow:indexPath.row];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FCNavigationViewCellIdentifier"];
        if (!cell) {
            cell = [[FCNavigationViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FCNavigationViewCellIdentifier"];
        }
        cell.nameLabel.text = ([(FCBaseController*)self.customViewControllers[indexPath.row] sideBarName].length > 0) ? [NSString stringWithFormat:@"%@", [(FCBaseController*)self.customViewControllers[indexPath.row] sideBarName]] : @"";
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.fcNavigationView.fcSelectionView.userInteractionEnabled = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [(FCAnimationBaseView*)self.visibleViewController.view resetPanAnimate];
    if (self.visibleViewController != self.customViewControllers[indexPath.row]) {
        [self pushViewController:self.customViewControllers[indexPath.row] animated:NO];
        self.viewControllers = @[self.customViewControllers[indexPath.row]];
    }
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
