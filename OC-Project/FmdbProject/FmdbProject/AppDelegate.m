//
//  AppDelegate.m
//  FmdbProject
//
//  Created by Qo_Tn on 2017/7/13.
//  Copyright © 2017年 Qo_Tn. All rights reserved.
//

#import "AppDelegate.h"
#import "FMDB_HomeVC.h"

@interface AppDelegate ()

@property (nonatomic, strong) FMDB_HomeVC *fmdb_homeVC;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.navigationController =  [self.navigationController initWithRootViewController:self.fmdb_homeVC];
    
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyWindow];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark-     setter&&getter  方法

- (UIWindow *)window {
    
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}

- (FMDB_HomeVC *)fmdb_homeVC {
    
    if (!_fmdb_homeVC) {
        _fmdb_homeVC = [[FMDB_HomeVC alloc] init];
    }
    return _fmdb_homeVC;
    
}

- (UINavigationController *)navigationController {
    
    if (!_navigationController) {
        _navigationController = [[UINavigationController alloc] init];
    }
    return _navigationController;
}

@end
