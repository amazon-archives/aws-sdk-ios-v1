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

#import "SecurityTokenServiceFederatedUser.h"


@implementation SecurityTokenServiceFederatedUser

@synthesize federatedUserId;
@synthesize arn;


-(id)init
{
    if (self = [super init]) {
        federatedUserId = nil;
        arn             = nil;
    }

    return self;
}

-(id)initWithFederatedUserId:(NSString *)theFederatedUserId andArn:(NSString *)theArn
{
    if (self = [self init]) {
        self.federatedUserId = theFederatedUserId;
        self.arn             = theArn;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"FederatedUserId: %@,", federatedUserId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Arn: %@,", arn] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [federatedUserId release];
    [arn release];

    [super dealloc];
}


@end
