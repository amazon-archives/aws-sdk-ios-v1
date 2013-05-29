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

#import "SecurityTokenServiceCredentials.h"
#import "SecurityTokenServiceAssumedRoleUser.h"

#import "SecurityTokenServiceResponse.h"

#import "SecurityTokenServicePackedPolicyTooLargeException.h"
#import "SecurityTokenServiceIDPRejectedClaimException.h"
#import "SecurityTokenServiceMalformedPolicyDocumentException.h"
#import "SecurityTokenServiceInvalidIdentityTokenException.h"
#import "SecurityTokenServiceExpiredTokenException.h"
#import "SecurityTokenServiceIDPCommunicationErrorException.h"


/**
 * Assume Role With Web Identity Result
 */

@interface SecurityTokenServiceAssumeRoleWithWebIdentityResponse:SecurityTokenServiceResponse

{
    SecurityTokenServiceCredentials     *credentials;
    NSString                            *subjectFromWebIdentityToken;
    SecurityTokenServiceAssumedRoleUser *assumedRoleUser;
    NSNumber                            *packedPolicySize;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The temporary security credentials, which include an access key ID, a
 * secret access key, and a security token.
 */
@property (nonatomic, retain) SecurityTokenServiceCredentials *credentials;

/**
 * The unique user identifier that is returned by the identity provider.
 * This identifier is associated with the <code>WebIdentityToken</code>
 * that was submitted with the <code>AssumeRoleWithWebIdentity</code>
 * call. The identifier is typically unique to the user and the
 * application that acquired the <code>WebIdentityToken</code> (pairwise
 * identifier). If an OpenID Connect ID token was submitted in the
 * <code>WebIdentityToken</code>, this value is returned by the identity
 * provider as the token's <code>sub</code> (Subject) claim.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>6 - 255<br/>
 */
@property (nonatomic, retain) NSString *subjectFromWebIdentityToken;

/**
 * The Amazon Resource Name (ARN) and the assumed role ID, which are
 * identifiers that you can use to refer to the resulting temporary
 * security credentials. For example, you can reference these credentials
 * as a principal in a resource-based policy by using the ARN or assumed
 * role ID. The ARN and ID include the <code>RoleSessionName</code> that
 * you specified when you called <code>AssumeRole</code>.
 */
@property (nonatomic, retain) SecurityTokenServiceAssumedRoleUser *assumedRoleUser;

/**
 * A percentage value that indicates the size of the policy in packed
 * form. The service rejects any policy with a packed size greater than
 * 100 percent, which means the policy exceeded the allowed space.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>0 - <br/>
 */
@property (nonatomic, retain) NSNumber *packedPolicySize;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
