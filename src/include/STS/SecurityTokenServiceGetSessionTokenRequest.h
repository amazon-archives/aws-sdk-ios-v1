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
 * Get Session Token Request
 *
 * \ingroup SecurityTokenService
 */

@interface SecurityTokenServiceGetSessionTokenRequest:AmazonServiceRequestConfig

{
    NSNumber *durationSeconds;
}



/**
 * The duration, in seconds, that the credentials should remain valid.
 * Acceptable durations for IAM user sessions range from 3600s (one hour)
 * to 129600s (36 hours), with 43200s (12 hours) as the default. Sessions
 * for AWS account owners are restricted to a maximum of 3600s (one
 * hour).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>3600 - 129600<br/>
 */
@property (nonatomic, retain) NSNumber *durationSeconds;


/**
 * Default constructor for a new GetSessionTokenRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
