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

#import "EC2Image.h"


@implementation EC2Image

@synthesize imageId;
@synthesize imageLocation;
@synthesize state;
@synthesize ownerId;
@synthesize publicValue;
@synthesize publicValueIsSet;
@synthesize productCodes;
@synthesize architecture;
@synthesize imageType;
@synthesize kernelId;
@synthesize ramdiskId;
@synthesize platform;
@synthesize stateReason;
@synthesize imageOwnerAlias;
@synthesize name;
@synthesize descriptionValue;
@synthesize rootDeviceType;
@synthesize rootDeviceName;
@synthesize blockDeviceMappings;
@synthesize virtualizationType;
@synthesize tags;
@synthesize hypervisor;


-(id)init
{
    if (self = [super init]) {
        imageId             = nil;
        imageLocation       = nil;
        state               = nil;
        ownerId             = nil;
        publicValue         = NO;
        publicValueIsSet    = NO;
        productCodes        = [[NSMutableArray alloc] initWithCapacity:1];
        architecture        = nil;
        imageType           = nil;
        kernelId            = nil;
        ramdiskId           = nil;
        platform            = nil;
        stateReason         = nil;
        imageOwnerAlias     = nil;
        name                = nil;
        descriptionValue    = nil;
        rootDeviceType      = nil;
        rootDeviceName      = nil;
        blockDeviceMappings = [[NSMutableArray alloc] initWithCapacity:1];
        virtualizationType  = nil;
        tags                = [[NSMutableArray alloc] initWithCapacity:1];
        hypervisor          = nil;
    }

    return self;
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

-(void)addTag:(EC2Tag *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageId: %@,", imageId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageLocation: %@,", imageLocation] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Public: %d,", publicValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductCodes: %@,", productCodes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Architecture: %@,", architecture] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageType: %@,", imageType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KernelId: %@,", kernelId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RamdiskId: %@,", ramdiskId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Platform: %@,", platform] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StateReason: %@,", stateReason] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageOwnerAlias: %@,", imageOwnerAlias] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RootDeviceType: %@,", rootDeviceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RootDeviceName: %@,", rootDeviceName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BlockDeviceMappings: %@,", blockDeviceMappings] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VirtualizationType: %@,", virtualizationType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Hypervisor: %@,", hypervisor] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setPublicValue:(bool)theValue
{
    publicValue      = theValue;
    publicValueIsSet = YES;
}


-(void)dealloc
{
    [imageId release];
    [imageLocation release];
    [state release];
    [ownerId release];
    [productCodes release];
    [architecture release];
    [imageType release];
    [kernelId release];
    [ramdiskId release];
    [platform release];
    [stateReason release];
    [imageOwnerAlias release];
    [name release];
    [descriptionValue release];
    [rootDeviceType release];
    [rootDeviceName release];
    [blockDeviceMappings release];
    [virtualizationType release];
    [tags release];
    [hypervisor release];

    [super dealloc];
}


@end
