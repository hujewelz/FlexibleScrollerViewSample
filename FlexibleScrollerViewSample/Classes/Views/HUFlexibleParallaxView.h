//
//  HUFlexibleParallaxView.h
//  FoodSharing
//
//  Created by jewelz on 15/6/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HUFlexibleParallaxView;
@protocol HUFlexibleParallaxViewDelegate <NSObject>

- (void)flexibleParallaxViewDidScrollToTop:(HUFlexibleParallaxView *)flexibleView;
- (void)flexibleParallaxViewDidScrollFRomTop:(HUFlexibleParallaxView *)flexibleView;
- (void)flexibleParallaxViewDidScroll:(HUFlexibleParallaxView *)flexibleView;

@end

@interface HUFlexibleParallaxView : UIView
- (instancetype)initWithFrame:(CGRect)frame topView:(UIView *)topView;
- (void)setContentSize:(CGSize)size;
- (void)addSubView:(UIView *)view;

@property (weak, nonatomic) id<HUFlexibleParallaxViewDelegate> delegate;
@property (nonatomic) CGPoint contentOffset;
@end
