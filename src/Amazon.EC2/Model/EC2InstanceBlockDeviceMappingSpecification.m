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

#import "EC2InstanceBlockDeviceMappingSpecification.h"


@implementation EC2InstanceBlockDeviceMappingSpecification

@synthesize deviceName;
@synthesize ebs;
@synthesize virtualName;
@synthesize noDevice;


-(id)init
{
    if (self = [super init]) {
        deviceName  = nil;
        ebs         = nil;
        virtualName = nil;
        noDevice    = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeviceName: %@,", deviceName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Ebs: %@,", ebs] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VirtualName: %@,", virtualName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NoDevice: %@,", noDevice] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [deviceName release];
    [ebs release];
    [virtualName release];
    [noDevice release];

    [super dealloc];
}


@end
