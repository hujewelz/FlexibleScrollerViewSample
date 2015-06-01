//
//  UINavigationBar+Extention.m
//  FoodSharing
//
//  Created by jewelz on 15/5/31.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "UINavigationBar+Extention.h"
#import <objc/runtime.h>
const void *MyViewKey = "MyViewKey";
@implementation UINavigationBar (Extention)

- (UIView *)overlay {
    return objc_getAssociatedObject(self, MyViewKey);
}

- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, MyViewKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)fs_setBackgroundColor:(UIColor *)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[[UIImage alloc]init]];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}

@end
