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

#import "EC2InstanceNetworkInterfaceAttachment.h"


@implementation EC2InstanceNetworkInterfaceAttachment

@synthesize attachmentId;
@synthesize deviceIndex;
@synthesize status;
@synthesize attachTime;
@synthesize deleteOnTermination;
@synthesize deleteOnTerminationIsSet;


-(id)init
{
    if (self = [super init]) {
        attachmentId             = nil;
        deviceIndex              = nil;
        status                   = nil;
        attachTime               = nil;
        deleteOnTermination      = NO;
        deleteOnTerminationIsSet = NO;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttachmentId: %@,", attachmentId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeviceIndex: %@,", deviceIndex] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Status: %@,", status] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttachTime: %@,", attachTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeleteOnTermination: %d,", deleteOnTermination] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setDeleteOnTermination:(bool)theValue
{
    deleteOnTermination      = theValue;
    deleteOnTerminationIsSet = YES;
}


-(void)dealloc
{
    [attachmentId release];
    [deviceIndex release];
    [status release];
    [attachTime release];

    [super dealloc];
}


@end
