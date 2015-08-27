//
//  FCNavigationViewCell.m
//  FCSideBarAnimation
//
//  Created by Francis on 2015/8/25.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCNavigationViewCell.h"

@implementation FCNavigationViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, CGRectGetWidth(self.frame) - 10, CGRectGetHeight(self.frame))];
        [self addSubview:self.nameLabel];
    }
    return self;
}

@end
