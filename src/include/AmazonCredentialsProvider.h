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

#import "AmazonCredentials.h"

/** The protocol for AmazonCredential Providers
 *
 * Credential providers provide credentials to service clients (either long term or session
 * credentials).  The only public interfaces for providers are to provide the credentials
 * or refresh the credentials.  The implementation of the protocol can choose to handle these
 * operations however they choose, but developers should be aware of thread/resource contention
 * when implementing this protocol.
 *
 * Common patterns include using AWS Security Token Service or a custom api, such as a Token
 * Vending Machine, to deliver temporary credentials.  It is recommended that providers refresh
 * tokens slightly prior to their expiration to improve performance and reliability.
 *
 */
@protocol AmazonCredentialsProvider <NSObject>

@required

/** 
 * Provide the credentials object to use for service calls.  Could be long term credentials
 * or session (short-term) credentials.
 */
- (AmazonCredentials *)credentials;

/**
 * Tells the provider to refresh the credentials.  Will be called by service client if they
 * detect an invalid token or expired token error.
 */
- (void)refresh;

@end
