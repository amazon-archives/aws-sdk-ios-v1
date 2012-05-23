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




/**
 * Federated User
 */

@interface SecurityTokenServiceFederatedUser:NSObject

{
    NSString *federatedUserId;
    NSString *arn;
}



/**
 * The string identifying the federated user associated with the
 * credentials, similar to the UserId of an IAM user.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>2 - 96<br/>
 * <b>Pattern: </b>[\w+=,.@-\:]*<br/>
 */
@property (nonatomic, retain) NSString *federatedUserId;

/**
 * The ARN specifying the federated user associated with the credentials.
 * For more information about ARNs and how to use them in policies, see
 * <a
 * ocs.amazonwebservices.com/IAM/latest/UserGuide/Using_Identifiers.html"
 * target="_blank">Identifiers for IAM Entities</a> in <i>Using AWS
 * Identity and Access Management</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>20 - 2048<br/>
 */
@property (nonatomic, retain) NSString *arn;


/**
 * Default constructor for a new FederatedUser object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new FederatedUser object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theFederatedUserId The string identifying the federated user
 * associated with the credentials, similar to the UserId of an IAM user.
 * @param theArn The ARN specifying the federated user associated with
 * the credentials. For more information about ARNs and how to use them
 * in policies, see <a
 * ocs.amazonwebservices.com/IAM/latest/UserGuide/Using_Identifiers.html"
 * target="_blank">Identifiers for IAM Entities</a> in <i>Using AWS
 * Identity and Access Management</i>.
 */
-(id)initWithFederatedUserId:(NSString *)theFederatedUserId andArn:(NSString *)theArn;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
