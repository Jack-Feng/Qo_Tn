//
//  BaseViewController.h
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/4/23.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseNavigationBar.h"

@interface BaseViewController : UIViewController

//@property (strong, nonatomic) IBOutlet UITableView *glodTableView;

@property (strong, nonatomic) BaseNavigationBar *baseNav;
@property (strong, nonatomic) UIScrollView *baseScrollView;
@property (nonatomic,strong) UIView *blockedView;//半透明遮罩

-(void)setBlockedView;
-(void)showBlockedView:(UIView*)carrieView;
//-(void)addNotWork:(CGRect)rect;

-(void)popCurrentVC;


@end
