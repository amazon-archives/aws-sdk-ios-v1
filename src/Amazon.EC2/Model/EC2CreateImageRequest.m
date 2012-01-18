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

#import "EC2CreateImageRequest.h"


@implementation EC2CreateImageRequest

@synthesize instanceId;
@synthesize name;
@synthesize descriptionValue;
@synthesize noReboot;
@synthesize noRebootIsSet;


-(id)init
{
    if (self = [super init]) {
        instanceId       = nil;
        name             = nil;
        descriptionValue = nil;
        noReboot         = NO;
        noRebootIsSet    = NO;
    }

    return self;
}

-(id)initWithInstanceId:(NSString *)theInstanceId andName:(NSString *)theName
{
    if (self = [self init]) {
        self.instanceId = theInstanceId;
        self.name       = theName;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NoReboot: %d,", noReboot] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setNoReboot:(bool)theValue
{
    noReboot      = theValue;
    noRebootIsSet = YES;
}


-(void)dealloc
{
    [instanceId release];
    [name release];
    [descriptionValue release];

    [super dealloc];
}


@end
