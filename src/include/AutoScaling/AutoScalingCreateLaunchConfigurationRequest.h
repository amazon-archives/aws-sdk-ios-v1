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

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Launch Configuration Request
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
    NSString                      *spotPrice;
    NSString                      *iamInstanceProfile;
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
 * please see <a href="http://aws.amazon.com/ec2/"> Amazon EC2 product
 * documentation</a>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * The name of the Amazon EC2 key pair.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *keyName;

/**
 * The names of the security groups with which to associate Amazon EC2 or
 * Amazon VPC instances. Specify Amazon EC2 security groups using
 * security group names, such as <code>websrv</code>. Specify Amazon VPC
 * security groups using security group IDs, such as
 * <code>sg-12345678</code>. For more information about Amazon EC2
 * security groups, go to <a
 * s.com/AWSEC2/latest/UserGuide/index.html?using-network-security.html">
 * Using Security Groups</a> in the Amazon EC2 product documentation. For
 * more information about Amazon VPC security groups, go to <a
 * es.com/AmazonVPC/latest/UserGuide/index.html?VPC_SecurityGroups.html">
 * Security Groups</a> in the Amazon VPC product documentation.
 */
@property (nonatomic, retain) NSMutableArray *securityGroups;

/**
 * The user data available to the launched Amazon EC2 instances. For more
 * information about Amazon EC2 user data, please see <a
 * href="http://aws.amazon.com/ec2/"> Amazon EC2 product
 * documentation</a>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 21847<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *userData;

/**
 * The instance type of the Amazon EC2 instance. For more information
 * about Amazon EC2 instance types, please see <a
 * href="http://aws.amazon.com/ec2/"> Amazon EC2 product
 * documentation</a>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * The ID of the kernel associated with the Amazon EC2 AMI.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * The ID of the RAM disk associated with the Amazon EC2 AMI.
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
 * more information about Amazon EC2 BlockDeviceMappings, go to <a
 * WSEC2/latest/UserGuide/index.html?block-device-mapping-concepts.html">
 * Block Device Mapping</a> in the Amazon EC2 product documentation.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * Enables detailed monitoring, which is enabled by default. <p> When
 * detailed monitoring is enabled, CloudWatch will generate metrics every
 * minute and your account will be charged a fee. When you disable
 * detailed monitoring, by specifying <code>False</code>, Cloudwatch will
 * generate metrics every 5 minutes. For information about monitoring,
 * see the <a href="http://aws.amazon.com/cloudwatch/">Amazon
 * CloudWatch</a> product page.
 */
@property (nonatomic, retain) AutoScalingInstanceMonitoring *instanceMonitoring;

/**
 * The maximum hourly price to be paid for any Spot Instance launched to
 * fulfill the request. Spot Instances are launched when the price you
 * specify exceeds the current Spot market price. For more information on
 * launching Spot Instances, go to <a
 * services.com/AutoScaling/latest/DeveloperGuide/US-SpotInstances.html">
 * Using Auto Scaling to Launch Spot Instances</a> in the <i>Auto Scaling
 * Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *spotPrice;

/**
 * The name or the Amazon Resource Name (ARN) of the instance profile
 * associated with the IAM role for the instance. For information on
 * launching EC2 instances with an IAM role, go to <a
 * ices.com/AutoScaling/latest/DeveloperGuide/us-iam-role.html">Launching
 * Auto Scaling Instances With an IAM Role</a> in the <i>Auto Scaling
 * Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *iamInstanceProfile;

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
