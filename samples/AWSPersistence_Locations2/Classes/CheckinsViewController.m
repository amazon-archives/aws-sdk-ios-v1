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
#import "CheckinsViewController.h"
#import "RootViewController.h"

@implementation CheckinsViewController

@synthesize location, managedObjectContext;

- (void)mergeDeletedObject:(NSNotification *)notification
{
    [self performSelectorOnMainThread:@selector(processMergeDeletedObject:) withObject:notification waitUntilDone:YES];
}

- (void)processMergeDeletedObject:(NSNotification *)notification
{
    for(int i = [checkinsArray count] - 1; i >= 0; i--)
    {
        Checkin *c = [checkinsArray objectAtIndex:i];
        
        if([[c.objectID URIRepresentation] isEqual:[[notification.userInfo objectForKey:AWSPersistenceDynamoDBObjectDeletedNotificationObjectID] URIRepresentation]])
        {
            [checkinsArray removeObjectAtIndex:i];
        }
    }
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(mergeDeletedObject:) 
                                                 name:AWSPersistenceDynamoDBObjectDeletedNotification 
                                               object:nil];
    
    self.clearsSelectionOnViewWillAppear = NO;
 
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // put the contents of a set in an array for table view
    checkinsArray = [[NSMutableArray alloc] initWithCapacity: self.location.checkins.count];
    for (Checkin *checkin in self.location.checkins) {
        [checkinsArray addObject:checkin];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:AWSPersistenceDynamoDBObjectDeletedNotification 
                                                  object:nil];
    
    // Release any retained subviews of the main view.
    self.managedObjectContext = nil;
    self.location = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [managedObjectContext refreshObject:location mergeChanges:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return checkinsArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CheckinCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row < checkinsArray.count) {
        // Get the event corresponding to the current index path and configure the table view cell.
        Checkin *checkin = (Checkin *)[checkinsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", checkin.comment];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"@ %@", checkin.checkinTime];
    }
    else {
        cell.textLabel.text = @"Add new...";
    }
	return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return indexPath.row < checkinsArray.count;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
        // Delete the managed object at the given index path.
		Checkin *checkin = (Checkin *)[checkinsArray objectAtIndex:indexPath.row];
        [location removeCheckinsObject:checkin];
		[managedObjectContext deleteObject:checkin];
		
		// Update the array and table view.
        [checkinsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }  
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == checkinsArray.count) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Checkin Comment" message:@"Add your comment" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        alert.tag = NEW_CHECKIN;
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Checkin Comment" message:@"Add your comment" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        alert.tag = indexPath.row;
        [alert show];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *comment = [alertView textFieldAtIndex:0].text;
    NSLog(@"%@", comment);
    if ((comment == nil) || [comment isEqualToString:@""]) {
        return;
    }
    
    if (alertView.tag == NEW_CHECKIN) {
        [self newCheckin:comment];
    }
    else {
        // Tag stores the index of this checkin
        [self modifyCheckin:alertView.tag withComment:comment];
    }
}

-(void)modifyCheckin:(NSInteger)checkinNo withComment:(NSString *)comment 
{
    // Modifying the checking is a simple operation
    Checkin *checkin = [checkinsArray objectAtIndex:checkinNo];
    checkin.comment = comment;
    
    [self.tableView reloadData];
}

-(void)newCheckin:(NSString *)comment 
{
    // Create a new checking object
    Checkin *checkin = (Checkin *)[NSEntityDescription insertNewObjectForEntityForName:@"Checkin" inManagedObjectContext:managedObjectContext];
    checkin.checkinId = [Utilities getUUID];
    checkin.checkinTime = [NSDate date];
    checkin.comment = comment;
    
    checkin.location = self.location;
    [self.location addCheckinsObject:checkin];
    [checkinsArray addObject:checkin];
    [self.tableView reloadData];
}

@end
