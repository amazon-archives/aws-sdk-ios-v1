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
 * Create Platform Endpoint Request
 */

@interface SNSCreatePlatformEndpointRequest:AmazonServiceRequestConfig

{
    NSString            *platformApplicationArn;
    NSString            *token;
    NSString            *customUserData;
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
@property (nonatomic, retain) NSString *platformApplicationArn;

/**
 * Unique identifier created by the notification service for an app on a
 * device. The specific name for Token will vary, depending on which
 * notification service is being used. For example, when using APNS as
 * the notification service, you need the device token. Alternatively,
 * when using GCM or ADM, the device token equivalent is called the
 * registration ID.
 */
@property (nonatomic, retain) NSString *token;

/**
 * Arbitrary user data to associate with the endpoint. SNS does not use
 * this data. The data must be in UTF-8 format and less than 2KB.
 */
@property (nonatomic, retain) NSString *customUserData;

/**
 * For a list of attributes, see <a
 * /latest/api/API_SetEndpointAttributes.html">SetEndpointAttributes</a>.
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
