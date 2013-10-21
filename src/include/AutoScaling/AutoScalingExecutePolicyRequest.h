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
 * Execute Policy Request
 */

@interface AutoScalingExecutePolicyRequest:AmazonServiceRequestConfig

{
    NSString *autoScalingGroupName;
    NSString *policyName;
    BOOL     honorCooldown;
    BOOL     honorCooldownIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name or the Amazon Resource Name (ARN) of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The name or ARN of the policy you want to run.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *policyName;

/**
 * Set to <code>True</code> if you want Auto Scaling to wait for the
 * cooldown period associated with the Auto Scaling group to complete
 * before executing the policy. <p>Set to <code>False</code> if you want
 * Auto Scaling to circumvent the cooldown period associated with the
 * Auto Scaling group and execute the policy before the cooldown period
 * ends. <p>For information about cooldown period, see <a
 * /AutoScaling/latest/DeveloperGuide/AS_Concepts.html#Cooldown">Cooldown
 * Period</a> in the <i>Auto Scaling Developer Guide</i>.
 */
@property (nonatomic) BOOL           honorCooldown;

@property (nonatomic, readonly) BOOL honorCooldownIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
