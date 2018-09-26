//
//  UpdateUrlTableViewController.h
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/18.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateUrlTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, copy) void (^backBlock)(NSIndexPath *);

@end
