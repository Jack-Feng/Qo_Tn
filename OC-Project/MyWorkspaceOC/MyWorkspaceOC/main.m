//
//  main.m
//  MyWorkspaceOC
//
//  Created by Qo_Tn on 2017/7/13.
//  Copyright © 2017年 Qo_Tn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        @try {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        } @catch (NSException *exception) {
            UncaughtExceptionHandler(exception);
            NSLog(@"exception == %@", exception);
        }
    }
}
