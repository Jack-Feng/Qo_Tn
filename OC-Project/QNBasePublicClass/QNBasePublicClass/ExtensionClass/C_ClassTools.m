//
//  C_ClassTools.m
//  QNBasePublicClass
//
//  Created by Qo_Tn on 2019/11/11.
//  Copyright © 2019 Qo_Tn. All rights reserved.
//

#import "C_ClassTools.h"


// 设置一个C函数，用来接收崩溃信息
void UncaughtExceptionHandler(NSException *exception) {
    // 可以通过exception对象获取一些崩溃信息，我们就是通过这些崩溃信息来进行解析的，例如下面的symbols数组就是我们的崩溃堆栈。
    NSArray *symbols = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *caches = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithContentsOfFile:[caches stringByAppendingPathComponent:@"zplan_crash.plist"]];
    
    if (!dictM) {
        dictM = [NSMutableDictionary dictionary];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmssSSS";
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    
    
    NSDictionary *dict = @{
                           timestamp : @{
                                   [timestamp stringByAppendingString:@"name"] : name,
                                   [timestamp stringByAppendingString:@"_reason"] : reason,
                                   [timestamp stringByAppendingString:@"__symbols"] : symbols
                                   }
                           };
    [dictM setValuesForKeysWithDictionary:dict];
    [dictM writeToFile:[caches stringByAppendingPathComponent:@"zplan_crash.plist"] atomically:YES];
}

