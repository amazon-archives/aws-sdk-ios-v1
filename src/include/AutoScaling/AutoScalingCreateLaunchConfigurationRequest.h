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

#import "AutoScalingBlockDeviceMapping.h"
#import "AutoScalingInstanceMonitoring.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



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
    BOOL                          ebsOptimized;
    BOOL                          ebsOptimizedIsSet;
    BOOL                          associatePublicIpAddress;
    BOOL                          associatePublicIpAddressIsSet;
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
 * Unique ID of the <i>Amazon Machine Image</i> (AMI) you want to use to
 * launch your EC2 instances. For information about finding Amazon EC2
 * AMIs, see <a
 * cs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html">Finding
 * a Suitable AMI</a> in the <i>Amazon Elastic Compute Cloud User
 * Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * The name of the Amazon EC2 key pair. For more information, see <a
 * .amazon.com/AWSEC2/latest/UserGuide/generating-a-keypair.html">Getting
 * a Key Pair</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *keyName;

/**
 * The security groups with which to associate Amazon EC2 or Amazon VPC
 * instances. <p>If your instances are launched in EC2, you can either
 * specify Amazon EC2 security group names or the security group IDs. For
 * more information about Amazon EC2 security groups, see <a
 * n.com/AWSEC2/latest/UserGuide/index.html?using-network-security.html">
 * Using Security Groups</a> in the <i>Amazon Elastic Compute Cloud User
 * Guide</i>. If your instances are launched within VPC, specify Amazon
 * VPC security group IDs. For more information about Amazon VPC security
 * groups, see <a
 * mazonVPC/latest/UserGuide/index.html?VPC_SecurityGroups.html">Security
 * Groups</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.
 */
@property (nonatomic, retain) NSMutableArray *securityGroups;

/**
 * The user data to make available to the launched Amazon EC2 instances.
 * For more information about Amazon EC2 user data, see <a
 * AESDG-chapter-instancedata.html#instancedata-user-data-retrieval">User
 * Data Retrieval</a> in the <i>Amazon Elastic Compute Cloud User
 * Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 21847<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *userData;

/**
 * The instance type of the Amazon EC2 instance. For information about
 * available Amazon EC2 instance types, see <a
 * m/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes">
 * Available Instance Types</a> in the <i>Amazon Elastic Cloud Compute
 * User Guide.</i>
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
 * Enables detailed monitoring if it is disabled. Detailed monitoring is
 * enabled by default. <p> When detailed monitoring is enabled, Amazon
 * Cloudwatch will generate metrics every minute and your account will be
 * charged a fee. When you disable detailed monitoring, by specifying
 * <code>False</code>, Cloudwatch will generate metrics every 5 minutes.
 * For more information, see <a
 * AutoScaling/latest/DeveloperGuide/as-instance-monitoring.html">Monitor
 * Your Auto Scaling Instances</a>. For information about Amazon
 * CloudWatch, see the <a
 * amazon.com/AmazonCloudWatch/latest/DeveloperGuide/Welcome.html">Amazon
 * CloudWatch Developer Guide</a>.
 */
@property (nonatomic, retain) AutoScalingInstanceMonitoring *instanceMonitoring;

/**
 * The maximum hourly price to be paid for any Spot Instance launched to
 * fulfill the request. Spot Instances are launched when the price you
 * specify exceeds the current Spot market price. For more information on
 * launching Spot Instances, see <a
 * s.amazon.com/AutoScaling/latest/DeveloperGuide/US-SpotInstances.html">
 * Using Auto Scaling to Launch Spot Instances</a> in the <i>Auto Scaling
 * Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *spotPrice;

/**
 * The name or the Amazon Resource Name (ARN) of the instance profile
 * associated with the IAM role for the instance. <p>Amazon EC2 instances
 * launched with an IAM role will automatically have AWS security
 * credentials available. You can use IAM roles with Auto Scaling to
 * automatically enable applications running on your Amazon EC2 instances
 * to securely access other AWS resources. For information on launching
 * EC2 instances with an IAM role, go to <a
 * azon.com/AutoScaling/latest/DeveloperGuide/us-iam-role.html">Launching
 * Auto Scaling Instances With an IAM Role</a> in the <i>Auto Scaling
 * Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *iamInstanceProfile;

/**
 * Whether the instance is optimized for EBS I/O. The optimization
 * provides dedicated throughput to Amazon EBS and an optimized
 * configuration stack to provide optimal EBS I/O performance. This
 * optimization is not available with all instance types. Additional
 * usage charges apply when using an EBS Optimized instance. By default
 * the instance is not optimized for EBS I/O. For information about
 * EBS-optimized instances, go to <a
 * WSEC2/latest/UserGuide/instance-types.html#EBSOptimized">EBS-Optimized
 * Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.
 */
@property (nonatomic) BOOL           ebsOptimized;

@property (nonatomic, readonly) BOOL ebsOptimizedIsSet;

/**
 * Used for Auto Scaling groups that launch instances into an Amazon
 * Virtual Private Cloud (Amazon VPC). Specifies whether to assign a
 * public IP address to each instance launched in a Amazon VPC. <note>
 * <p>If you specify a value for this parameter, be sure to specify at
 * least one VPC subnet using the <i>VPCZoneIdentifier</i> parameter when
 * you create your Auto Scaling group. </note> <p>Default: If the
 * instance is launched in default VPC, the default is <code>true</code>.
 * If the instance is launched in a nondefault VPC (EC2-VPC), the default
 * is <code>false</code>. For more information about the platforms
 * supported by Auto Scaling, see <a
 * amazon.com/AutoScaling/latest/DeveloperGuide/US_BasicSetup.html">Basic
 * Auto Scaling Configuration</a>.
 */
@property (nonatomic) BOOL           associatePublicIpAddress;

@property (nonatomic, readonly) BOOL associatePublicIpAddressIsSet;

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
