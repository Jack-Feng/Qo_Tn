//
//  QFBaseGroup.h
//  FEBasePublicClass
//
//  Created by Qo_Tn on 2017/9/29.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroDefinitionHeader.h"


typedef void (^dispatchVoid)(__nullable id);

typedef dispatchVoid _Nullable (^dispatchEnterOrLeave)(__nullable id);
typedef dispatchVoid _Nullable (^dispatchMain)(__nullable id);

@interface QFBaseGroup : NSObject

AS_SINGLETON(QFBaseGroup)

/**
 创建队列相关
 
 @param dispatchEnter 队列内容
 @param dispatchMain 成功后返回
 */
- (void)addDispatchGroupOrAsync:(dispatchEnterOrLeave _Nullable )dispatchEnter dispatchMain:(dispatchMain _Nullable )dispatchMain Number:(NSInteger)number;


@end
