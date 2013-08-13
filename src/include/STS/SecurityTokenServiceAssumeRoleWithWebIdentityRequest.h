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
 * Assume Role With Web Identity Request
 */

@interface SecurityTokenServiceAssumeRoleWithWebIdentityRequest:AmazonServiceRequestConfig

{
    NSString *roleArn;
    NSString *roleSessionName;
    NSString *webIdentityToken;
    NSString *providerId;
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
 * An identifier for the assumed role session. Typically, you pass the
 * name or identifier that is associated with the user who is using your
 * application. That way, the temporary security credentials that your
 * application will use are associated with that user. This session name
 * is included as part of the ARN and assumed role ID in the
 * <code>AssumedRoleUser</code> response element.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>2 - 32<br/>
 * <b>Pattern: </b>[\w+=,.@-]*<br/>
 */
@property (nonatomic, retain) NSString *roleSessionName;

/**
 * The OAuth 2.0 access token or OpenID Connect ID token that is provided
 * by the identity provider. Your application must get this token by
 * authenticating the user who is using your application with a web
 * identity provider before the application makes an
 * <code>AssumeRoleWithWebIdentity</code> call.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>4 - 2048<br/>
 */
@property (nonatomic, retain) NSString *webIdentityToken;

/**
 * The fully-qualified host component of the domain name of the identity
 * provider. Specify this value only for OAuth access tokens. Do not
 * specify this value for OpenID Connect ID tokens, such as
 * <code>accounts.google.com</code>. Do not include URL schemes and port
 * numbers. Currently, <code>www.amazon.com</code> and
 * <code>graph.facebook.com</code> are supported.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>4 - 2048<br/>
 */
@property (nonatomic, retain) NSString *providerId;

/**
 * A supplemental policy that is associated with the temporary security
 * credentials from the <code>AssumeRoleWithWebIdentity</code> call. The
 * resulting permissions of the temporary security credentials are an
 * intersection of this policy and the access policy that is associated
 * with the role. Use this policy to further restrict the permissions of
 * the temporary security credentials.
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
