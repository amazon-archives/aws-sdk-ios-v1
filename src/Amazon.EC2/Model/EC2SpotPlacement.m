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

#import "EC2SpotPlacement.h"


@implementation EC2SpotPlacement

@synthesize availabilityZone;
@synthesize groupName;


-(id)init
{
    if (self = [super init]) {
        availabilityZone = nil;
        groupName        = nil;
    }

    return self;
}

-(id)initWithAvailabilityZone:(NSString *)theAvailabilityZone
{
    if (self = [self init]) {
        self.availabilityZone = theAvailabilityZone;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupName: %@,", groupName] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [availabilityZone release];
    [groupName release];

    [super dealloc];
}


@end
