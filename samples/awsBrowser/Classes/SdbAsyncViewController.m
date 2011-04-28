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


#import "SdbAsyncViewController.h"
#import "Constants.h"


@implementation SdbAsyncViewController


@synthesize bytesIn, bytesOut;


-(id)init
{
    // Create the SDB Request Delegate
    sdbDelegate = [[SdbRequestDelegate alloc] init];
    timer       = nil;
    counter     = 0;
    domainName  = @"testing-async-with-sdb";

    return [super initWithNibName:@"SdbAsyncViewController" bundle:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    sdbDelegate.bytesIn  = bytesIn;
    sdbDelegate.bytesOut = bytesOut;
}

-(IBAction)start:(id)sender
{
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }

    timer   = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(perform) userInfo:nil repeats:YES];
    counter = 0;
}

-(IBAction)exit:(id)sender
{
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }

    timer   = nil;
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
        [[Constants sdb] createDomain:createDomainRequest];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

-(void)putAttributes
{
    @try {
        SimpleDBReplaceableAttribute *replacableAttribute1 = [[[SimpleDBReplaceableAttribute alloc] initWithName:@"Attribute1" andValue:@"Value1" andReplace:YES] autorelease];
        SimpleDBReplaceableAttribute *replacableAttribute2 = [[[SimpleDBReplaceableAttribute alloc] initWithName:@"Attribute2" andValue:@"Value2" andReplace:YES] autorelease];
        SimpleDBReplaceableAttribute *replacableAttribute3 = [[[SimpleDBReplaceableAttribute alloc] initWithName:@"Attribute3" andValue:@"Value3" andReplace:YES] autorelease];
        SimpleDBReplaceableAttribute *replacableAttribute4 = [[[SimpleDBReplaceableAttribute alloc] initWithName:@"Attribute4" andValue:@"Value4" andReplace:YES] autorelease];

        NSMutableArray               *attributes = [[[NSMutableArray alloc] initWithCapacity:4] autorelease];
        [attributes addObject:replacableAttribute1];
        [attributes addObject:replacableAttribute2];
        [attributes addObject:replacableAttribute3];
        [attributes addObject:replacableAttribute4];
        for (int i = 0; i < 10; i++) {
            NSString                     *itemName = [NSString stringWithFormat:@"Item-%d", i];

            SimpleDBPutAttributesRequest *putAttributesRequest = [[SimpleDBPutAttributesRequest alloc] initWithDomainName:domainName andItemName:itemName andAttributes:attributes];
            [putAttributesRequest setDelegate:sdbDelegate];

            [[Constants sdb] putAttributes:putAttributesRequest];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

-(void)selectAttributes
{
    @try {
        NSString              *selectExpression = [NSString stringWithFormat:@"select * from `%@`", domainName];

        SimpleDBSelectRequest *selectRequest = [[[SimpleDBSelectRequest alloc] initWithSelectExpression:selectExpression] autorelease];
        [selectRequest setDelegate:sdbDelegate];
        selectRequest.consistentRead = YES;

        [[Constants sdb] select:selectRequest];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

-(void)dealloc
{
    [sdbDelegate dealloc];
    [domainName release];
    [super dealloc];
}


@end
