//
//  HUUserInfoView.m
//  FlexibleScrollerViewSample
//
//  Created by jewelz on 15/6/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUUserInfoView.h"

@implementation HUUserInfoView

- (void)awakeFromNib {
    self.userIcon.layer.cornerRadius = self.userIcon.width / 2;
    self.userIcon.layer.masksToBounds = YES;
}

- (instancetype)init {
    return [[[NSBundle mainBundle] loadNibNamed:@"UserInfoView" owner:nil options:nil] lastObject];
}

@end
