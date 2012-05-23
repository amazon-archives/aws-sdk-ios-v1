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


#import "../AmazonServiceRequestConfig.h"



/**
 * Describe Policies Request
 */

@interface AutoScalingDescribePoliciesRequest:AmazonServiceRequestConfig

{
    NSString       *autoScalingGroupName;
    NSMutableArray *policyNames;
    NSString       *nextToken;
    NSNumber       *maxRecords;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * A list of policy names or policy ARNs to be described. If this list is
 * omitted, all policy names are described. If an auto scaling group name
 * is provided, the results are limited to that group. The list of
 * requested policy names cannot contain more than 50 items. If unknown
 * policy names are requested, they are ignored with no error.
 */
@property (nonatomic, retain) NSMutableArray *policyNames;

/**
 * A string that is used to mark the start of the next batch of returned
 * results for pagination.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * The maximum number of policies that will be described with each call.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 50<br/>
 */
@property (nonatomic, retain) NSNumber *maxRecords;

/**
 * Adds a single object to policyNames.
 * This function will alloc and init policyNames if not already done.
 */
-(void)addPolicyName:(NSString *)policyNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
