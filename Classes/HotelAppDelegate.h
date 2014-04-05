//
//  HotelAppDelegate.h
//  Hotel
//
//  Created by danal on 5/10/11.
//  Copyright danal 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginViewController;


@interface HotelAppDelegate : NSObject <UIApplicationDelegate> {//UITabBarControllerDelegate
    UIWindow *window;
    UITabBarController *tabBarController;
    LoginViewController *viewController;

	NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
	
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet LoginViewController *viewController;

- (NSString *)applicationDocumentsDirectory;
@end
