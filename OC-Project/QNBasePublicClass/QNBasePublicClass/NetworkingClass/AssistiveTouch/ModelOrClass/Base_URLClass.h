
//
//  Base_URLClass.h
//  
//
//  Created by Qo_Tn on 2018/4/13.
//  Copyright © 2018年 o_Tn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroDefinitionHeader.h"

typedef enum : NSUInteger {
    DomainNameForDEV    = 0,       // 线上环境
    DomainNameForProview  = 1,       // 演示环境
    DomainNameForFormal   = 2,       // 测试环境
    DomainNameForCustom   = 3        // 自定义环境
} DomainNameForType;


@interface Base_URLClass : NSObject

/**
 网络环境配置 
 */
@property (nonatomic, assign) DomainNameForType demainEnvironment;

/**
 需要配置的相关环境名称以及内容
 结构为 默认最少为三个数组，少于三个则提示出错
 
 @[@{},@{},@{},@{}]
 
 */
@property (nonatomic, strong, nonnull) NSArray * environmentUrlArray;

/**
 需要修改的文件名称
 */
@property (nonatomic, strong, nonnull) NSString * ePageName;


/**
 设置环境单例
 */
//+ (Base_URLClass * _Nullable)sharedInstance;


/**
 设置网络环境

 @return 返回 NO 失败 YES 成功
 */
- (BOOL)setEnvironmentURLForChange;

@end
