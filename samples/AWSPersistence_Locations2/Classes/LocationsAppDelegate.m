/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "LocationsAppDelegate.h"
#import "RootViewController.h"
#import "AmazonClientManager.h"
#import <AWSiOSSDK/AmazonLogger.h>
#import <AWSiOSSDK/AmazonErrorHandler.h>

@implementation LocationsAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Logging Control - Do NOT use logging for non-development builds.
#ifdef DEBUG
    [AmazonLogger verboseLogging];
#else
    [AmazonLogger turnLoggingOff];
#endif
    
    [AmazonErrorHandler shouldNotThrowExceptions];
		
	NSManagedObjectContext *context = [self managedObjectContext];
	if (!context) {
		// Handle the error.
        NSLog(@"Unable to create context");
        return NO;
	}
    
	// Configure and show the window
	RootViewController *rootViewController = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
    rootViewController.managedObjectContext = context;
	
	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	self.navigationController = aNavigationController;
	
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
	
    
    return YES;
}

/**
 * applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	
    NSError *error;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			// Handle the error.
        } 
    }
}

#pragma mark -
#pragma mark Core Data stack

/**
 * Returns the managed object context for the application.
 * If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext
{	
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        
        //Undo Support
        NSUndoManager *undoManager = [NSUndoManager new];
        managedObjectContext.undoManager = undoManager;
        
        managedObjectContext.persistentStoreCoordinator = coordinator;
        managedObjectContext.mergePolicy = [[NSMergePolicy alloc] initWithMergeType:NSMergeByPropertyStoreTrumpMergePolicyType];
    }
    
    return managedObjectContext;
}


/**
 * Returns the managed object model for the application.
 * If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel
{	
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];    
    return managedObjectModel;
}


/**
 * Returns the persistent store coordinator for the application.
 * If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{	
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
	
    NSError *error;
    
    // Registers the AWSNSIncrementalStore
    [NSPersistentStoreCoordinator registerStoreClass:[AWSPersistenceDynamoDBIncrementalStore class] forStoreType:AWSPersistenceDynamoDBIncrementalStoreType];
    
    // Instantiates PersistentStoreCoordinator
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    // Creates options for the AWSNSIncrementalStore
    NSDictionary *hashKeys = [NSDictionary dictionaryWithObjectsAndKeys:
                              LOCATIONS_KEY, @"Location", 
                              CHECKINS_KEY, @"Checkin", nil];
    NSDictionary *versions = [NSDictionary dictionaryWithObjectsAndKeys:
                              LOCATIONS_VERSIONS, @"Location", 
                              CHECKINS_VERSIONS, @"Checkin", nil];
    NSDictionary *tableMapper = [NSDictionary dictionaryWithObjectsAndKeys:
                                 LOCATIONS_TABLE, @"Location",
                                 CHECKINS_TABLE, @"Checkin", nil];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             hashKeys, AWSPersistenceDynamoDBHashKey, 
                             versions, AWSPersistenceDynamoDBVersionKey,
                             self, AWSPersistenceDynamoDBDelegate,
                             tableMapper, AWSPersistenceDynamoDBTableMapper, nil];
    
    // Adds the AWSNSIncrementalStore to the PersistentStoreCoordinator
    if(![persistentStoreCoordinator addPersistentStoreWithType:AWSPersistenceDynamoDBIncrementalStoreType 
                                                 configuration:nil 
                                                           URL:nil 
                                                       options:options 
                                                         error:&error])
    {
        // Handle the error.
        NSLog(@"Unable to create store. Error: %@", error);
    }
    
    return persistentStoreCoordinator;
}

#pragma mark - AWSPersistenceDynamoDBIncrementalStoreDelegate

- (AmazonCredentials *)credentials
{
    return [AmazonClientManager credentials];
}

- (void)handleAuthenticationFailure
{
    [AmazonClientManager wipeAllCredentials];
}

#pragma mark - Memory management



@end
