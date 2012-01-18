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

#import "AutoScalingSetDesiredCapacityRequest.h"


@implementation AutoScalingSetDesiredCapacityRequest

@synthesize autoScalingGroupName;
@synthesize desiredCapacity;
@synthesize honorCooldown;
@synthesize honorCooldownIsSet;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupName = nil;
        desiredCapacity      = nil;
        honorCooldown        = NO;
        honorCooldownIsSet   = NO;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DesiredCapacity: %@,", desiredCapacity] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HonorCooldown: %d,", honorCooldown] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setHonorCooldown:(bool)theValue
{
    honorCooldown      = theValue;
    honorCooldownIsSet = YES;
}


-(void)dealloc
{
    [autoScalingGroupName release];
    [desiredCapacity release];

    [super dealloc];
}


@end
