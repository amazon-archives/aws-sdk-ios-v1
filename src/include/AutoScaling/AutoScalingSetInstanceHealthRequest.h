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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Set Instance Health Request
 */

@interface AutoScalingSetInstanceHealthRequest:AmazonServiceRequestConfig

{
    NSString *instanceId;
    NSString *healthStatus;
    BOOL     shouldRespectGracePeriod;
    BOOL     shouldRespectGracePeriodIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The identifier of the Amazon EC2 instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 16<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The health status of the instance. Set to <code>Healthy</code> if you
 * want the instance to remain in service. Set to <code>Unhealthy</code>
 * if you want the instance to be out of service. Auto Scaling will
 * terminate and replace the unhealthy instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 32<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *healthStatus;

/**
 * If the Auto Scaling group of the specified instance has a
 * <code>HealthCheckGracePeriod</code> specified for the group, by
 * default, this call will respect the grace period. Set this to
 * <code>False</code>, if you do not want the call to respect the grace
 * period associated with the group. <p>For more information, see the
 * <code>HealthCheckGracePeriod</code> parameter description in the
 * <a>CreateAutoScalingGroup</a> action.
 */
@property (nonatomic) BOOL           shouldRespectGracePeriod;

@property (nonatomic, readonly) BOOL shouldRespectGracePeriodIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
