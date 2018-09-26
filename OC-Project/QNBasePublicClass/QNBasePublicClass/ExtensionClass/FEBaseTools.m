//
//  FEBaseTools.m
//  FEBasePublicClass
//
//  Created by Qo_Tn on 2017/9/29.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import "FEBaseTools.h"
#import "MacroDefinitionHeader.h"


@implementation FEBaseTools

- (void)addduilie {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, q, ^{
        
 
        dispatch_group_enter(group);//很重要,不能少

        dispatch_group_leave(group);//很重要,不能少
    });
    
    dispatch_group_async(group, q, ^{
        
        dispatch_group_enter(group);
        NSLog(@"队列B启动");
        dispatch_group_leave(group);//很重要,不能少
        
    });

    dispatch_group_async(group, q, ^{
        
        dispatch_group_enter(group);
        NSLog(@"队列C启动");
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        // 修改为主队列，后台批量下载，结束后，主线程统一更新UI
        HHLog(@"OK 都所有队列完毕%@", [NSThread currentThread]);
    });

}

/**
 转换JSON 方法
 
 @param dic 需要转换的数据
 @return 转换后的数据
 */
+ (id)requestDataForDictionary:(id)dic {
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)setGeoJsonForName:(NSString *)name {
    if (name == nil) return nil;
    NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"geojson"];
    NSError *err;
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:path
                                                           encoding:NSUTF8StringEncoding
                                                              error:&err];
    if(err) {
        NSLog(@"GeoJson 获取失败：%@",err);
        return nil;
    }
    return [FEBaseTools setNSStringForNSDictionary:parseJason];
}

+ (NSDictionary *)setNSStringForNSDictionary:(NSString *)name {
    if (name == nil) return nil;

    NSData *jsonData = [name dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark - 相关处理方法 && 错误处理

+ (void)setErrorDisposeForSuccessErr:(id)code andFailedErr:(NSError *)error{
    
    
    NSString *string = [NSString stringWithFormat:@"%@", code?code:error];
    
    NSLog(@"error === %@", string);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cencel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:cencel];
    
    [[FEBaseTools getCurrentVC] presentViewController:alert animated:YES completion:^{ }];
}

+ (void)setAlertForData:(id)data {
    
    NSString *string = [NSString stringWithFormat:@"%@", data];
    NSLog(@"error === %@", string);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cencel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cencel];
    [[FEBaseTools getCurrentVC] presentViewController:alert animated:YES completion:^{ }];
}


//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [FEBaseTools getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [FEBaseTools getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [FEBaseTools getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}


+ (NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData;
    // Pass 0 if you don't care about the readability of the generated string
    jsonData = [NSJSONSerialization dataWithJSONObject:object
                                               options:NSJSONWritingPrettyPrinted
                                                 error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

+ (__kindof UIViewController *)getController:(__kindof UIView *)view {
    UIResponder *nextResponder = [view nextResponder];
    do {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
        nextResponder = [nextResponder nextResponder];
    } while (nextResponder != nil);
    
    return nil;
}

@end
