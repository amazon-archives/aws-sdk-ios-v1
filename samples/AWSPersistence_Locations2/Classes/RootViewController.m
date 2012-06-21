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

#import <AWSPersistence/AWSPersistenceDynamoDBIncrementalStore.h>
#import "Checkin.h"
#import "Location.h"
#import "RootViewController.h"
#import "LocationsAppDelegate.h"
#import "Utilities.h"
#import "CheckinsViewController.h"


@implementation RootViewController

@synthesize eventArray, managedObjectContext, locationManager;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Start the location manager.
	[[self locationManager] startUpdatingLocation];
    
    if ([Utilities setupTables]) {
        [self loadFromCD];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There was a problem during setup, check application log for details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Set the title.
    self.title = @"Locations";
    
	// Configure the add and edit buttons.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet)];
    self.navigationItem.leftBarButtonItem = actionButton;
}

- (void)loadFromCD
{
    
	// Fetch existing events.
    // Create a fetch request; find the Event entity and assign it to the request; add a sort descriptor; then execute the fetch.
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
    
	// Execute the fetch -- create a mutable copy of the result.
	NSError *error = nil;
	NSArray *fetchedResults = [managedObjectContext executeFetchRequest:request error:&error];
    NSMutableArray *mutableFetchResults = [fetchedResults mutableCopy];
    
	if (mutableFetchResults == nil) {
        // Handle the error.
        NSLog(@"Problem fetching data. Error: %@", error);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There was a problem fetching data, check application log for details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
	}
	
	// Set self's events array to the mutable array, then clean up.
	self.eventArray = mutableFetchResults;
	
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidUnload {
	// Release any properties that are loaded in viewDidLoad or can be recreated lazily.
	self.eventArray = nil;
	self.locationManager = nil;
}

#pragma mark -
#pragma mark Table view data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Only one section.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// As many rows as there are obects in the events array.
    return [eventArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSNumberFormatter *nf = nil;
	if (nf == nil) {
		nf = [NSNumberFormatter new];
		[nf setNumberStyle:NSNumberFormatterDecimalStyle];
	}
	
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
	// Get the event corresponding to the current index path and configure the table view cell.
	Location *loc = (Location *)[eventArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text =  [NSString stringWithFormat:@"%@ (%d)", loc.name, loc.checkins.count];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Lat: %@, Lng: %@", loc.lat, loc.lng];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
	return cell;
}

/**
 * Handle deletion of an event.
 */

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
        // Delete the managed object at the given index path.
		Location *locToDelete = (Location *)[eventArray objectAtIndex:indexPath.row];
		[managedObjectContext deleteObject:locToDelete];
		
		// Update the array and table view.
        [eventArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Location *locToUpdate = [eventArray objectAtIndex:indexPath.row];
    
    CheckinsViewController *checkinsViewController = [CheckinsViewController alloc];
    
    checkinsViewController.location = locToUpdate;
    checkinsViewController.managedObjectContext = self.managedObjectContext;
    
    [self.navigationController pushViewController:checkinsViewController animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Location manager

/**
 * Return a location manager -- create one if necessary.
 */
- (CLLocationManager *)locationManager {
	
    if (locationManager != nil) {
		return locationManager;
	}
	
	locationManager = [[CLLocationManager alloc] init];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
	[locationManager setDelegate:self];
	
	return locationManager;
}

#pragma mark - User Actions

- (void)showActionSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Action" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Add", @"Save", @"Undo", nil];
    [actionSheet showInView:self.view];
}

- (void)addEvent {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Location" message:@"Give this location a name" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
	
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *name = [alertView textFieldAtIndex:0].text;
    NSLog(@"%@", name);
    
    if ((name == nil) || [name isEqualToString:@""]) {
        return;
    }
    
	// If it's not possible to get a location, then return.
	CLLocation *location = [locationManager location];
	if (!location) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Unable to determine your location.  Make sure Locations Services is enabled." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
		return;
	}
	
	
	// Create a new instance of the Checkin entity.
    Checkin *checkin = (Checkin *)[NSEntityDescription insertNewObjectForEntityForName:@"Checkin" inManagedObjectContext:managedObjectContext];
    checkin.checkinId = [Utilities getUUID];
    checkin.checkinTime = [NSDate date];
    checkin.comment = @"First Checkin";
    
	Location *loc = (Location *)[NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:managedObjectContext];
	checkin.location = loc;
    loc.name = name;
    
	// Configure the new event with information from the location.
	CLLocationCoordinate2D coordinate = [location coordinate];
    loc.locationId = [Utilities getUUID];
	loc.lat = [NSNumber numberWithDouble:coordinate.latitude];
	loc.lng = [NSNumber numberWithDouble:coordinate.longitude];
    [loc addCheckinsObject:checkin];
    
	
	// Since this is a new event, and events are displayed with most recent events at the top of the list,
	// add the new event to the beginning of the events array; then redisplay the table view.
    [eventArray insertObject:loc atIndex:0];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	[self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    [self.tableView reloadData];
}

- (void)saveAllEvents
{
    BOOL saved = NO;
    
    for(NSManagedObject *managedObject in eventArray)
    {
        [managedObjectContext refreshObject:managedObject mergeChanges:YES];
    }
    
    // Commit the change.
    NSError *error;
    saved = [managedObjectContext save:&error];
    if (!saved)
    {
        NSLog(@"Problem saving data. Error: %@", error);
    }
    
    if (saved) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SUCCESS" message:@"Successfully saved changes." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There was a problem saving data, check application log for details" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
}

- (void)undo
{
    [[[self managedObjectContext] undoManager] undo];
    
    [self cleanUpEventArray];
    
    [self.tableView reloadData];
}

#pragma mark - Helper Methods

- (void)cleanUpEventArray
{
    [self loadFromCD];
}

#pragma mark - UIActionSheet Delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self addEvent];
            break;
            
        case 1:
            [self saveAllEvents];
            [self.tableView reloadData];
            break;
            
        case 2:
            [self undo];
            break;
            
        default:
            break;
    }
}

#pragma mark - Memory management



@end

