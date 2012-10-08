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

#import "EC2Instance.h"


@implementation EC2Instance

@synthesize instanceId;
@synthesize imageId;
@synthesize state;
@synthesize privateDnsName;
@synthesize publicDnsName;
@synthesize stateTransitionReason;
@synthesize keyName;
@synthesize amiLaunchIndex;
@synthesize productCodes;
@synthesize instanceType;
@synthesize launchTime;
@synthesize placement;
@synthesize kernelId;
@synthesize ramdiskId;
@synthesize platform;
@synthesize monitoring;
@synthesize subnetId;
@synthesize vpcId;
@synthesize privateIpAddress;
@synthesize publicIpAddress;
@synthesize stateReason;
@synthesize architecture;
@synthesize rootDeviceType;
@synthesize rootDeviceName;
@synthesize blockDeviceMappings;
@synthesize virtualizationType;
@synthesize instanceLifecycle;
@synthesize spotInstanceRequestId;
@synthesize license;
@synthesize clientToken;
@synthesize tags;
@synthesize securityGroups;
@synthesize sourceDestCheck;
@synthesize sourceDestCheckIsSet;
@synthesize hypervisor;
@synthesize networkInterfaces;
@synthesize iamInstanceProfile;
@synthesize ebsOptimized;
@synthesize ebsOptimizedIsSet;


-(id)init
{
    if (self = [super init]) {
        instanceId            = nil;
        imageId               = nil;
        state                 = nil;
        privateDnsName        = nil;
        publicDnsName         = nil;
        stateTransitionReason = nil;
        keyName               = nil;
        amiLaunchIndex        = nil;
        productCodes          = [[NSMutableArray alloc] initWithCapacity:1];
        instanceType          = nil;
        launchTime            = nil;
        placement             = nil;
        kernelId              = nil;
        ramdiskId             = nil;
        platform              = nil;
        monitoring            = nil;
        subnetId              = nil;
        vpcId                 = nil;
        privateIpAddress      = nil;
        publicIpAddress       = nil;
        stateReason           = nil;
        architecture          = nil;
        rootDeviceType        = nil;
        rootDeviceName        = nil;
        blockDeviceMappings   = [[NSMutableArray alloc] initWithCapacity:1];
        virtualizationType    = nil;
        instanceLifecycle     = nil;
        spotInstanceRequestId = nil;
        license               = nil;
        clientToken           = nil;
        tags                  = [[NSMutableArray alloc] initWithCapacity:1];
        securityGroups        = [[NSMutableArray alloc] initWithCapacity:1];
        sourceDestCheck       = NO;
        sourceDestCheckIsSet  = NO;
        hypervisor            = nil;
        networkInterfaces     = [[NSMutableArray alloc] initWithCapacity:1];
        iamInstanceProfile    = nil;
        ebsOptimized          = NO;
        ebsOptimizedIsSet     = NO;
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

-(void)addBlockDeviceMapping:(EC2InstanceBlockDeviceMapping *)blockDeviceMappingObject
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

-(void)addSecurityGroup:(EC2GroupIdentifier *)securityGroupObject
{
    if (securityGroups == nil) {
        securityGroups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [securityGroups addObject:securityGroupObject];
}

-(void)addNetworkInterface:(EC2InstanceNetworkInterface *)networkInterfaceObject
{
    if (networkInterfaces == nil) {
        networkInterfaces = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [networkInterfaces addObject:networkInterfaceObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageId: %@,", imageId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateDnsName: %@,", privateDnsName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PublicDnsName: %@,", publicDnsName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StateTransitionReason: %@,", stateTransitionReason] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KeyName: %@,", keyName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AmiLaunchIndex: %@,", amiLaunchIndex] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductCodes: %@,", productCodes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchTime: %@,", launchTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Placement: %@,", placement] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KernelId: %@,", kernelId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RamdiskId: %@,", ramdiskId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Platform: %@,", platform] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Monitoring: %@,", monitoring] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SubnetId: %@,", subnetId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VpcId: %@,", vpcId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateIpAddress: %@,", privateIpAddress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PublicIpAddress: %@,", publicIpAddress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StateReason: %@,", stateReason] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Architecture: %@,", architecture] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RootDeviceType: %@,", rootDeviceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RootDeviceName: %@,", rootDeviceName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BlockDeviceMappings: %@,", blockDeviceMappings] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VirtualizationType: %@,", virtualizationType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceLifecycle: %@,", instanceLifecycle] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SpotInstanceRequestId: %@,", spotInstanceRequestId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"License: %@,", license] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ClientToken: %@,", clientToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SecurityGroups: %@,", securityGroups] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceDestCheck: %d,", sourceDestCheck] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Hypervisor: %@,", hypervisor] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NetworkInterfaces: %@,", networkInterfaces] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IamInstanceProfile: %@,", iamInstanceProfile] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"EbsOptimized: %d,", ebsOptimized] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setSourceDestCheck:(bool)theValue
{
    sourceDestCheck      = theValue;
    sourceDestCheckIsSet = YES;
}

-(void)setEbsOptimized:(bool)theValue
{
    ebsOptimized      = theValue;
    ebsOptimizedIsSet = YES;
}


-(void)dealloc
{
    [instanceId release];
    [imageId release];
    [state release];
    [privateDnsName release];
    [publicDnsName release];
    [stateTransitionReason release];
    [keyName release];
    [amiLaunchIndex release];
    [productCodes release];
    [instanceType release];
    [launchTime release];
    [placement release];
    [kernelId release];
    [ramdiskId release];
    [platform release];
    [monitoring release];
    [subnetId release];
    [vpcId release];
    [privateIpAddress release];
    [publicIpAddress release];
    [stateReason release];
    [architecture release];
    [rootDeviceType release];
    [rootDeviceName release];
    [blockDeviceMappings release];
    [virtualizationType release];
    [instanceLifecycle release];
    [spotInstanceRequestId release];
    [license release];
    [clientToken release];
    [tags release];
    [securityGroups release];
    [hypervisor release];
    [networkInterfaces release];
    [iamInstanceProfile release];

    [super dealloc];
}


@end
