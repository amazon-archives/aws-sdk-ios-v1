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

#import "MessageQueueController.h"
#import "MessageBoard.h"

// View used to display the messages in the queue.
@implementation MessageQueueController

@synthesize messages;


-(id)init
{
    self.messages = [[MessageBoard instance] getMessagesFromQueue];
    return [super initWithNibName:@"MessageQueueController" bundle:nil];
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
    return [self.messages count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    SQSMessage *message = [self.messages objectAtIndex:indexPath.row];
    if (message != nil && message.body != nil) {
        cell.textLabel.text                      = [self extractMessageFromJson:message.body];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SQSMessage *message = [self.messages objectAtIndex:indexPath.row];

        [[MessageBoard instance] deleteMessageFromQueue:message];
        [self.messages removeObjectAtIndex:indexPath.row];

        NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

//-------------------------------------------
// Better to use an actual JSON Parser here.
//-------------------------------------------
-(NSString *)extractMessageFromJson:(NSString *)json
{
    @try {
        NSRange startIndex = [json rangeOfString:@"\"Message\""];
        if (startIndex.length != 0) {
            NSRange startIndexRange = { startIndex.location, [json length] - startIndex.location };

            NSRange colonIndex      = [json rangeOfString:@":" options:NSLiteralSearch range:startIndexRange];
            NSRange colonIndexRange = { colonIndex.location, [json length] - colonIndex.location };

            NSRange startQuoteIndex = [json rangeOfString:@"\"" options:NSLiteralSearch range:colonIndexRange];
            NSRange startQuoteRange = { startQuoteIndex.location + 1, [json length] - startQuoteIndex.location - 1 };

            NSRange endQuoteIndex = [json rangeOfString:@"\"" options:NSLiteralSearch range:startQuoteRange];

            NSRange elementRange = { startQuoteIndex.location + 1, endQuoteIndex.location - startQuoteIndex.location - 1 };

            return [json substringWithRange:elementRange];
        }
        else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}

-(void)dealloc
{
    [messages release];
    [super dealloc];
}

@end
