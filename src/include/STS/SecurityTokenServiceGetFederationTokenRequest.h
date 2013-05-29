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
 * Get Federation Token Request
 */

@interface SecurityTokenServiceGetFederationTokenRequest:AmazonServiceRequestConfig

{
    NSString *name;
    NSString *policy;
    NSNumber *durationSeconds;
}



/**
 * The name of the federated user. The name is used as an identifier for
 * the temporary security credentials (such as <code>Bob</code>). For
 * example, you can reference the federated user name in a resource-based
 * policy, such as in an Amazon S3 bucket policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>2 - 32<br/>
 * <b>Pattern: </b>[\w+=,.@-]*<br/>
 */
@property (nonatomic, retain) NSString *name;

/**
 * A policy that specifies the permissions that are granted to the
 * federated user. By default, federated users have no permissions; they
 * do not inherit any from the IAM user. When you specify a policy, the
 * federated user's permissions are intersection of the specified policy
 * and the IAM user's policy. If you don't specify a policy, federated
 * users can only access AWS resources that explicitly allow those
 * federated users in a resource policy, such as in an Amazon S3 bucket
 * policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2048<br/>
 * <b>Pattern: </b>[\u0009\u000A\u000D\u0020-\u00FF]+<br/>
 */
@property (nonatomic, retain) NSString *policy;

/**
 * The duration, in seconds, that the session should last. Acceptable
 * durations for federation sessions range from 900 seconds (15 minutes)
 * to 129600 seconds (36 hours), with 43200 seconds (12 hours) as the
 * default. Sessions for AWS account owners are restricted to a maximum
 * of 3600 seconds (one hour). If the duration is longer than one hour,
 * the session for AWS account owners defaults to one hour.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>900 - 129600<br/>
 */
@property (nonatomic, retain) NSNumber *durationSeconds;


/**
 * Default constructor for a new GetFederationTokenRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new GetFederationTokenRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theName The name of the federated user. The name is used as an
 * identifier for the temporary security credentials (such as
 * <code>Bob</code>). For example, you can reference the federated user
 * name in a resource-based policy, such as in an Amazon S3 bucket
 * policy.
 */
-(id)initWithName:(NSString *)theName;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
