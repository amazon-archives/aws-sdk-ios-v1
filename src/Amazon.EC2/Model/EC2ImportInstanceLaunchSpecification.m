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

#import "EC2ImportInstanceLaunchSpecification.h"


@implementation EC2ImportInstanceLaunchSpecification

@synthesize architecture;
@synthesize groupNames;
@synthesize additionalInfo;
@synthesize userData;
@synthesize instanceType;
@synthesize placement;
@synthesize monitoring;
@synthesize monitoringIsSet;
@synthesize subnetId;
@synthesize instanceInitiatedShutdownBehavior;
@synthesize privateIpAddress;


-(id)init
{
    if (self = [super init]) {
        architecture                      = nil;
        groupNames                        = [[NSMutableArray alloc] initWithCapacity:1];
        additionalInfo                    = nil;
        userData                          = nil;
        instanceType                      = nil;
        placement                         = nil;
        monitoring                        = NO;
        monitoringIsSet                   = NO;
        subnetId                          = nil;
        instanceInitiatedShutdownBehavior = nil;
        privateIpAddress                  = nil;
    }

    return self;
}


-(void)addGroupName:(NSString *)groupNameObject
{
    if (groupNames == nil) {
        groupNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [groupNames addObject:groupNameObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Architecture: %@,", architecture] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupNames: %@,", groupNames] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AdditionalInfo: %@,", additionalInfo] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UserData: %@,", userData] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Placement: %@,", placement] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Monitoring: %d,", monitoring] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SubnetId: %@,", subnetId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceInitiatedShutdownBehavior: %@,", instanceInitiatedShutdownBehavior] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateIpAddress: %@,", privateIpAddress] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setMonitoring:(bool)theValue
{
    monitoring      = theValue;
    monitoringIsSet = YES;
}


-(void)dealloc
{
    [architecture release];
    [groupNames release];
    [additionalInfo release];
    [userData release];
    [instanceType release];
    [placement release];
    [subnetId release];
    [instanceInitiatedShutdownBehavior release];
    [privateIpAddress release];

    [super dealloc];
}


@end
