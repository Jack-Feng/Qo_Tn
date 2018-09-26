//
//  CoreDataPublicManager.h
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/20.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MacroDefinitionHeader.h"

@interface CoreDataPublicManager : NSObject

AS_SINGLETON(CoreDataPublicManager);

@property (readonly, strong, nonatomic) NSManagedObjectModel * _Nullable managedObjectModel;

@property (readonly, strong, nonatomic) NSManagedObjectContext * _Nullable mainManagedObjectContext;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator * _Nullable persistentStoreCoordinator;

- (void)saveContext;

- (NSURL *_Nullable)applicationDocumentsDirectory;

@end
