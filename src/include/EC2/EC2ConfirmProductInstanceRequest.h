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
 * Confirm Product Instance Request
 */

@interface EC2ConfirmProductInstanceRequest:AmazonServiceRequestConfig

{
    NSString *productCode;
    NSString *instanceId;
}



/**
 * The product code to confirm.
 */
@property (nonatomic, retain) NSString *productCode;

/**
 * The ID of the instance to confirm.
 */
@property (nonatomic, retain) NSString *instanceId;


/**
 * Default constructor for a new ConfirmProductInstanceRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ConfirmProductInstanceRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theProductCode The product code to confirm.
 * @param theInstanceId The ID of the instance to confirm.
 */
-(id)initWithProductCode:(NSString *)theProductCode andInstanceId:(NSString *)theInstanceId;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
