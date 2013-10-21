/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "EC2ModifyReservedInstancesRequest.h"


@implementation EC2ModifyReservedInstancesRequest

@synthesize clientToken;
@synthesize reservedInstancesIds;
@synthesize targetConfigurations;


-(id)init
{
    if (self = [super init]) {
        clientToken          = nil;
        reservedInstancesIds = [[NSMutableArray alloc] initWithCapacity:1];
        targetConfigurations = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addReservedInstancesId:(NSString *)reservedInstancesIdObject
{
    if (reservedInstancesIds == nil) {
        reservedInstancesIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [reservedInstancesIds addObject:reservedInstancesIdObject];
}

-(void)addTargetConfiguration:(EC2ReservedInstancesConfiguration *)targetConfigurationObject
{
    if (targetConfigurations == nil) {
        targetConfigurations = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [targetConfigurations addObject:targetConfigurationObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ClientToken: %@,", clientToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesIds: %@,", reservedInstancesIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TargetConfigurations: %@,", targetConfigurations] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [clientToken release];
    [reservedInstancesIds release];
    [targetConfigurations release];

    [super dealloc];
}


@end
