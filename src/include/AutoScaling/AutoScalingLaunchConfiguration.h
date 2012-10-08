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

#import "AutoScalingBlockDeviceMapping.h"
#import "AutoScalingInstanceMonitoring.h"



/**
 * Launch Configuration
 */

@interface AutoScalingLaunchConfiguration:NSObject

{
    NSString                      *launchConfigurationName;
    NSString                      *launchConfigurationARN;
    NSString                      *imageId;
    NSString                      *keyName;
    NSMutableArray                *securityGroups;
    NSString                      *userData;
    NSString                      *instanceType;
    NSString                      *kernelId;
    NSString                      *ramdiskId;
    NSMutableArray                *blockDeviceMappings;
    AutoScalingInstanceMonitoring *instanceMonitoring;
    NSString                      *spotPrice;
    NSString                      *iamInstanceProfile;
    NSDate                        *createdTime;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the name of the launch configuration.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *launchConfigurationName;

/**
 * The launch configuration's Amazon Resource Name (ARN).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *launchConfigurationARN;

/**
 * Provides the unique ID of the <i>Amazon Machine Image</i> (AMI) that
 * was assigned during registration.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * Provides the name of the Amazon EC2 key pair.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *keyName;

/**
 * A description of the security groups to associate with the Amazon EC2
 * instances.
 */
@property (nonatomic, retain) NSMutableArray *securityGroups;

/**
 * The user data available to the launched Amazon EC2 instances.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 21847<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *userData;

/**
 * Specifies the instance type of the Amazon EC2 instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * Provides the ID of the kernel associated with the Amazon EC2 AMI.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * Provides ID of the RAM disk associated with the Amazon EC2 AMI.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * Specifies how block devices are exposed to the instance. Each mapping
 * is made up of a <i>virtualName</i> and a <i>deviceName</i>.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * Controls whether instances in this group are launched with detailed
 * monitoring or not.
 */
@property (nonatomic, retain) AutoScalingInstanceMonitoring *instanceMonitoring;

/**
 * Specifies the price to bid when launching Spot Instances.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *spotPrice;

/**
 * Provides the name or the Amazon Resource Name (ARN) of the instance
 * profile associated with the IAM role for the instance. The instance
 * profile contains the IAM role.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *iamInstanceProfile;

/**
 * Provides the creation date and time for this launch configuration.
 */
@property (nonatomic, retain) NSDate *createdTime;

/**
 * Adds a single object to securityGroups.
 * This function will alloc and init securityGroups if not already done.
 */
-(void)addSecurityGroup:(NSString *)securityGroupObject;

/**
 * Adds a single object to blockDeviceMappings.
 * This function will alloc and init blockDeviceMappings if not already done.
 */
-(void)addBlockDeviceMapping:(AutoScalingBlockDeviceMapping *)blockDeviceMappingObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
