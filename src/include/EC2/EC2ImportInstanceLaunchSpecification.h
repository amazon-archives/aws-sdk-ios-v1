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

#import "EC2Placement.h"



/**
 * Import Instance Launch Specification
 */

@interface EC2ImportInstanceLaunchSpecification:NSObject

{
    NSString       *architecture;
    NSMutableArray *groupNames;
    NSString       *additionalInfo;
    NSString       *userData;
    NSString       *instanceType;
    EC2Placement   *placement;
    bool           monitoring;
    bool           monitoringIsSet;
    NSString       *subnetId;
    NSString       *instanceInitiatedShutdownBehavior;
    NSString       *privateIpAddress;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Architecture property for this object.
 */
@property (nonatomic, retain) NSString *architecture;

/**
 * The value of the GroupNames property for this object.
 */
@property (nonatomic, retain) NSMutableArray *groupNames;

/**
 * The value of the AdditionalInfo property for this object.
 */
@property (nonatomic, retain) NSString *additionalInfo;

/**
 * The value of the UserData property for this object.
 */
@property (nonatomic, retain) NSString *userData;

/**
 * The value of the InstanceType property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>t1.micro, m1.small, m1.medium, m1.large, m1.xlarge, m2.xlarge, m2.2xlarge, m2.4xlarge, m3.xlarge, m3.2xlarge, c1.medium, c1.xlarge, hi1.4xlarge, hs1.8xlarge, cc1.4xlarge, cc2.8xlarge, cg1.4xlarge, cr1.8xlarge
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * Describes where an Amazon EC2 instance is running within an Amazon EC2
 * region.
 */
@property (nonatomic, retain) EC2Placement *placement;

/**
 * The value of the Monitoring property for this object.
 */
@property (nonatomic) bool           monitoring;

@property (nonatomic, readonly) bool monitoringIsSet;

/**
 * The value of the SubnetId property for this object.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * The value of the InstanceInitiatedShutdownBehavior property for this object.
 */
@property (nonatomic, retain) NSString *instanceInitiatedShutdownBehavior;

/**
 * The value of the PrivateIpAddress property for this object.
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * Adds a single object to groupNames.
 * This function will alloc and init groupNames if not already done.
 */
-(void)addGroupName:(NSString *)groupNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
