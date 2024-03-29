//
//  HotelAppDelegate.m
//  Hotel
//
//  Created by danal on 5/10/11.
//  Copyright danal 2011. All rights reserved.
//

#import "HotelAppDelegate.h"
#import "FileController.h"
#import "LoginViewController.h"
@implementation HotelAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize viewController;

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
//    
//    // Override point for customization after application launch.
//    
//    // Add the view controller's view to the window and display.
//    [window addSubview:viewController.view];
//    [window makeKeyAndVisible];
//    
//    return YES;
//}

//
- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
	//[application setStatusBarHidden:YES animated:YES];
     //添加主视图
    [window addSubview:tabBarController.view];
    //添加登陆视图
	[window addSubview:viewController.view];
	//copy the sqlite file to documents directory
	NSFileManager *fm = [NSFileManager defaultManager];
	NSString *path = [self applicationDocumentsDirectory];
	path = [path stringByAppendingPathComponent:@"CoreData.sqlite"];
	if(![fm fileExistsAtPath:path]){
		NSString *pathInBundle = [[NSBundle mainBundle] pathForResource:@"CoreData" ofType:@"sqlite"];
    
		NSError *error;
		[fm copyItemAtPath:pathInBundle toPath:path error:&error];
	}
}

-(void)applicationWillTerminate:(UIApplication *)application {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	[fileManager removeItemAtPath:[FileController fullpathOfFilename:kOrderListFile] error:&error];
}
/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/
#pragma mark -
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"CoreData.sqlite"]];
	
	NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 
		 Typical reasons for an error here include:
		 * The persistent store is not accessible
		 * The schema for the persistent store is incompatible with current managed object model
		 Check the error message to determine what the actual problem was.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
    }    
	
    return persistentStoreCoordinator;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}




- (void)dealloc {
     [viewController release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

