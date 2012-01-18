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

#import "MessageList.h"
#import "SendMessage.h"
#import "AmazonClientManager.h"
#import "Message.h"

@implementation MessageList

@synthesize queue;

-(IBAction)done:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)sendMessage:(id)sender
{
    SendMessage *sendMessage = [[SendMessage alloc] initWithNibName:@"SendMessage" bundle:nil];

    sendMessage.queue                = queue;
    sendMessage.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

    [self presentModalViewController:sendMessage animated:YES];
    [sendMessage release];
}

-(void)viewWillAppear:(BOOL)animated
{
    @try {
        SQSReceiveMessageRequest *messageRequest = [[[SQSReceiveMessageRequest alloc] initWithQueueUrl:queue] autorelease];
        messageRequest.maxNumberOfMessages = [NSNumber numberWithInt:10];
        messageRequest.visibilityTimeout   = [NSNumber numberWithInt:0];
        SQSReceiveMessageResponse *messageResponse = [[AmazonClientManager sqs] receiveMessage:messageRequest];
        messages = messageResponse.messages;
    }
    @catch (AmazonClientException *exception) {
        NSLog(@"Exception = %@", exception);
    }

    [messageTableView reloadData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.modalViewController viewDidAppear:animated];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messages count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    SQSMessage *message = (SQSMessage *)[messages objectAtIndex:indexPath.row];
    cell.textLabel.text                      = message.messageId;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *messageView = [[Message alloc] init];

    messageView.message              = [messages objectAtIndex:indexPath.row];
    messageView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentModalViewController:messageView animated:YES];
    [messageView release];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        @try {
            SQSMessage              *selectedMessage      = [messages objectAtIndex:indexPath.row];
            SQSDeleteMessageRequest *deleteMessageRequest = [[[SQSDeleteMessageRequest alloc] initWithQueueUrl:queue andReceiptHandle:selectedMessage.receiptHandle] autorelease];

            [[AmazonClientManager sqs] deleteMessage:deleteMessageRequest];

            [messages removeObjectAtIndex:indexPath.row];

            NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
            [messageTableView beginUpdates];
            [messageTableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
            [messageTableView endUpdates];
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
    [messages release];
    [super dealloc];
}

@end

