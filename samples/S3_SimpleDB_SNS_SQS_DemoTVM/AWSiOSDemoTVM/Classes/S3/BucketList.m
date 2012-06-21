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

#import "BucketList.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import "AddBucketViewController.h"
#import "AmazonClientManager.h"
#import "ObjectListing.h"

@implementation BucketList

-(id)init
{
    return [super initWithNibName:@"BucketList" bundle:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    @try {
        NSArray *bucketNames = [[AmazonClientManager s3] listBuckets];
        if (buckets == nil) {
            buckets = [[NSMutableArray alloc] initWithCapacity:[bucketNames count]];
        }
        else {
            [buckets removeAllObjects];
        }

        if (bucketNames != nil) {
            for (S3Bucket *bucket in bucketNames) {
                [buckets addObject:[bucket name]];
            }
        }

        [buckets sortUsingSelector:@selector(compare:)];
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

    [bucketTableView reloadData];
}

-(IBAction)done:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)add:(id)sender
{
    AddBucketViewController *addBucketViewController = [[AddBucketViewController alloc] init];

    addBucketViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentModalViewController:addBucketViewController animated:YES];
    [addBucketViewController release];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [buckets count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    cell.textLabel.text                      = [buckets objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;

    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        @try {
            S3DeleteBucketRequest *deleteBucketRequest = [[[S3DeleteBucketRequest alloc] initWithName:[buckets objectAtIndex:indexPath.row]] autorelease];
            [[AmazonClientManager s3] deleteBucket:deleteBucketRequest];

            [buckets removeObjectAtIndex:indexPath.row];

            NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];

            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
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
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ObjectListing *objectList = [[ObjectListing alloc] init];

    objectList.bucket               = [buckets objectAtIndex:indexPath.row];
    objectList.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentModalViewController:objectList animated:YES];
    [objectList release];
}

-(void)dealloc
{
    [buckets release];
    [super dealloc];
}


@end

