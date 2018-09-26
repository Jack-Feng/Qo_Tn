//
//  QFBaseGroup.m
//  FEBasePublicClass
//
//  Created by Qo_Tn on 2017/9/29.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import "QFBaseGroup.h"

@implementation QFBaseGroup

DEF_SINGLETON(QFBaseGroup)


- (void)addDispatchGroupOrAsync:(dispatchEnterOrLeave _Nullable )dispatchEnter dispatchMain:(dispatchMain _Nullable )dispatchMain Number:(NSInteger)number {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, q, ^{
        
        
        dispatch_group_enter(group);//很重要,不能少
        
        dispatch_group_leave(group);//很重要,不能少
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        // 修改为主队列，后台批量下载，结束后，主线程统一更新UI
        HHLog(@"OK 都所有队列完毕%@", [NSThread currentThread]);
    });
}


@end
