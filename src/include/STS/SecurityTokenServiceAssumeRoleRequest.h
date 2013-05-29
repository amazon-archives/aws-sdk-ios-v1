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
 * Assume Role Request
 */

@interface SecurityTokenServiceAssumeRoleRequest:AmazonServiceRequestConfig

{
    NSString *roleArn;
    NSString *roleSessionName;
    NSString *policy;
    NSNumber *durationSeconds;
    NSString *externalId;
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
 * An identifier for the assumed role session. The session name is
 * included as part of the <code>AssumedRoleUser</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>2 - 32<br/>
 * <b>Pattern: </b>[\w+=,.@-]*<br/>
 */
@property (nonatomic, retain) NSString *roleSessionName;

/**
 * A supplemental policy that is associated with the temporary security
 * credentials from the <code>AssumeRole</code> call. The resulting
 * permissions of the temporary security credentials are an intersection
 * of this policy and the access policy that is associated with the role.
 * Use this policy to further restrict the permissions of the temporary
 * security credentials.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2048<br/>
 * <b>Pattern: </b>[\u0009\u000A\u000D\u0020-\u00FF]+<br/>
 */
@property (nonatomic, retain) NSString *policy;

/**
 * The duration, in seconds, of the role session. The value can range
 * from 900 seconds (15 minutes) to 3600 seconds (1 hour). By default,
 * the value is set to 3600 seconds.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>900 - 3600<br/>
 */
@property (nonatomic, retain) NSNumber *durationSeconds;

/**
 * A unique identifier that is used by third parties to assume a role in
 * their customers' accounts. For each role that the third party can
 * assume, they should instruct their customers to create a role with the
 * external ID that the third party generated. Each time the third party
 * assumes the role, they must pass the customer's external ID. The
 * external ID is useful in order to help third parties bind a role to
 * the customer who created it. For more information about the external
 * ID, see <a
 * ocs.aws.amazon.com/STS/latest/UsingSTS/sts-delegating-externalid.html"
 * target="_blank">About the External ID</a> in <i>Using Temporary
 * Security Credentials</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>2 - 96<br/>
 * <b>Pattern: </b>[\w+=,.@:-]*<br/>
 */
@property (nonatomic, retain) NSString *externalId;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
