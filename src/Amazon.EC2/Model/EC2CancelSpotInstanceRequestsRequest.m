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

#import "EC2CancelSpotInstanceRequestsRequest.h"


@implementation EC2CancelSpotInstanceRequestsRequest

@synthesize spotInstanceRequestIds;


-(id)init
{
    if (self = [super init]) {
        spotInstanceRequestIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithSpotInstanceRequestIds:(NSMutableArray *)theSpotInstanceRequestIds
{
    if (self = [self init]) {
        self.spotInstanceRequestIds = theSpotInstanceRequestIds;
    }

    return self;
}


-(void)addSpotInstanceRequestId:(NSString *)spotInstanceRequestIdObject
{
    if (spotInstanceRequestIds == nil) {
        spotInstanceRequestIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [spotInstanceRequestIds addObject:spotInstanceRequestIdObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SpotInstanceRequestIds: %@,", spotInstanceRequestIds] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [spotInstanceRequestIds release];

    [super dealloc];
}


@end
