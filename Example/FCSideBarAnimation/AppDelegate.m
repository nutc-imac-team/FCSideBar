//
//  AppDelegate.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "AppDelegate.h"
#import "FCDemoController.h"

@interface AppDelegate ()

@property (nonatomic, strong) FCDemoController *fcDemoController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.fcDemoController = [[FCDemoController alloc] init];
    self.window.rootViewController = self.fcDemoController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
