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

#import "EC2ImageAttribute.h"


@implementation EC2ImageAttribute

@synthesize imageId;
@synthesize launchPermissions;
@synthesize productCodes;
@synthesize kernelId;
@synthesize ramdiskId;
@synthesize descriptionValue;
@synthesize blockDeviceMappings;


-(id)init
{
    if (self = [super init]) {
        imageId             = nil;
        launchPermissions   = [[NSMutableArray alloc] initWithCapacity:1];
        productCodes        = [[NSMutableArray alloc] initWithCapacity:1];
        kernelId            = nil;
        ramdiskId           = nil;
        descriptionValue    = nil;
        blockDeviceMappings = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addLaunchPermission:(EC2LaunchPermission *)launchPermissionObject
{
    if (launchPermissions == nil) {
        launchPermissions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [launchPermissions addObject:launchPermissionObject];
}

-(void)addProductCode:(EC2ProductCode *)productCodeObject
{
    if (productCodes == nil) {
        productCodes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [productCodes addObject:productCodeObject];
}

-(void)addBlockDeviceMapping:(EC2BlockDeviceMapping *)blockDeviceMappingObject
{
    if (blockDeviceMappings == nil) {
        blockDeviceMappings = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [blockDeviceMappings addObject:blockDeviceMappingObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageId: %@,", imageId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchPermissions: %@,", launchPermissions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductCodes: %@,", productCodes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KernelId: %@,", kernelId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RamdiskId: %@,", ramdiskId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BlockDeviceMappings: %@,", blockDeviceMappings] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [imageId release];
    [launchPermissions release];
    [productCodes release];
    [kernelId release];
    [ramdiskId release];
    [descriptionValue release];
    [blockDeviceMappings release];

    [super dealloc];
}


@end
