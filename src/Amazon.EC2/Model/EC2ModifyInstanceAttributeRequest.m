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

#import "EC2ModifyInstanceAttributeRequest.h"


@implementation EC2ModifyInstanceAttributeRequest

@synthesize instanceId;
@synthesize attribute;
@synthesize value;
@synthesize blockDeviceMappings;
@synthesize sourceDestCheck;
@synthesize sourceDestCheckIsSet;
@synthesize groups;


-(id)init
{
    if (self = [super init]) {
        instanceId           = nil;
        attribute            = nil;
        value                = nil;
        blockDeviceMappings  = [[NSMutableArray alloc] initWithCapacity:1];
        sourceDestCheck      = NO;
        sourceDestCheckIsSet = NO;
        groups               = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithInstanceId:(NSString *)theInstanceId andAttribute:(NSString *)theAttribute
{
    if (self = [self init]) {
        self.instanceId = theInstanceId;
        self.attribute  = theAttribute;
    }

    return self;
}


-(void)addBlockDeviceMapping:(EC2InstanceBlockDeviceMappingSpecification *)blockDeviceMapping
{
    if (blockDeviceMappings == nil) {
        blockDeviceMappings = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [blockDeviceMappings addObject:blockDeviceMapping];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attribute: %@,", attribute] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Value: %@,", value] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BlockDeviceMappings: %@,", blockDeviceMappings] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceDestCheck: %d,", sourceDestCheck] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Groups: %@,", groups] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setSourceDestCheck:(bool)theValue
{
    sourceDestCheck      = theValue;
    sourceDestCheckIsSet = YES;
}


-(void)dealloc
{
    [instanceId release];
    [attribute release];
    [value release];
    [blockDeviceMappings release];
    [groups release];

    [super dealloc];
}


@end
