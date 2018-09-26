//
//  CoreDataPublicManager.m
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/20.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#import "CoreDataPublicManager.h"
#import "MacroDefinitionHeader.h"

@interface CoreDataPublicManager ()

@end

@implementation CoreDataPublicManager


DEF_SINGLETON(CoreDataPublicManager);

#pragma mark - Core Data stack

//@synthesize managedObjectContext = _managedObjectContext;
@synthesize mainManagedObjectContext = _mainManagedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "xy.coredata" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SysMsg" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SysMsg.sqlite"];
    
    HHLog(@"我在appdelegate 数据库的地址是====%@",storeURL);
    
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    //数据迁移
    NSDictionary *optionDictionary = @{NSMigratePersistentStoresAutomaticallyOption:@(YES),NSInferMappingModelAutomaticallyOption:@(YES)};
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:optionDictionary error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        HHLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)mainManagedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_mainManagedObjectContext != nil) {
        return _mainManagedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _mainManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_mainManagedObjectContext setPersistentStoreCoordinator:coordinator];
    
    
    
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(backgroundContextDidSave:) name:NSManagedObjectContextDidSaveNotification  object:self.managedObjectContext];
    
    return _mainManagedObjectContext;
}

//- (NSManagedObjectContext *)managedObjectContext {
//    if (_managedObjectContext != nil) {
//        return _managedObjectContext;
//    }
//    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
//    [_managedObjectContext setParentContext:[self mainManagedObjectContext]];
//
//    return _managedObjectContext;
//}
/**
 *  backgroundContextDidSave
 */
//-(void)backgroundContextDidSave:(NSNotification*)notification{
//
//    [_mainManagedObjectContext performBlock:^{
//        [_mainManagedObjectContext mergeChangesFromContextDidSaveNotification:notification];
//    }];
//}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.mainManagedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            HHLog(@"Unresolved error %@, %@", error, [error userInfo]);
            //            abort();
        }
    }
}

@end
