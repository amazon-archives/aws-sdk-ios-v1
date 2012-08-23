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

#import "S3Grant.h"


@implementation S3Grant

@synthesize grantee;
@synthesize permission;

-(id)initWithGrantee:(S3Grantee *)theGrantee withPermission:(S3Permission *)thePermission
{
    self = [self init];
    if (self) {
        grantee    = [theGrantee retain];
        permission = [thePermission retain];
    }
    return self;
}

+(id)grantWithGrantee:(S3Grantee *)theGrantee withPermission:(S3Permission *)thePermission
{
    return [[[S3Grant alloc] initWithGrantee:theGrantee withPermission:thePermission] autorelease];
}

-(NSString *)toXml
{
    return [NSString stringWithFormat:@"<Grant>%@<Permission>%@</Permission></Grant>",
            [self.grantee toXml], [self.permission description]];
}

-(void)dealloc
{
    [grantee release];
    [permission release];

    [super dealloc];
}

@end
