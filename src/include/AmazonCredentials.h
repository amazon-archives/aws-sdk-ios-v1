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

#import <Foundation/Foundation.h>

@interface AmazonCredentials : NSObject <NSCopying>
{
}

/** Inits the credential with the access key and the secret key.
 *
 * @param accessKey The AWS Access Key
 * @param secretKey The AWS Secret Key
 */
-(id)initWithAccessKey:(NSString *)accessKey withSecretKey:(NSString *)secretKey;

/** Inits the credential with the access key and the secret key.
 *
 * @param theAccessKey The AWS Access Key
 * @param theSecretKey The AWS Secret Key
 * @param theSecurityToken The AWS Security Token
 */
-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey withSecurityToken:(NSString *)theSecurityToken;

/** The AWS Access Key */
@property (nonatomic, retain) NSString *accessKey;

/** The AWS Secret Key */
@property (nonatomic, retain) NSString *secretKey;

/** The AWS Security Token, used inconjunction with Session Based Credentials. */
@property (nonatomic, retain) NSString *securityToken;

@end

