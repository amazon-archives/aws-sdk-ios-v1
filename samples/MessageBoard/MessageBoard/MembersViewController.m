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

#import "MembersViewController.h"
#import "MessageBoard.h"

// View used to display the subscribers for the topic.
@implementation MembersViewController

@synthesize subscribers;

-(id)init
{
    self.subscribers = [[MessageBoard instance] listSubscribers];
    return [super initWithNibName:@"MembersViewController" bundle:nil];
}

-(IBAction)back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.subscribers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    SNSSubscription *subscriber = [self.subscribers objectAtIndex:indexPath.row];
    cell.textLabel.text                      = subscriber.endpoint;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.detailTextLabel.text                = subscriber.protocol;

    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SNSSubscription *subscriber = [self.subscribers objectAtIndex:indexPath.row];

        [[MessageBoard instance] removeSubscriber:subscriber.subscriptionArn];
        [self.subscribers removeObjectAtIndex:indexPath.row];

        NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

-(void)dealloc
{
    [subscribers release];
    [super dealloc];
}

@end
