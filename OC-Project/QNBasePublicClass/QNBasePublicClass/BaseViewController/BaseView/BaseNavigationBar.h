//
//  BaseNavigationBar.h
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/5/9.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    NavNormalStyle,
    NavdropStyle,//点击向下展开
    NavLeftViewStyle,//有返回按钮的
    NavcaptionStyle,//有副标题的
    NavRightViewStyle,//有右侧按钮的
    NavRightViewNoTitleStyle,//有右侧按钮的但是只存在图片的
    NavRightAndLeftViewStyle,//同时存在返回和右边按钮
}NavStyle;

@protocol ParentNavigationBarDelegate <NSObject>

-(void)actionBackBut;//返回按钮
-(void)actionRightBut;//点击右边的按钮响应的代理
-(void)actionDropBut:(NSInteger)butTag;//想下展开的按钮代理

@end

@interface BaseNavigationBar : UINavigationBar


@property (nonatomic, assign) id <ParentNavigationBarDelegate> parNavDelegate;//代理
@property (nonatomic, strong) UINavigationItem *navItem;
@property (nonatomic, strong) UILabel *titleLbael;//标题
@property (nonatomic, strong) UILabel *captionTitle;//副标题
@property (nonatomic, strong) UIButton *triangleBut;//中间按钮
@property (nonatomic, strong) UIImageView *imageTriangle;//倒三角图标
@property (nonatomic, strong) UIView *rightView;//右侧VIew
@property (nonatomic, strong) UIView *leftbackView;//右侧VIew

@property (nonatomic) NavStyle navStyle;


-(void)removeRightView;//移除右侧按钮

-(void)removeLeftView;//移除左侧按钮

-(void)setTitleViewLableTitle:(NSString *)title;  // 显示 标题

-(void)setLeftView:(NSString *)title;

-(void)setRightTitleView:(NSString *)title
               textColor:(UIColor *)color
                textFont:(UIFont *)font;  // 显示右侧按钮 纯文字

// 初始化默认 返回 显示内容
-(void)setBackButImageName;

//初始化返回按钮的图片和文字，imageName:返回按钮的图片名字；lableTitle返回按钮的名字

/**
 设置 顶部 左右 按钮 及 标题

 @param leftImage 顶部 左侧图片
 @param leftRect 顶部 左侧图片位置
 @param rightImage 顶部 右侧图片
 @param rightRect 顶部 右侧图片位置
 @param titleLabel 顶部 标题
 */
- (void)setBackButLeftImage:(NSString *)leftImage
              leftImageRect:(CGRect)leftRect
                 RightImage:(NSString *)rightImage
             RightImageRect:(CGRect)rightRect
          setBackLabelTitle:(NSString *)titleLabel;

//初始化导航栏的标题，副标题 title:主标题；captionTitle：副标题（可能是是一个用户名，一个电话号码）
- (void)setTitleViewLableTitle:(NSString*)title
         setCaptionsLableTitle:(NSString*)captionTitle
                 setCaptionTwo:(NSString*)captionTwo;

-(void)setRightButtonTitle:(NSString*)butTitle
       setRightButtonImage:(NSString*)imageName;//初始化导航栏右边的按钮 butTitle:按钮的图片名字；imageName：按钮的名字

-(void)setTitleViewLableTitle:(NSString*)title setbackButton:(NSString*)backTitle;
-(void)reloadTitleLabel;//更新标题
-(void)setTilte:(NSString*)title setTitleLog:(NSString*)logName;
//-(void)setTitleViewLableTitle:(NSString*)title setRightLableTitle:(NSString*)rightTitle;//存在下拉的导航栏


/**
 修改NavigationBar 底部横线问题
 
 @param bol Yes不显示，NO显示
 */
- (void)setNavigationBarImageViewHidden:(BOOL)bol;


@end
