//
//  AssistiveTouch.m
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/18.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import "AssistiveTouch.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UpdateUrlTableViewController.h"

@implementation AssistiveTouch

- (instancetype)init {
    self = [super init];
    if (self) {
        
        CAShapeLayer *solidLine =  [CAShapeLayer layer];
        CGMutablePathRef solidPath =  CGPathCreateMutable();
        solidLine.lineWidth = 2.0f ;
        solidLine.strokeColor = [UIColor orangeColor].CGColor;
        solidLine.fillColor = [UIColor blackColor].CGColor;
        CGPathAddEllipseInRect(solidPath, nil, CGRectMake(20.0f,  50.0f, 40.0f, 40.0f));
        solidLine.path = solidPath;
        CGPathRelease(solidPath);
        [self.layer addSublayer:solidLine];
        
        [self addTapGesture];
    }
    return self;
}

- (void)addTapGesture {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushUrlTableViewController:)];
    
    [self addGestureRecognizer:tapGesture];
}

- (void)pushUrlTableViewController:(BOOL)bol {

    

}

@end
