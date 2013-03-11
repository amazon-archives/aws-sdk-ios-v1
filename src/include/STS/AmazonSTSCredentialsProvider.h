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

#import "AmazonSecurityTokenServiceClient.h"

/**
 * An implementation of AmazonCredentialsProvider which makes calls to AWS 
 * Secure Token Service (STS) to get temporary credentials.
 *
 * @see AmazonCredentialsProvider
 */
@interface AmazonSTSCredentialsProvider : NSObject<AmazonCredentialsProvider>

/** 
 * The duration of the credentials generated for STS in seconds
 * Defaults to 3600 (1 hour)
 */
@property (nonatomic, assign) NSInteger sessionLength;

/** Inits the provider with the access key and the secret key.
 *
 * @param accessKey The AWS Access Key
 * @param secretKey The AWS Secret Key
 */
-(id)initWithAccessKey:(NSString *)accessKey withSecretKey:(NSString *)secretKey;

/** Inits the provider with a pre-allocated AmazonCredentials object
 *
 * @param stsCredentials Credentials to use to communicate with STS
 */
-(id)initWithCredentials:(AmazonCredentials *)theCredentials;

/** Inits the provider with a pre-allocated/configured AmazonSecurityTokenServiceClient object
 *
 * @param stsCredentials A pre-allocated/configured STS client
 */
-(id)initWithClient:(AmazonSecurityTokenServiceClient *)theClient;

@end
