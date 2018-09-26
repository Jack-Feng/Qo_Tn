//
//  FEBaseTools.h
//  FEBasePublicClass
//
//  Created by Qo_Tn on 2017/9/29.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FEBaseTools : NSObject

- (void)addduilie;

/**
 转换JSON 方法
 
 @param dic 需要转换的数据
 @return 转换后的数据
 */
+ (id)requestDataForDictionary:(id)dic;

/**
 获取 Geojson 文件内容  并转换 NSDictionary 返回

 @param name Geojson 文件
 @return 返回 NSDictionary
 */
+ (NSDictionary *)setGeoJsonForName:(NSString *)name;


/**
 获取 NSString 文件内容  并转换 NSDictionary 返回
 
 @param name NSString 内容
 @return 返回 NSDictionary
 */
+ (NSDictionary *)setNSStringForNSDictionary:(NSString *)name;

/**
 错误弹框 及 相关文字弹框
 
 @param code 错误内容
 @param error 错误信息
 */
+ (void)setErrorDisposeForSuccessErr:(id)code andFailedErr:(NSError *)error;


/**
 提示框 只含确定按钮
 
 @param data 内容
 */
+ (void)setAlertForData:(id)data;

/**
 获取当前屏幕显示的viewcontroller
 
 @return  返回当前页面
 */
+ (UIViewController *)getCurrentVC;

/**
 视图判断方法 判断试图是否为 tabbar 或者 navigation
 
 @param rootVC 当前视图
 @return  返回当前页面
 */
+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC;

/**
 字典 转 string

 @param object 字典内容
 @return 返回 string
 */
+ (NSString*)DataTOjsonString:(id)object;


/**
 获取当前页面 视图控制器

 @return 返回视图控制器
 */
+ (__kindof UIViewController *)getController:(__kindof UIView *)view;


@end
