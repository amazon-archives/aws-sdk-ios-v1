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

#import "TopicList.h"
#import "AmazonClientManager.h"

@implementation TopicList

-(id)init
{
    return [super initWithNibName:@"TopicList" bundle:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    @try {
        SNSListTopicsRequest  *listTopicsRequest = [[[SNSListTopicsRequest alloc] init] autorelease];
        SNSListTopicsResponse *response          = [[AmazonClientManager sns] listTopics:listTopicsRequest];

        if (topics == nil) {
            topics = [[NSMutableArray alloc] initWithCapacity:[response.topics count]];
        }
        else {
            [topics removeAllObjects];
        }
        for (SNSTopic *topic in response.topics) {
            [topics addObject:topic.topicArn];
        }
        [topics sortUsingSelector:@selector(compare:)];
    }
    @catch (AmazonServiceException *exception) {
        if ( [exception.errorCode isEqualToString:@"ExpiredToken"]) {
            [[Constants expiredCredentialsAlert] show];
            [AmazonClientManager wipeAllCredentials];
        }
    }
    @catch (AmazonClientException *exception) {
        NSLog(@"Exception = %@", exception);
    }
    [topicTableView reloadData];
}

-(IBAction)done:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [topics count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    cell.textLabel.text                      = [topics objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Topic Selected = %@", [topics objectAtIndex:indexPath.row]);
}

-(void)dealloc
{
    [topics release];
    [super dealloc];
}


@end

