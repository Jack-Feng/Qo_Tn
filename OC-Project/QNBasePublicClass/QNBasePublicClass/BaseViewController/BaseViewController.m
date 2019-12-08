//
//  BaseViewController.m
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/4/23.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import "BaseViewController.h"

#import "MacroDefinitionHeader.h"

@interface BaseViewController ()<UIScrollViewDelegate, UITableViewDataSource,UITableViewDelegate,ParentNavigationBarDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;  //右滑返回
    
    self.baseNav = [[BaseNavigationBar alloc] initWithFrame:CGRectMake(0, iPhoneX_TOP, SCREEN_SIZE_WIDTH, iPhoneX_NAV - iPhoneX_TOP)];
    self.baseNav.parNavDelegate = self;
    self.baseNav.barTintColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:self.baseNav];
    
    CGRect Rect;
    if (IS_IPHONE_X) {
        Rect = CGRectMake(0, iPhoneX_NAV, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT - iPhoneX_NAV - 35);
    } else {
        Rect = CGRectMake(0, iPhoneX_NAV, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT - iPhoneX_NAV);
    }
    self.baseScrollView = [[UIScrollView alloc] initWithFrame:Rect];
    self.baseScrollView.bounces = NO;
    [self.baseScrollView setDelegate:self];
    self.baseScrollView.showsVerticalScrollIndicator = NO;
    self.baseScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.baseScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

- (void)setBlockedView
{
    self.blockedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT)];
    [self.blockedView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
}

- (void)showBlockedView:(UIView *)carrieView
{
    self.blockedView.frame = CGRectMake(0, -carrieView.frame.size.height, SCREEN_SIZE_WIDTH, carrieView.frame.size.height);
    [carrieView addSubview:self.blockedView];
    [UIView animateWithDuration:0.3 animations:^{
        self.blockedView.frame = CGRectMake(0, 0, SCREEN_SIZE_WIDTH, carrieView.frame.size.height);
    }];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

#pragma mark - ParentNavigationBarDelegate
- (void)actionBackBut
{
    
}

- (void)actionRightBut
{
    
}

- (void)actionDropBut:(NSInteger)butTag
{
    
}

#pragma mark-     setter&&getter

- (UIView *)blockedView {
    if (!_blockedView) {
        _blockedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT)];
        [_blockedView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
    }
    return _blockedView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)popCurrentVC{


}

@end
