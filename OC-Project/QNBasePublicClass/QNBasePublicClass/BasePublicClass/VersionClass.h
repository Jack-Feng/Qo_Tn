//
//  VersionClass.h
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/4/23.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import <Foundation/Foundation.h>

//return @"iPhone 1G";
//if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
//if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
//if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
//if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
//if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
//if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
//if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
//if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
//if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
//if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
//if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
//if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
//if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
//if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
//if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
//if ([deviceString isEqualToString:@"iPhoneX,1"])    return @"iPhone X";

@interface VersionClass : NSObject

// ip 地址
@property (nonatomic, strong) NSString *iPhone_ip;
// 唯一标识码
@property (nonatomic, strong) NSString *iPhone_DeviceId;
// 设备名称
@property (nonatomic, strong) NSString *iPhone_DeviceName;
//// 经度
//@property (nonatomic, strong) NSString *iPhone_Longitude;
//// 纬度
//@property (nonatomic, strong) NSString *iPhone_Latitude;
//// 最后登陆城市
//@property (nonatomic, strong) NSString *iPhone_LastLoginCity;

// 获取 App 版本号
@property (nonatomic, strong) NSString *App_Version;

+ (instancetype)shareInstance;

/**
 获取手机型号
 */
- (NSString*)deviceVersion;




@end
