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
 * Secure Token Service (STS) with Web Identity Federation.
 *
 * @see AmazonCredentialsProvider
 */
@interface AmazonWIFCredentialsProvider : NSObject<AmazonCredentialsProvider>

/**
 * The duration of the credentials generated for STS in seconds
 * Defaults to 3600 (1 hour)
 */
@property (nonatomic, assign) NSInteger sessionLength;

/**
 * The threshold at which the credentials will be refreshed prior to their expiration
 * Defaults to 300 (5 minutes)
 */
@property (nonatomic, assign) NSInteger refreshThreshold;


/**
 * The identity that was returned from the Identity Provider that uniquely identifies
 * the user.
 */
@property (readonly) NSString *subjectFromWIF;

/** Inits the provider with information from the Identity Provider.
 *
 * @param roleArn ARN for IAM Role to assume
 * @param token The OAuth/OpenID token from the Identity Provider
 * @param providerId The Provider ID that specifies where the token came from (nil for OpenID providers)
 */
-(id)initWithRole:(NSString *)roleArn andWebIdentityToken:(NSString *)token fromProvider:(NSString *)providerId;

/** Inits the provider with information from the Identity Provider and a pre-configured client
 *
 * @param theClient The STS client to use to make requests.  Note: this client does not need credentials.
 * @param roleArn ARN for IAM Role to assume
 * @param token The OAuth/OpenID token from the Identity Provider
 * @param providerId The Provider ID that specifies where the token came from (nil for OpenID providers)
 */
-(id)initWithClient:(AmazonSecurityTokenServiceClient *)theClient andRole:(NSString *)roleArn andWebIdentityToken:(NSString *)token fromProvider:(NSString *)providerId;


@end
