//
//  FCAnimationNavigationController.h
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/21.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCNavigationViewCell.h"

@protocol FCCustomSideBarCellDelegate <NSObject>

@optional
- (FCNavigationViewCell*) fcCustomView:(UITableView*)customView fcCustomSideBarCellAtRow:(NSInteger)cellRow;
- (UIColor*) fcCustomViewColor;

@end

@interface FCAnimationNavigationController : UINavigationController

@property (nonatomic, weak) id<FCCustomSideBarCellDelegate> customCellDelegate;
@property (nonatomic, strong) NSArray *customViewControllers;

@end
