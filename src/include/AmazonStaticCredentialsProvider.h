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

#import "AmazonCredentialsProvider.h"

/** 
 * A wrapper for static/long-term credentials.  Embedding credentials in your application is not recommended.
 *
 * @see AmazonCredentialsProvider
 */
@interface AmazonStaticCredentialsProvider : NSObject<AmazonCredentialsProvider> {
    AmazonCredentials* staticCredentials;
}

/** Inits the provider with the access key and the secret key.
 *
 * @param accessKey The AWS Access Key
 * @param secretKey The AWS Secret Key
 */
-(id)initWithAccessKey:(NSString *)accessKey withSecretKey:(NSString *)secretKey;

/** Inits the provider with a pre-allocated AmazonCredentials object
 *
 * @param theCredentials the static credentials to provide to clients
 */
-(id)initWithCredentials:(AmazonCredentials *)theCredentials;

@end
