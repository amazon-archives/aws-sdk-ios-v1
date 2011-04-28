/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


#import "S3AsyncViewController.h"
#import "Constants.h"


@implementation S3AsyncViewController


@synthesize bytesIn, bytesOut;


-(id)init
{
    // Create the S3 Request Delegate
    s3Delegate = [[S3RequestDelegate alloc] init];

    return [super initWithNibName:@"S3AsyncViewController" bundle:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    s3Delegate.bytesIn  = bytesIn;
    s3Delegate.bytesOut = bytesOut;
}

-(IBAction)start:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(putObject) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(getObject) userInfo:nil repeats:NO];
}

-(IBAction)exit:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)putObject
{
    NSString *bucketName = [NSString stringWithFormat:@"testing-async-with-s3-for%@", [ACCESS_KEY lowercaseString]];
    NSString *keyName    = @"asyncTestFile";
    NSString *filename   = [[NSBundle mainBundle] pathForResource:@"temp" ofType:@"txt"];

    // Create the Bucket to put the Object.
    @try {
        [[Constants s3] createBucketWithName:bucketName];
    }
    @catch (NSException *e) {
        NSLog(@"%@", e);
        return;
    }

    // Put the file as an object in the bucket.
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest alloc] initWithKey:keyName inBucket:bucketName];
    putObjectRequest.filename = filename;
    [putObjectRequest setDelegate:s3Delegate];

    // When using delegates the return is nil.
    [[Constants s3] putObject:putObjectRequest];
}

-(void)getObject
{
    NSString *bucketName = [NSString stringWithFormat:@"testing-async-with-s3-for%@", [ACCESS_KEY lowercaseString]];
    NSString *keyName    = @"asyncTestFile";

    // Get the object from the bucket.
    S3GetObjectRequest *getObjectRequest = [[S3GetObjectRequest alloc] initWithKey:keyName withBucket:bucketName];

    [getObjectRequest setDelegate:s3Delegate];

    // When using delegates the return is nil.
    [[Constants s3] getObject:getObjectRequest];
}

-(void)dealloc
{
    [s3Delegate dealloc];
    [super dealloc];
}


@end
