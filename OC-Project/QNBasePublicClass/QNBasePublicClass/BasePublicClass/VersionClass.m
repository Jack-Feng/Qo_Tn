//
//  VersionClass.m
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/4/23.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import "VersionClass.h"
#import "sys/utsname.h"

#import "VersionBaseClass.h"
#import "MacroDefinitionHeader.h"

@implementation VersionClass

+ (instancetype)shareInstance {
    
    static VersionClass *version = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        version = [[self alloc] init];
    });
    return version;
}

- (NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhoneX,1"])    return @"iPhone X";

    return deviceString;
}

#pragma mark-     setter&&getter

- (NSString *)iPhone_ip {
    if (!_iPhone_ip) {
        _iPhone_ip = [VersionBaseClass getIPAddress];
    }
    return _iPhone_ip;
}

- (NSString *)iPhone_DeviceId {
    if (!_iPhone_DeviceId) {
        if (!UserKey(@"UUIDStr")) UserData(UUIDStr, @"UUIDStr");
        _iPhone_DeviceId = UserKey(@"UUIDStr");
    }
    return _iPhone_DeviceId;
}

- (NSString *)iPhone_DeviceName {
    if (!_iPhone_DeviceName) {
       _iPhone_DeviceName = [VersionBaseClass getDeviceNameAddress];
    }
    return _iPhone_DeviceName;
}

- (NSString *)App_Version {
    if (!_App_Version) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *string1 = [infoDictionary objectForKey:@"CFBundleVersion"];
        NSString *string2 = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        _App_Version = [NSString stringWithFormat:@"%@(%@)", string2, string1];
    }
    return _App_Version;
}

//- (NSString *)iPhone_Longitude {
//    if (!_iPhone_Longitude) {
//
//    }
//    return _iPhone_Longitude;
//}
//
//- (NSString *)iPhone_Latitude {
//    if (!_iPhone_Latitude) {
//
//    }
//    return _iPhone_Latitude;
//}
//
//- (NSString *)iPhone_LastLoginCity {
//    if (!_iPhone_LastLoginCity) {
//
//    }
//    return _iPhone_LastLoginCity;
//}

@end
