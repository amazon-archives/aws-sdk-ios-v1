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

#import <AWSiOSSDK/SimpleDB/AmazonSimpleDBClient.h>
#import "ItemListing.h"
#import "AmazonClientManager.h"
#import "ItemViewController.h"

@implementation ItemListing

@synthesize domain;

-(id)init
{
    return [super initWithNibName:@"ItemListing" bundle:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *selectExpression = [NSString stringWithFormat:@"select itemName() from `%@`", self.domain];

    @try {
        SimpleDBSelectRequest  *selectRequest  = [[[SimpleDBSelectRequest alloc] initWithSelectExpression:selectExpression] autorelease];
        SimpleDBSelectResponse *selectResponse = [[AmazonClientManager sdb] select:selectRequest];

        if (items == nil) {
            items = [[NSMutableArray alloc] initWithCapacity:[selectResponse.items count]];
        }
        else {
            [items removeAllObjects];
        }
        for (SimpleDBItem *item in selectResponse.items) {
            [items addObject:item.name];
        }
        [items sortUsingSelector:@selector(compare:)];
    }
    @catch (AmazonClientException *exception) {
        NSLog(@"Exception = %@", exception);
    }

    [itemsTableView reloadData];
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
    return [items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text                      = [items objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemViewController *itemView = [[ItemViewController alloc] init];

    itemView.domain               = self.domain;
    itemView.itemName             = [items objectAtIndex:indexPath.row];
    itemView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:itemView animated:YES];
    [itemView release];
}

-(void)dealloc
{
    [items release];
    [domain release];
    [super dealloc];
}


@end

