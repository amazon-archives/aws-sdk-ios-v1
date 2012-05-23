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

#import "../AmazonSDKUtil.h"



/**
 * Raw Message
 */

@interface SESRawMessage:NSObject

{
    NSData *data;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The raw data of the message. The client must ensure that the message
 * format complies with Internet email standards regarding email header
 * fields, MIME types, MIME encoding, and base64 encoding (if necessary).
 * <p>For more information, go to the<a
 * f="http://docs.amazonwebservices.com/ses/latest/DeveloperGuide">Amazon
 * SES Developer Guide</a>.
 */
@property (nonatomic, retain) NSData *data;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
