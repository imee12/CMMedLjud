//
//  AppDelegate.h
//  CMAvecSound
//
//  Created by Imee Cuison on 11/21/15.
//  Copyright © 2015 Imee Cuison. All rights reserved.
//

//#import <UIKit/UIKit.h>
//#import <CoreData/CoreData.h>
//
//@interface AppDelegate : UIResponder <UIApplicationDelegate>
//
//@property (strong, nonatomic) UIWindow *window;
//
//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;
//
//
//@end


#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface APLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) CMMotionManager *sharedManager;

@end
