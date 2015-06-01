//
//  HUButtonGroup.h
//  FlexibleScrollerViewSample
//
//  Created by jewelz on 15/6/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUButtonGroup : UIView
@property (strong, nonatomic) NSArray *buttons;

- (instancetype)initWithButtons:(NSArray *)buttons;
@end
