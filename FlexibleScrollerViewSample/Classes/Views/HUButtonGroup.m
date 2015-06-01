//
//  HUButtonGroup.m
//  FlexibleScrollerViewSample
//
//  Created by jewelz on 15/6/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUButtonGroup.h"
static const CGFloat kMargin = 20;
static const CGFloat kBUttonW = 44;
@implementation HUButtonGroup

- (instancetype)initWithButtons:(NSArray *)buttons {
    self = [super init];
    if (self) {
        _buttons = buttons;
        [self setUpButtons];
        
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

- (void)setUpButtons {
    //self.backgroundColor = [UIColor redColor];
    for (NSInteger i=0; i<_buttons.count; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((kBUttonW+kMargin)*i, 0, kBUttonW, kBUttonW);
        [button setImage:[UIImage imageNamed:_buttons[i]] forState:UIControlStateNormal];
        [self addSubview:button];
    }
   
}

@end
