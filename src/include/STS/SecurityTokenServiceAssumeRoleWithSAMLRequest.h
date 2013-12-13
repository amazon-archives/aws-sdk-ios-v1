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
 * Assume Role With S A M L Request
 */

@interface SecurityTokenServiceAssumeRoleWithSAMLRequest:AmazonServiceRequestConfig

{
    NSString *roleArn;
    NSString *principalArn;
    NSString *sAMLAssertion;
    NSString *policy;
    NSNumber *durationSeconds;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The Amazon Resource Name (ARN) of the role that the caller is
 * assuming.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>20 - 2048<br/>
 */
@property (nonatomic, retain) NSString *roleArn;

/**
 * The Amazon Resource Name (ARN) of the SAML provider in AWS IAM that
 * describes the IdP.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>20 - 2048<br/>
 */
@property (nonatomic, retain) NSString *principalArn;

/**
 * The base-64 encoded SAML authentication response provided by the IdP.
 * <p>For more information, see <a
 * .com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring
 * a Relying Party and Adding Claims</a> in the <i>Using IAM</i> guide.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>4 - 50000<br/>
 */
@property (nonatomic, retain) NSString *sAMLAssertion;

/**
 * An AWS IAM policy in JSON format. <p>The temporary security
 * credentials that are returned by this operation have the permissions
 * that are associated with the access policy of the role being assumed,
 * except for any permissions explicitly denied by the policy you pass.
 * These policies and any applicable resource-based policies are
 * evaluated when calls to AWS are made using the temporary security
 * credentials. <note>The policy must be 2048 bytes or shorter, and its
 * packed size must be less than 450 bytes.</note>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2048<br/>
 * <b>Pattern: </b>[\u0009\u000A\u000D\u0020-\u00FF]+<br/>
 */
@property (nonatomic, retain) NSString *policy;

/**
 * The duration, in seconds, of the role session. The value can range
 * from 900 seconds (15 minutes) to 3600 seconds (1 hour). By default,
 * the value is set to 3600 seconds. An expiration can also be specified
 * in the SAML authentication response's <code>NotOnOrAfter</code> value.
 * The actual expiration time is whichever value is shorter. <note>The
 * maximum duration for a session is 1 hour, and the minimum duration is
 * 15 minutes, even if values outside this range are specified. </note>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>900 - 129600<br/>
 */
@property (nonatomic, retain) NSNumber *durationSeconds;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
