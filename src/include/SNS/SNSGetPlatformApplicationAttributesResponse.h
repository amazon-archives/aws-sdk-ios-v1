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


#import "SNSResponse.h"

#import "SNSNotFoundException.h"
#import "SNSAuthorizationErrorException.h"
#import "SNSInternalErrorException.h"
#import "SNSInvalidParameterException.h"


/**
 * Get Platform Application Attributes Result
 */

@interface SNSGetPlatformApplicationAttributesResponse:SNSResponse

{
    NSMutableDictionary *attributes;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Attributes include the following: <ul> <!-- AllowEndpointPolicies,
 * EventDeliveryAttemptFailure, and Policy are not yet supported. Will
 * remove comments once it is available --> <!--
 * <li><code>AllowEndpointPolicies</code> true or false (default false) -
 * If true, then policies on endpoints will be evaluated to determine if
 * the topic or user has the rights to send messages to it. If false, the
 * endpoint policy will be ignored and only the mobile app policy will be
 * considered.</li> --> <li><code>EventEndpointCreated</code> -- Topic
 * ARN to which EndpointCreated event notifications should be sent.</li>
 * <li><code>EventEndpointDeleted</code> -- Topic ARN to which
 * EndpointDeleted event notifications should be sent.</li>
 * <li><code>EventEndpointUpdated</code> -- Topic ARN to which
 * EndpointUpdate event notifications should be sent.</li> <!--
 * <li><code>EventDeliveryAttemptFailure</code> Topic ARN to which
 * DeliveryAttemptFailure event notifications should be sent upon Direct
 * Publish delivery attempt failures to one of the application's
 * endpoints.</li> --> <li><code>EventDeliveryFailure</code> -- Topic ARN
 * to which DeliveryFailure event notifications should be sent upon
 * Direct Publish delivery failure (permanent) to one of the
 * application's endpoints.</li> <!-- <li><code>Policy</code> Access
 * policy controlling who can send messages to endpoints under this
 * mobile app.</li> --> </ul>
 */
@property (nonatomic, retain) NSMutableDictionary *attributes;

/**
 * Returns a value from the attributes dictionary for the specified key.
 */
-(NSString *)attributesValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
