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

#import "AutoScalingBlockDeviceMapping.h"
#import "AutoScalingInstanceMonitoring.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Launch Configuration Request
 *
 * \ingroup AutoScaling
 */

@interface AutoScalingCreateLaunchConfigurationRequest:AmazonServiceRequestConfig

{
    NSString                      *launchConfigurationName;
    NSString                      *imageId;
    NSString                      *keyName;
    NSMutableArray                *securityGroups;
    NSString                      *userData;
    NSString                      *instanceType;
    NSString                      *kernelId;
    NSString                      *ramdiskId;
    NSMutableArray                *blockDeviceMappings;
    AutoScalingInstanceMonitoring *instanceMonitoring;
}



/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the launch configuration to create.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *launchConfigurationName;

/**
 * Unique ID of the <i>Amazon Machine Image</i> (AMI) which was assigned
 * during registration. For more information about Amazon EC2 images,
 * please go to <a
 * ://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/AMIs.html">Using
 * AMIs</a> in the <i>Amazon EC2 User Guide</i>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * The name of the EC2 key pair.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *keyName;

/**
 * The names of the security groups with which to associate EC2
 * instances. For more information about Amazon EC2 security groups, go
 * to <a
 * nwebservices.com/AWSEC2/latest/UserGuide/using-network-security.html">
 * Using Security Groups</a> in the <i>Amazon EC2 User Guide</i>.
 */
@property (nonatomic, retain) NSMutableArray *securityGroups;

/**
 * The user data available to the launched EC2 instances. For more
 * information about Amazon EC2 user data, please go to <a
 * ://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/Instances.html">
 * Using Instances</a> in the <i>Amazon EC2 User Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 21847<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *userData;

/**
 * The instance type of the EC2 instance. For more information about
 * Amazon EC2 instance types, please go to <a
 * ://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/Instances.html">
 * Using Instances</a> in the <i>Amazon EC2 User Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * The ID of the kernel associated with the EC2 AMI.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * The ID of the RAM disk associated with the EC2 AMI.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * A list of mappings that specify how block devices are exposed to the
 * instance. Each mapping is made up of a <i>VirtualName</i>, a
 * <i>DeviceName</i>, and an <i>ebs</i> data structure that contains
 * information about the associated Elastic Block Storage volume. For
 * more information about Amazon EC2 BlockDeviceMappings, please go to <a
 * vices.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html">
 * Block Device Mapping</a> in the <i>Amazon EC2 User Guide</i>.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * Enables detailed monitoring.
 */
@property (nonatomic, retain) AutoScalingInstanceMonitoring *instanceMonitoring;

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
