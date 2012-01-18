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
#import "ItemViewController.h"
#import "AmazonClientManager.h"

@implementation ItemViewController

@synthesize domain, itemName;

-(id)init
{
    return [super initWithNibName:@"ItemViewController" bundle:nil];
}

-(IBAction)done:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    @try {
        SimpleDBGetAttributesRequest  *gar      = [[[SimpleDBGetAttributesRequest alloc] initWithDomainName:self.domain andItemName:self.itemName] autorelease];
        SimpleDBGetAttributesResponse *response = [[AmazonClientManager sdb] getAttributes:gar];

        if (data == nil) {
            data = [[NSMutableArray alloc] initWithCapacity:[response.attributes count]];
        }
        else {
            [data removeAllObjects];
        }
        for (SimpleDBAttribute *attr in response.attributes) {
            [data addObject:[NSString stringWithFormat:@"%@ => %@", attr.name, attr.value]];
        }
        [data sortUsingSelector:@selector(compare:)];
    }
    @catch (AmazonServiceException *exception) {
        if ( [exception.errorCode isEqualToString:@"InvalidClientTokenId"]) {
            [[Constants expiredCredentialsAlert] show];
            [AmazonClientManager wipeAllCredentials];
        }
    }
    @catch (AmazonClientException *exception) {
        NSLog(@"Exception = %@", exception);
    }

    [dataTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text                      = [data objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    return cell;
}

-(void)dealloc
{
    [data release];
    [itemName release];
    [domain release];
    [super dealloc];
}


@end

