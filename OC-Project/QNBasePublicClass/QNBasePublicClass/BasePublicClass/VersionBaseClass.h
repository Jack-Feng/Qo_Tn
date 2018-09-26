//
//  VersionBaseClass.h
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/5/12.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VersionBaseClass : NSObject

/**
 获取ip 地址

 @return ip 地址
 */
+ (NSString *)getIPAddress;

/**
 获取ip 地址
 
 @return ip 地址
 */
+ (NSString *)getDeviceNameAddress;

@end
