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

#import "QueueList.h"
#import "AmazonClientManager.h"
#import "MessageList.h"
#import "AddQueue.h"

@implementation QueueList

-(id)init
{
    return [super initWithNibName:@"QueueList" bundle:nil];
}

-(IBAction)add:(id)sender
{
    AddQueue *addQueue = [[AddQueue alloc] init];

    addQueue.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

    [self presentModalViewController:addQueue animated:YES];
    [addQueue release];
}

-(IBAction)done:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    @try {
        SQSListQueuesRequest  *listQueuesRequest = [[[SQSListQueuesRequest alloc] init] autorelease];
        SQSListQueuesResponse *response          = [[AmazonClientManager sqs] listQueues:listQueuesRequest];

        if (queues == nil) {
            queues = [[NSMutableArray alloc] initWithCapacity:[response.queueUrls count]];
        }
        else {
            [queues removeAllObjects];
        }
        for (NSString *queueName in response.queueUrls) {
            [queues addObject:queueName];
        }

        [queues sortUsingSelector:@selector(compare:)];
    }
    @catch (AmazonClientException *exception) {
        NSLog(@"Exception = %@", exception);
    }

    [queueTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [queues count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    cell.textLabel.text                      = [queues objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        MessageList *messageList = [[MessageList alloc] init];
        messageList.queue                = [queues objectAtIndex:indexPath.row];
        messageList.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

        [self presentModalViewController:messageList animated:YES];
        [messageList release];
    }
    @catch (AmazonClientException *exception) {
        NSLog(@"Exception = %@", exception);
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        @try {
            SQSDeleteQueueRequest *deleteQueueRequest = [[[SQSDeleteQueueRequest alloc] initWithQueueUrl:[queues objectAtIndex:indexPath.row]] autorelease];
            [[AmazonClientManager sqs] deleteQueue:deleteQueueRequest];

            [queues removeObjectAtIndex:indexPath.row];

            NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
            [queueTableView beginUpdates];
            [queueTableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
            [queueTableView endUpdates];
        }
        @catch (AmazonClientException *exception) {
            NSLog(@"Exception = %@", exception);
        }
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

-(void)dealloc
{
    [queues release];
    [super dealloc];
}


@end

