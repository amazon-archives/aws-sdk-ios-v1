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
 * Get Federation Token Request
 */

@interface SecurityTokenServiceGetFederationTokenRequest:AmazonServiceRequestConfig

{
    NSString *name;
    NSString *policy;
    NSNumber *durationSeconds;
}



/**
 * The name of the federated user associated with the credentials. For
 * information about limitations on user names, go to <a
 * vices.com/IAM/latest/UserGuide/LimitationsOnEntities.html">Limitations
 * on IAM Entities</a> in <i>Using AWS Identity and Access
 * Management</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>2 - 32<br/>
 * <b>Pattern: </b>[\w+=,.@-]*<br/>
 */
@property (nonatomic, retain) NSString *name;

/**
 * A policy specifying the permissions to associate with the credentials.
 * The caller can delegate their own permissions by specifying a policy,
 * and both policies will be checked when a service call is made. For
 * more information about how permissions work in the context of
 * temporary credentials, see <a
 * docs.amazonwebservices.com/IAM/latest/UserGuide/TokenPermissions.html"
 * target="_blank">Controlling Permissions in Temporary Credentials</a>
 * in <i>Using AWS Identity and Access Management</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2048<br/>
 * <b>Pattern: </b>[\u0009\u000A\u000D\u0020-\u00FF]+<br/>
 */
@property (nonatomic, retain) NSString *policy;

/**
 * The duration, in seconds, that the session should last. Acceptable
 * durations for federation sessions range from 3600s (one hour) to
 * 129600s (36 hours), with 43200s (12 hours) as the default.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>3600 - 129600<br/>
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
 * @param theName The name of the federated user associated with the
 * credentials. For information about limitations on user names, go to <a
 * vices.com/IAM/latest/UserGuide/LimitationsOnEntities.html">Limitations
 * on IAM Entities</a> in <i>Using AWS Identity and Access
 * Management</i>.
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
