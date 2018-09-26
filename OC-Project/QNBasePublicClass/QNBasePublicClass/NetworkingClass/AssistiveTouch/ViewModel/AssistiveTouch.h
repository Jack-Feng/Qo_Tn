//
//  AssistiveTouch.h
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/18.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssistiveTouch : UIView

@property (nonatomic, copy) void (^blockTouch)(void);

@end
