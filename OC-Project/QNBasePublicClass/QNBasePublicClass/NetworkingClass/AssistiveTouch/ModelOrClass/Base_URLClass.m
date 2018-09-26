//
//  Base_URLClass.m
//  MRC_TG
//
//  Created by Qo_Tn on 2018/4/13.
//  Copyright © 2018年 Qo_Tn. All rights reserved.
//

#import "Base_URLClass.h"

@interface Base_URLClass ()


@end

@implementation Base_URLClass

//+ (Base_URLClass * _Nullable)sharedInstance
//{
//    static dispatch_once_t once;
//    static Base_URLClass *urlClass = nil;
//    dispatch_once( &once, ^{
//        urlClass = [[Base_URLClass alloc] init];
//    });
//    return urlClass;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)setEnvironmentURLForChange {
    
    if (!self.environmentUrlArray
        && self.environmentUrlArray.count < 3){ // 数组小于 3 个数据，返回
        return NO;
    }
    NSDictionary *dataDic;
    switch (self.demainEnvironment) {
        case DomainNameForDEV: // 测试环境
            dataDic = self.environmentUrlArray[0];
            break;
        case DomainNameForProview: // 演示环境
            dataDic = self.environmentUrlArray[1];
            break;
        case DomainNameForFormal:  // 线上环境
            dataDic = self.environmentUrlArray[2];
            break;
        case DomainNameForCustom: {// 自定义环境
            
            if (self.environmentUrlArray.count == 4) dataDic = self.environmentUrlArray[3];
            else return NO;
        }
            break;
        default:
            break;
    }
    
    [self setEnvironmentURLForTraversal:dataDic];
    
    return YES;
}


/**
 遍历字典中元素，并修改网络接口内容

 @param dic 网络环境内容
 */
- (void)setEnvironmentURLForTraversal:(NSDictionary *)dic {
    
    for (NSString *string in dic.allKeys) {
        
        NSLog(@"--------> %@", string);
        [self setValue:dic[string] forKey:string];
    }
}

- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    
    NSLog(@"value == %@ key == %@", value, key);
}

- (DomainNameForType)demainEnvironment {
    if (!_demainEnvironment) {
        _demainEnvironment = DomainNameForDEV;
    }
    return _demainEnvironment;
}

@end
