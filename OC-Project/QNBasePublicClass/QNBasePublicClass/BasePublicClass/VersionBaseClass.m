//
//  VersionBaseClass.m
//  JCBasePublicClass
//
//  Created by Qo_Tn on 2018/5/12.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import "VersionBaseClass.h"

#import <ifaddrs.h>
#import <arpa/inet.h>

#import "MacroDefinitionHeader.h"


@interface VersionBaseClass ()

@end

@implementation VersionBaseClass

// 获取设备IP地址
+ (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // 检索当前接口,在成功时,返回0
    
    @try {
        success = getifaddrs(&interfaces);
        if (success == 0) {
            // 循环链表的接口
            temp_addr = interfaces;
            while(temp_addr != NULL) {
                if(temp_addr->ifa_addr->sa_family == AF_INET) {
                    // 检查接口是否en0 wifi连接在iPhone上
                    if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                        // 得到NSString从C字符串
                        address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    }
                }
                temp_addr = temp_addr->ifa_next;
            }
        }
        // 释放内存
        freeifaddrs(interfaces);
    } @catch (NSException *exception) {
        HHLog(@"----->%@", exception);
    }
    return address;
}

+ (NSString *)getDeviceNameAddress {

    return [NSString stringWithFormat:@"%@+%@",[[UIDevice currentDevice] model],[[UIDevice currentDevice] name]];
}


@end
