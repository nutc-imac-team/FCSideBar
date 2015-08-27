//
//  FCBaseController.h
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/25.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCBaseController : UIViewController

@property (nonatomic, strong) NSString *sideBarName;

- (void) setCustomSuperViewBackgroundColor:(UIColor*)customBackgroundColor;

@end
