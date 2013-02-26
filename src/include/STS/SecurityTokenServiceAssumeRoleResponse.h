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
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "SecurityTokenServicePackedPolicyTooLargeException.h"
#import "SecurityTokenServiceMalformedPolicyDocumentException.h"


/**
 * Assume Role Result
 */

@interface SecurityTokenServiceAssumeRoleResponse:SecurityTokenServiceResponse

{
    SecurityTokenServiceCredentials     *credentials;
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
 * The temporary security credentials, which includes an Access Key ID, a
 * Secret Access Key, and a security token.
 */
@property (nonatomic, retain) SecurityTokenServiceCredentials *credentials;

/**
 * The Amazon Resource Name (ARN) and the assumed role ID for the
 * temporary security credentials. The ARN and the role ID are
 * identifiers for the temporary security credentials so that you can
 * refer to the temporary credentials in a policy. For example, if you
 * want to build a policy that applies to these temporary credentials,
 * you would specify the <code>AssumedRoleUser</code> ARN or role ID in
 * that policy.
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
