//
//  HUFlexibleParallaxView.m
//  FoodSharing
//
//  Created by jewelz on 15/6/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUFlexibleParallaxView.h" 
static const CGFloat kFlexibleWeight = 0.7;

@interface HUFlexibleParallaxView() <UIScrollViewDelegate>
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGRect defaultTopViewRect;
@end
@implementation HUFlexibleParallaxView

- (instancetype)initWithFrame:(CGRect)frame topView:(UIView *)topView {
    self = [super initWithFrame: frame];
    if (self) {
        _topView = topView;
        [self addSubView:_topView];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.delegate = self;
        [self addSubView:_scrollView];
        
        self.defaultTopViewRect = _topView.frame;
    }
    return self;
}
#pragma mark scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.contentOffset = scrollView.contentOffset;
    if ([_delegate respondsToSelector:@selector(flexibleParallaxViewDidScroll:)]) {
        [self.delegate flexibleParallaxViewDidScroll:self];
    }
    
    if (scrollView.contentOffset.y < 0) {
        
        CGFloat offsetY = -scrollView.contentOffset.y;
        CGFloat oldH = self.defaultTopViewRect.size.height;
        CGFloat oldW = self.defaultTopViewRect.size.width;
        
        CGFloat newH = oldH + offsetY;
        CGFloat newW = oldW * (newH/oldH);
        
        self.topView.frame = CGRectMake(0, 0, newW, newH);
        self.topView.center = CGPointMake(self.center.x, self.topView.center.y);
    
    } else {
        
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY > _topView.height) {
            if ([_delegate respondsToSelector:@selector(flexibleParallaxViewDidScrollToTop:)]) {
                [self.delegate flexibleParallaxViewDidScrollToTop:self];
            }
        }
        
        if (offsetY < _topView.height) {
            if ([_delegate respondsToSelector:@selector(flexibleParallaxViewDidScrollFRomTop:)]) {
                [self.delegate flexibleParallaxViewDidScrollFRomTop:self];
            }
            
        }
        
        [self.topView setY:-offsetY * kFlexibleWeight];
        
    }
    
}

- (void)setContentSize:(CGSize)size {
    [self.scrollView setContentSize:size];
}

- (void)addSubView:(UIView *)view {
    if (self.topView == view || self.scrollView == view) {
        [self addSubview:view];
    } else {
        [self.scrollView addSubview:view];
    }
}

@end
