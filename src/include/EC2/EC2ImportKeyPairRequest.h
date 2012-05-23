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
 * Import Key Pair Request
 */

@interface EC2ImportKeyPairRequest:AmazonServiceRequestConfig

{
    NSString *keyName;
    NSString *publicKeyMaterial;
}



/**
 * The unique name for the key pair.
 */
@property (nonatomic, retain) NSString *keyName;

/**
 * The public key portion of the key pair being imported.
 */
@property (nonatomic, retain) NSString *publicKeyMaterial;


/**
 * Default constructor for a new ImportKeyPairRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ImportKeyPairRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theKeyName The unique name for the key pair.
 * @param thePublicKeyMaterial The public key portion of the key pair
 * being imported.
 */
-(id)initWithKeyName:(NSString *)theKeyName andPublicKeyMaterial:(NSString *)thePublicKeyMaterial;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
