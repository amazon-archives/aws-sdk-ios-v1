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
#import "SecurityTokenServiceFederatedUser.h"

#import "SecurityTokenServiceResponse.h"

#import "SecurityTokenServicePackedPolicyTooLargeException.h"
#import "SecurityTokenServiceMalformedPolicyDocumentException.h"


/**
 * Get Federation Token Result
 */

@interface SecurityTokenServiceGetFederationTokenResponse:SecurityTokenServiceResponse

{
    SecurityTokenServiceCredentials   *credentials;
    SecurityTokenServiceFederatedUser *federatedUser;
    NSNumber                          *packedPolicySize;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Credentials for the service API authentication.
 */
@property (nonatomic, retain) SecurityTokenServiceCredentials *credentials;

/**
 * Identifiers for the federated user associated with the credentials
 * (such as <code>arn:aws:sts::123456789012:federated-user/Bob</code> or
 * <code>123456789012:Bob</code>). You can use the federated user's ARN
 * in your resource policies like in an Amazon S3 bucket policy.
 */
@property (nonatomic, retain) SecurityTokenServiceFederatedUser *federatedUser;

/**
 * A percentage value indicating the size of the policy in packed form.
 * The service rejects policies for which the packed size is greater than
 * 100 percent of the allowed value.
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
