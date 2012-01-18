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

#import "S3AccessControlList.h"


@implementation S3AccessControlList

@synthesize owner;

-(void)addGrant:(S3Grant *)aGrant
{
    if (grantList == nil) {
        grantList = [[NSMutableArray alloc] init];
    }

    [grantList addObject:aGrant];
}

-(id)initWithOwner:(S3Owner *)theOwner
{
    self = [super init];
    if (self) {
        self.owner = theOwner;
    }
    return self;
}

-(NSArray *)grantList
{
    return [NSArray arrayWithArray:grantList];
}

-(NSString *)toXml
{
    NSMutableString *xml = [[NSMutableString alloc] init];

    [xml appendFormat:@"<AccessControlPolicy><Owner><ID>%@</ID><DisplayName>%@</DisplayName></Owner>",
     self.owner.ID, self.owner.displayName];

    [xml appendString:@"<AccessControlList>"];
    for (S3Grant *g in grantList)
    {
        [xml appendString:[g toXml]];
    }

    [xml appendString:@"</AccessControlList></AccessControlPolicy>"];

    NSString *retval = [NSString stringWithString:xml];

    [xml release];

    return retval;
}

-(void)dealloc
{
    [owner release];
    [grantList release];

    [super dealloc];
}

@end
