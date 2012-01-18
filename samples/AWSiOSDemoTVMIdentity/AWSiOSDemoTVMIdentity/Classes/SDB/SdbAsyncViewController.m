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


#import "SdbAsyncViewController.h"
#import "AmazonClientManager.h"


@implementation SdbAsyncViewController


@synthesize bytesIn, bytesOut;


-(id)init
{
    // Create the SDB Request Delegate
    sdbDelegate          = [[SdbRequestDelegate alloc] init];
    timer                = nil;
    counter              = 0;
    domainName           = @"testing-async-with-sdb";
    selectRequest        = nil;
    putAttributesRequest = nil;

    return [super initWithNibName:@"SdbAsyncViewController" bundle:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    sdbDelegate.bytesIn  = bytesIn;
    sdbDelegate.bytesOut = bytesOut;
}

-(IBAction)start:(id)sender
{
    bytesIn.text  = @"0";
    bytesOut.text = @"0";

    if (timer != nil && [timer isValid]) {
        [timer invalidate];
        timer = nil;
    }

    timer   = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(perform) userInfo:nil repeats:YES];
    counter = 0;
}

-(IBAction)stop:(id)sender
{
    if (timer != nil && [timer isValid]) {
        [timer invalidate];
        timer = nil;
    }

    counter = 0;

    if (selectRequest != nil) {
        [selectRequest.urlConnection cancel];
    }

    if (putAttributesRequest != nil) {
        [putAttributesRequest.urlConnection cancel];
    }
}

-(IBAction)exit:(id)sender
{
    if (timer != nil && [timer isValid]) {
        [timer invalidate];
        timer = nil;
    }

    counter = 0;
    [self dismissModalViewControllerAnimated:YES];
}

-(void)perform
{
    if (counter > 9) {
        [timer invalidate];
        timer   = nil;
        counter = 0;
    }
    else {
        if (counter == 0) {
            [self createDomain];
        }

        [self putAttributes];
        [self selectAttributes];

        counter++;
    }
}

-(void)createDomain
{
    @try {
        SimpleDBCreateDomainRequest *createDomainRequest = [[[SimpleDBCreateDomainRequest alloc] initWithDomainName:domainName] autorelease];
        [createDomainRequest setDelegate:sdbDelegate];
        [[AmazonClientManager sdb] createDomain:createDomainRequest];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

-(void)putAttributes
{
    @try {
        NSMutableArray *attributes = [[[NSMutableArray alloc] initWithCapacity:200] autorelease];
        for (int i = 0; i < 200; i++) {
            NSString                     *att                 = [NSString stringWithFormat:@"attribute-%d", i];
            NSString                     *val                 = [NSString stringWithFormat:@"value-%d", i];
            SimpleDBReplaceableAttribute *replacableAttribute = [[[SimpleDBReplaceableAttribute alloc] initWithName:att andValue:val andReplace:YES] autorelease];
            [attributes addObject:replacableAttribute];
        }
        for (int i = 0; i < 10; i++) {
            NSString *itemName = [NSString stringWithFormat:@"Item-%d", i];

            putAttributesRequest = [[SimpleDBPutAttributesRequest alloc] initWithDomainName:domainName andItemName:itemName andAttributes:attributes];
            [putAttributesRequest setDelegate:sdbDelegate];

            [[AmazonClientManager sdb] putAttributes:putAttributesRequest];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

-(void)selectAttributes
{
    @try {
        NSString *selectExpression = [NSString stringWithFormat:@"select * from `%@`", domainName];
        selectRequest = [[SimpleDBSelectRequest alloc] initWithSelectExpression:selectExpression];
        [selectRequest setDelegate:sdbDelegate];
        selectRequest.consistentRead = YES;

        [[AmazonClientManager sdb] select:selectRequest];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

-(void)dealloc
{
    [sdbDelegate dealloc];
    [domainName release];
    [putAttributesRequest release];
    [selectRequest release];
    [super dealloc];
}


@end
