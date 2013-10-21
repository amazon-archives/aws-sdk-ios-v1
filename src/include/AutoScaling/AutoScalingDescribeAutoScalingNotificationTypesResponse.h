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


#import "AutoScalingResponse.h"



/**
 * Describe Auto Scaling Notification Types Result
 */

@interface AutoScalingDescribeAutoScalingNotificationTypesResponse:AutoScalingResponse

{
    NSMutableArray *autoScalingNotificationTypes;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Returns a list of all notification types supported by Auto Scaling.
 * They are: <ul>
 * <li><p><code>autoscaling:EC2_INSTANCE_LAUNCH</code></li>
 * <li><p><code>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</code></li>
 * <li><p><code>autoscaling:EC2_INSTANCE_TERMINATE</code></li>
 * <li><p><code>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</code></li>
 * <li><p><code>autoscaling:TEST_NOTIFICATION</code></li> </ul>
 * <examples>
 * omain;/?Version=2011-01-01&Action=DescribeAutoScalingNotificationTypes
 * &AUTHPARAMS </queryrequest>
 * <queryresponse><DescribeAutoScalingNotificationTypesResponse
 * xmlns="http://autoscaling.&api-domain;/doc/2011-01-01/">
 * <DescribeAutoScalingNotificationTypesResult>
 * <AutoScalingNotificationTypes>
 * <member>autoscaling:EC2_INSTANCE_LAUNCH</member>
 * <member>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</member>
 * <member>autoscaling:EC2_INSTANCE_TERMINATE</member>
 * <member>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</member>
 * <member>autoscaling:TEST_NOTIFICATION</member>
 * </AutoScalingNotificationTypes>
 * </DescribeAutoScalingNotificationTypesResult> <ResponseMetadata>
 * <RequestId>42fc6794-bf21-11e2-a1cf-ff3dEXAMPLE</RequestId>
 * </ResponseMetadata>
 * </DescribeAutoScalingNotificationTypesResponse></queryresponse>
 * </examples>
 */
@property (nonatomic, retain) NSMutableArray *autoScalingNotificationTypes;



/**
 * Returns a value from the autoScalingNotificationTypes array for the specified index
 */
-(NSString *)autoScalingNotificationTypesObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
