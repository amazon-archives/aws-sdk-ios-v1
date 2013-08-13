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
 * Set Endpoint Attributes Request
 */

@interface SNSSetEndpointAttributesRequest:AmazonServiceRequestConfig

{
    NSString            *endpointArn;
    NSMutableDictionary *attributes;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 *
 */
@property (nonatomic, retain) NSString *endpointArn;

/**
 * A map of the endpoint attributes. Attributes in this map include the
 * following: <ul> <!-- Policy is not yet supported. Will remove comments
 * once it is available --> <li><code>CustomUserData</code> -- arbitrary
 * user data to associate with the endpoint. SNS does not use this data.
 * The data must be in UTF-8 format and less than 2KB.</li>
 * <li><code>Enabled</code> -- flag that enables/disables delivery to the
 * endpoint. Message Processor will set this to false when a notification
 * service indicates to SNS that the endpoint is invalid. Users can set
 * it back to true, typically after updating Token.</li> <!--
 * <li><code>Policy</code> access policy controlling who can send
 * messages to this endpoint .</li> --> <li><code>Token</code> -- device
 * token, also referred to as a registration id, for an app and mobile
 * device. This is returned from the notification service when an app and
 * mobile device are registered with the notification service.</li> </ul>
 */
@property (nonatomic, retain) NSMutableDictionary *attributes;


/**
 * Set a value in the dictionary attributes for the specified key.
 * This function will alloc and init attributes if not already done.
 */
-(void)setAttributesValue:(NSString *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
