//
//  BaseNavigationBar.m
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/5/9.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import "BaseNavigationBar.h"
#import "MacroDefinitionHeader.h"

#import "CalculateSize.h"

@interface BaseNavigationBar ()

@end

@implementation BaseNavigationBar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.frame = CGRectMake(0,44,SCREEN_SIZE_WIDTH, iPhoneX_NAV);
        self.navItem = [[UINavigationItem alloc] initWithTitle:@""];
        [self pushNavigationItem:self.navItem animated:YES];
        
    
        //[self setTintColor:[UIColor colorWithRed:34/255.0 green:37/255.0 blue:38/255.0 alpha:1.0]];
        // [self setBackgroundColor:[UIColor colorWithRed:34/255.0 green:37/255.0 blue:38/255.0 alpha:1.0]];
        

        self.translucent = YES;
        
        
        //  [self setBarTintColor:[UIColor colorWithRed:0.05f green:0.16f blue:0.28f alpha:1.00f]];
        
        //[self setBarTintColor:[UIColor colorWithRed:32/255.0 green:35/255.0 blue:45/255.0 alpha:1.0]];//original
        //[self setBarTintColor:UIColorFromRGB(0x0e2947)];
        [self setBackgroundColor:UIColorFromRGB(0xffffff)];
        
        
        // [self setBackgroundColor:[UIColor colorWithRed:32/255.0 green:35/255.0 blue:45/255.0 alpha:1.0]];
        self.translucent = NO;
        self.barStyle = UIBarStyleDefault;
        
        //self.tintColor = [UIColor colorWithRed:34/255.0 green:37/255.0 blue:38/255.0 alpha:1.0];
    }
    return self;
}

/**
 设置通用 顶部头
 */
- (void)setBackButImageName {
    [self addleftView];
}

/**
 设置 顶部 左右 按钮 及 标题
 
 @param leftImage 顶部 左侧图片
 @param leftRect 顶部 左侧图片位置
 @param rightImage 顶部 右侧图片
 @param rightRect 顶部 右侧图片位置
 @param titleLabel 顶部 标题
 */
- (void)setBackButLeftImage:(NSString *)leftImage leftImageRect:(CGRect)leftRect RightImage:(NSString *)rightImage RightImageRect:(CGRect)rightRect setBackLabelTitle:(NSString *)titleLabel {
    
//    设置左侧 View
    self.leftbackView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, 70*SuitWidth, iPhoneX_NAV-iPhoneX_TOP)];
    self.leftbackView.backgroundColor = [UIColor clearColor];
    [self addSubview: self.leftbackView];
//    在左侧 View 上增加 图片 和 按钮
    [self.leftbackView addSubview:[self setImageViewForName:leftImage
                                                     CGRect:leftRect]];
    [self.leftbackView addSubview:[self setButtonForName:@"" tag:0 Frame:self.leftbackView.frame]];

//    增加右侧 View
    self.rightView = [[UIView alloc] initWithFrame: CGRectMake(SCREEN_SIZE_WIDTH-70*SuitWidth, 0, 70*SuitWidth, iPhoneX_NAV-iPhoneX_TOP)];
    self.rightView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.rightView];
//    增加 右侧 图片 及 点击按钮
    [self.rightView addSubview:[self setImageViewForName:rightImage CGRect:rightRect]];
    [self.rightView addSubview:[self setButtonForName:@"" tag:3 Frame:CGRectMake(0, 0, 70 * SuitWidth, iPhoneX_NAV-iPhoneX_TOP)]];
    
//    增加中间 标题栏
//    CGSize size= [CalculateSize IphoneSizeString:titleLabel setSize:18 setwithe:(SCREEN_SIZE_WIDTH - 140 * SuitWidth)];
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(70*SuitWidth, iPhoneX_TOP, SCREEN_SIZE_WIDTH - 140*SuitWidth, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    self.titleLbael = [[UILabel alloc]init];
    self.titleLbael.text = titleLabel;
    self.titleLbael.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:18];
    self.titleLbael.textColor = UIColorFromRGB(0x222222);
    self.titleLbael.backgroundColor = [UIColor clearColor];
    self.titleLbael.textAlignment = NSTextAlignmentCenter;
    self.titleLbael.frame = CGRectMake(0, 0, SCREEN_SIZE_WIDTH - 140*SuitWidth, 44);
    [titleView addSubview:self.titleLbael];
    
    self.navItem.titleView = titleView;
}

// 设置右侧按钮  纯文字
-(void)setRightTitleView:(NSString *)title textColor:(UIColor *)color textFont:(UIFont *)font {
    
    //    增加右侧 View
    self.rightView = [[UIView alloc] initWithFrame: CGRectMake(SCREEN_SIZE_WIDTH-70*SuitWidth, 0, 70*SuitWidth, iPhoneX_NAV-iPhoneX_TOP)];
    self.rightView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.rightView];
    UIButton *button = [self setButtonForName:title
                                          tag:3
                                        Frame:CGRectMake(0, 0, 70 * SuitWidth, iPhoneX_NAV-iPhoneX_TOP)];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = font;
    //    增加 右侧 点击按钮 及 文字
    [self.rightView addSubview:button];
    
}

- (void)setTitleViewLableTitle:(NSString*)title setCaptionsLableTitle:(NSString*)captionTitle setCaptionTwo:(NSString*)captionTwo{
    
    [self addleftView];
    [self addTitleView:title setcaptionsLable:captionTitle setCaptionTwo:captionTwo];
}

-(void)setTitleViewLableTitle:(NSString*)title setbackButton:(NSString*)backTitle{
    
    [self addleftView];
    [self addTitleView:title setcaptionsLable:@"" setCaptionTwo:@""];
}

-(void)setTitleViewLableTitle:(NSString*)title setRightLableTitle:(NSString*)rightTitle{
    
    
}

-(void)setTilte:(NSString*)title setTitleLog:(NSString*)logName{
    
    UIImage *image = [UIImage imageNamed:logName];
    CGSize size=[CalculateSize IphoneSizeString:title setSize:20 setwithe:SCREEN_SIZE_WIDTH];
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_SIZE_WIDTH-size.width)/2, iPhoneX_TOP, size.width+4+image.size.width/2, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    self.titleLbael = [[UILabel alloc]init];
    self.titleLbael.text = title;
    self.titleLbael.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:20];
    self.titleLbael.textColor = [UIColor whiteColor];
    self.titleLbael.backgroundColor = [UIColor clearColor];
    self.titleLbael.frame = CGRectMake(4+image.size.width/2, (44-size.height)/2, size.width+20, size.height);
    [titleView addSubview:self.titleLbael];
    
    UIImageView *logImage = [[UIImageView alloc]init];
    logImage.image = image;
    logImage.frame  = CGRectMake(0, (44-image.size.height/2)/2, image.size.width/2, image.size.height/2);
    [titleView addSubview:logImage];
    
    self.navItem.titleView = titleView;
}

-(void)setLeftView:(NSString*)title{
    
    
    if (title==nil) {
        
        [self.navItem setLeftBarButtonItem:nil];
    } else {
        
        UIView *leftView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, 50 * SuitWidth, 44)];
        leftView.backgroundColor = [UIColor clearColor];
        UIButton *homeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50 * SuitWidth, 44)];
        homeButton.backgroundColor = [UIColor clearColor];
        homeButton.tag =0;
        homeButton.adjustsImageWhenHighlighted=NO;
        homeButton.showsTouchWhenHighlighted=YES;
        [homeButton addTarget:self action:@selector(triggerEvent:) forControlEvents:UIControlEventTouchUpInside];
        [leftView addSubview:homeButton];
        UIBarButtonItem *homeButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
        [self.navItem setLeftBarButtonItem:homeButtonItem];
        UILabel *backLable = [[UILabel alloc]init];
        backLable.text =title;
        backLable.font = [UIFont systemFontOfSize:16];
        //backLable.textColor = kUIColorFromRGB(0x177ee6);
        backLable.textColor = [UIColor whiteColor];
        backLable.backgroundColor = [UIColor clearColor];
        CGSize UserNamesize=[CalculateSize CalculateSizeString:title setSize:16 setwithe:SCREEN_SIZE_WIDTH];
        backLable.frame = CGRectMake(0, (44-UserNamesize.height)/2, UserNamesize.width, UserNamesize.height);
        [leftView addSubview:backLable];
    }
}



-(void)setTitleViewLableTitle:(NSString*)title{
    [self addTitleView:title setcaptionsLable:@"" setCaptionTwo:@""];
}
-(void)setRightButtonTitle:(NSString*)butTitle setRightButtonImage:(NSString*)imageName{
    
    self.rightView = [[UIView alloc]initWithFrame: CGRectMake(SCREEN_SIZE_WIDTH-50*SuitWidth, iPhoneX_TOP, 50*SuitWidth, 44)];
    self.rightView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.rightView];
    UIButton *homeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50*SuitWidth, 44)];
    homeButton.backgroundColor = [UIColor clearColor];
    homeButton.tag = 3;
    homeButton.adjustsImageWhenHighlighted = NO;
    [homeButton addTarget:self action:@selector(triggerEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    homeButton.adjustsImageWhenDisabled=NO;
    // homeButton.showsTouchWhenHighlighted=YES;
    
    //    UIBarButtonItem *homeButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightView];
    //    [self.navItem setRightBarButtonItem:homeButtonItem];
    if (self.navStyle == NavRightViewNoTitleStyle)
    {
        UIImage *imgae =[UIImage imageNamed:imageName];
        
        UIImageView *homeButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50*SuitWidth-imgae.size.width/2-15, 12.5, imgae.size.width/2, imgae.size.height/2)];
        
        homeButtonImageView.image = imgae;
        [self.rightView addSubview:homeButtonImageView];
    }
    else
    {
        UILabel *backLable = [[UILabel alloc]init];
        backLable.text =butTitle;
        backLable.font = [UIFont systemFontOfSize:16];
        //backLable.textColor = kUIColorFromRGB(0x177ee6);
        backLable.textColor = [UIColor whiteColor];
        backLable.backgroundColor = [UIColor clearColor];
        CGSize UserNamesize=[CalculateSize CalculateSizeString:butTitle setSize:16 setwithe:SCREEN_SIZE_WIDTH];
        //        backLable.frame = CGRectMake(12.5, (44-UserNamesize.height)/2, UserNamesize.width, UserNamesize.height);
        backLable.frame = CGRectMake(50*SuitWidth-UserNamesize.width, (44-UserNamesize.height)/2, UserNamesize.width, UserNamesize.height);
        [self.rightView addSubview:backLable];
    }
    [self.rightView addSubview:homeButton];
}

-(void)removeRightView{
    
    for (UIView *subView in self.rightView.subviews) {
        [subView removeFromSuperview];
    }
    [self.rightView removeFromSuperview];
    self.rightView = nil;
}

-(void)removeLeftView{
    //    for (UIView *subView in self.) {
    //        [subView removeFromSuperview];
    //    }
    //    [self.rightView removeFromSuperview];
    //    self.rightView = nil;
}

-(void)addTitleView:(NSString*)title setcaptionsLable:(NSString*)capTitle setCaptionTwo:(NSString*)caTwoTitle{
    CGSize size=[CalculateSize IphoneSizeString:title setSize:20 setwithe:SCREEN_SIZE_WIDTH];
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_SIZE_WIDTH-size.width)/2, iPhoneX_TOP, size.width, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    self.titleLbael = [[UILabel alloc]init];
    self.titleLbael.text = title;
    self.titleLbael.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:18];
    self.titleLbael.textColor = UIColorFromRGB(0x222222);
    self.titleLbael.backgroundColor = [UIColor clearColor];
    self.titleLbael.frame = CGRectMake(0, (44-size.height)/2, size.width+20, size.height);
    [titleView addSubview:self.titleLbael];
    
    if (self.navStyle == NavcaptionStyle) {
        CGSize size=[CalculateSize IphoneSizeString:title setSize:15 setwithe:SCREEN_SIZE_WIDTH];
        self.titleLbael.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
        CGSize caTsize=[CalculateSize IphoneSizeString:caTwoTitle setSize:15 setwithe:SCREEN_SIZE_WIDTH];
        
        titleView.frame =CGRectMake((SCREEN_SIZE_WIDTH-size.width)/2, iPhoneX_TOP, size.width+caTsize.width+20, 44);
        
        self.titleLbael.frame = CGRectMake(0, (44-size.height)/2-10, size.width+10, size.height);
        
        self.captionTitle = [[UILabel alloc]init];
        self.captionTitle.text = capTitle;
        self.captionTitle.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
        self.captionTitle.textColor = UIColorFromRGB(0x737780);
        self.captionTitle.backgroundColor = [UIColor clearColor];
        CGSize captionssize=[CalculateSize IphoneSizeString:@"10-22  10:40:23" setSize:12 setwithe:SCREEN_SIZE_WIDTH];
        self.captionTitle.frame = CGRectMake((size.width+20+caTsize.width-captionssize.width)/2, (44-captionssize.height)/2+10, captionssize.width, captionssize.height);
        [titleView addSubview:self.captionTitle];
        
        
        UILabel *caTwoLable = [[UILabel alloc]init];
        caTwoLable.text = caTwoTitle;
        caTwoLable.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
        caTwoLable.textColor = [UIColor whiteColor];
        caTwoLable.backgroundColor = [UIColor clearColor];
        caTwoLable.frame = CGRectMake(size.width+5, (44-captionssize.height)/2-10, caTsize.width+10, caTsize.height);
        [titleView addSubview:caTwoLable];
        
    }else if (self.navStyle == NavdropStyle){
        titleView.frame = CGRectMake((SCREEN_SIZE_WIDTH-size.width-19)/2, iPhoneX_TOP, size.width+19, 44);
        self.titleLbael.frame = CGRectMake(0, (44-size.height)/2, size.width+5, size.height);
        self.imageTriangle = [[UIImageView alloc]init];
        self.imageTriangle.image = [UIImage imageNamed:@"imageTriangle"];
        self.imageTriangle.frame = CGRectMake(size.width+6, 18, 13, 8);
        [titleView addSubview:self.imageTriangle];
        
        self.triangleBut = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, size.width+19, 44)];
        self.triangleBut.backgroundColor = [UIColor clearColor];
        self.triangleBut.tag =2;
        [self.triangleBut addTarget:self action:@selector(triggerEvent:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:self.triangleBut];
    }
    self.navItem.titleView = titleView;
}

-(void)reloadTitleLabel{
    
    if (self.navStyle == NavdropStyle) {
        CGSize size=[CalculateSize IphoneSizeString:self.titleLbael.text setSize:20 setwithe:SCREEN_SIZE_WIDTH];
        self.titleLbael.frame = CGRectMake(0, (44-size.height)/2, size.width+5, size.height);
        self.imageTriangle.frame = CGRectMake(size.width+6, 18, 13, 8);
    }
}

/*创建leftView*/

-(void)addleftView{
    
    self.leftbackView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, 70*SuitWidth, iPhoneX_NAV-iPhoneX_TOP)];
    self.leftbackView.backgroundColor = [UIColor clearColor];
    [self addSubview: self.leftbackView];
    
    //    在左侧 View 上增加 图片 和 按钮
    [self.leftbackView addSubview:[self setImageViewForName:@"BackImage" CGRect:CGRectMake(15, 12.5, 10, 19)]];
    [self.leftbackView addSubview:[self setButtonForName:@"" tag:0 Frame:self.leftbackView.frame]];
}


#pragma mark-     setter  &&  getter

/**
 图片 创建处理方法
 @param imageName   图片名称
 @param rect        显示尺寸
 @return 返回        image
 */
- (UIImageView *)setImageViewForName:(NSString *)imageName CGRect:(CGRect)rect{
    
    UIImageView *homeButtonImageView = [[UIImageView alloc] init];
    homeButtonImageView.userInteractionEnabled = YES;
    UIImage *leftImage = [UIImage imageNamed:imageName];
    homeButtonImageView.image = leftImage;
//    homeButtonImageView.frame = CGRectMake(15, 12.5, 10, 19);
    homeButtonImageView.frame = rect;
    return homeButtonImageView;
}

- (UIButton *)setButtonForName:(NSString *)btnName tag:(NSInteger)tag Frame:(CGRect)rect{
    
    UIButton *homeButton = [[UIButton alloc] initWithFrame:rect];
//  CGRectMake(0, 0, 70*SuitWidth, iPhoneX_NAV - iPhoneX_TOP)];
    [homeButton setTitle:btnName forState:UIControlStateNormal];
    homeButton.backgroundColor = [UIColor clearColor];
    homeButton.tag = tag;
    homeButton.adjustsImageWhenHighlighted = NO;
    homeButton.adjustsImageWhenDisabled = NO;
    [homeButton addTarget:self action:@selector(triggerEvent:) forControlEvents:UIControlEventTouchUpInside];
    return homeButton;
}

#pragma mark -     点击事件

- (void)triggerEvent:(UIButton*)sender{
    switch (sender.tag) {
        case 0:
        {
            if ([self.parNavDelegate respondsToSelector:@selector(actionBackBut)]) {
                [self.parNavDelegate actionBackBut];
            }
            break;
        }
        case 1:{
            
            break;
        }
        case 2:{
            if ([self.parNavDelegate respondsToSelector:@selector(actionDropBut:)]) {
                [self.parNavDelegate actionDropBut:sender.tag];
            }
            sender.tag = 4;
            break;
        }
        case 3:
        {
            if ([self.parNavDelegate respondsToSelector:@selector(actionRightBut)])
            {
                [self.parNavDelegate actionRightBut];
            }
            break;
        }
        case 4:
        {
            if ([self.parNavDelegate respondsToSelector:@selector(actionDropBut:)])
            {
                [self.parNavDelegate actionDropBut:sender.tag];
            }
            sender.tag =2;
            break;
        }
        default:
            break;
    }
}

- (void)setNavigationBarImageViewHidden:(BOOL)bol {
    
    if (bol) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
    } else {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:nil];
    }
}

@end
