//
//  HUFlexibleParallaxViewController.m
//  FoodSharing
//
//  Created by jewelz on 15/6/1.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUFlexibleParallaxViewController.h"
#import "HUFlexibleParallaxView.h"
#import "HUUserInfoView.h"
#import "HUButtonGroup.h"
@interface HUFlexibleParallaxViewController () <HUFlexibleParallaxViewDelegate>
@property (weak, nonatomic) HUButtonGroup *buttonGroup;
@property (weak, nonatomic) HUFlexibleParallaxView *flexibleView;
@property (nonatomic) CGRect defaultRect;
@end

@implementation HUFlexibleParallaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar fs_setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6.jpeg"]];
    topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    HUUserInfoView *userView = [[HUUserInfoView alloc] init];
    userView.frame = CGRectMake(0, CGRectGetMaxY(topView.frame), self.view.width, 100);
    
    HUButtonGroup *buttons = [[HUButtonGroup alloc] initWithButtons:@[@"btn_save",@"btn_share",@"btn_support"]];
    buttons.frame = CGRectMake(180, topView.height+userView.height-70, 200, 44);
    self.defaultRect = buttons.frame;
    self.buttonGroup = buttons;
    
    HUFlexibleParallaxView *flexibleView = [[HUFlexibleParallaxView alloc] initWithFrame:self.view.frame topView:topView];
    flexibleView.delegate = self;
    [self.view addSubview:flexibleView];
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"9.jpg"]];
    imageV.frame = CGRectMake(20, CGRectGetMaxY(userView.frame), self.view.frame.size.width-40, 200);
    imageV.layer.cornerRadius = 10;
    imageV.layer.masksToBounds = YES;
    
    [flexibleView addSubView:userView];
    [flexibleView addSubView:buttons];
    [flexibleView addSubView:imageV];
    [flexibleView setContentSize:CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(imageV.frame)*2.5)];
    
    self.flexibleView = flexibleView;
    
    
}

#pragma mark HUFlexibleParallaxView delegate
- (void)flexibleParallaxViewDidScrollToTop:(HUFlexibleParallaxView *)flexibleView {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.buttonGroup];
}

-(void)flexibleParallaxViewDidScrollFRomTop:(HUFlexibleParallaxView *)flexibleView {
    self.buttonGroup.frame = _defaultRect;
    [self.flexibleView addSubView:self.buttonGroup];
}
- (void)flexibleParallaxViewDidScroll:(HUFlexibleParallaxView *)flexibleView {
    CGFloat offsetY = flexibleView.contentOffset.y;
   // NSLog(@"y:%f", offsetY);
    if (offsetY >0) {
        CGFloat alpha = (offsetY -64) / 64 ;
        alpha = MIN(alpha, 0.9);
        [self.navigationController.navigationBar fs_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar fs_setBackgroundColor:[UIColor clearColor]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
