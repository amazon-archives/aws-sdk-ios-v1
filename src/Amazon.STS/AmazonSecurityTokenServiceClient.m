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
#import "AmazonEndpoints.h"
#import "AmazonServiceRequest.h"
#import "SecurityTokenServiceGetSessionTokenResponseUnmarshaller.h"
#import "SecurityTokenServiceGetSessionTokenRequestMarshaller.h"
#import "SecurityTokenServiceDecodeAuthorizationMessageResponseUnmarshaller.h"
#import "SecurityTokenServiceDecodeAuthorizationMessageRequestMarshaller.h"
#import "SecurityTokenServiceAssumeRoleWithWebIdentityResponseUnmarshaller.h"
#import "SecurityTokenServiceAssumeRoleWithWebIdentityRequestMarshaller.h"
#import "SecurityTokenServiceGetFederationTokenResponseUnmarshaller.h"
#import "SecurityTokenServiceGetFederationTokenRequestMarshaller.h"
#import "SecurityTokenServiceAssumeRoleResponseUnmarshaller.h"
#import "SecurityTokenServiceAssumeRoleRequestMarshaller.h"


@implementation AmazonSecurityTokenServiceClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = AMAZON_STS_ENDPOINT_SECURE;
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = AMAZON_STS_ENDPOINT_SECURE;
    }
    return self;
}

-(id)initWithCredentialsProvider:(id<AmazonCredentialsProvider> )theProvider
{
    if (self = [super initWithCredentialsProvider:theProvider]) {
        self.endpoint = AMAZON_STS_ENDPOINT_SECURE;
    }
    return self;
}


-(id)init
{
    if (self = [super init]) {
        self.endpoint = AMAZON_STS_ENDPOINT_SECURE;
    }
    return self;
}

-(SecurityTokenServiceGetSessionTokenResponse *)getSessionToken:(SecurityTokenServiceGetSessionTokenRequest *)getSessionTokenRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceGetSessionTokenRequestMarshaller createRequest:getSessionTokenRequest];

    return (SecurityTokenServiceGetSessionTokenResponse *)[self invoke:request rawRequest:getSessionTokenRequest unmarshallerDelegate:[SecurityTokenServiceGetSessionTokenResponseUnmarshaller class]];
}

-(SecurityTokenServiceDecodeAuthorizationMessageResponse *)decodeAuthorizationMessage:(SecurityTokenServiceDecodeAuthorizationMessageRequest *)decodeAuthorizationMessageRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceDecodeAuthorizationMessageRequestMarshaller createRequest:decodeAuthorizationMessageRequest];

    return (SecurityTokenServiceDecodeAuthorizationMessageResponse *)[self invoke:request rawRequest:decodeAuthorizationMessageRequest unmarshallerDelegate:[SecurityTokenServiceDecodeAuthorizationMessageResponseUnmarshaller class]];
}

-(SecurityTokenServiceAssumeRoleWithWebIdentityResponse *)assumeRoleWithWebIdentity:(SecurityTokenServiceAssumeRoleWithWebIdentityRequest *)assumeRoleWithWebIdentityRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceAssumeRoleWithWebIdentityRequestMarshaller createRequest:assumeRoleWithWebIdentityRequest];

    return (SecurityTokenServiceAssumeRoleWithWebIdentityResponse *)[self invoke:request rawRequest:assumeRoleWithWebIdentityRequest unmarshallerDelegate:[SecurityTokenServiceAssumeRoleWithWebIdentityResponseUnmarshaller class] andSign:NO];
}

-(SecurityTokenServiceGetFederationTokenResponse *)getFederationToken:(SecurityTokenServiceGetFederationTokenRequest *)getFederationTokenRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceGetFederationTokenRequestMarshaller createRequest:getFederationTokenRequest];

    return (SecurityTokenServiceGetFederationTokenResponse *)[self invoke:request rawRequest:getFederationTokenRequest unmarshallerDelegate:[SecurityTokenServiceGetFederationTokenResponseUnmarshaller class]];
}

-(SecurityTokenServiceAssumeRoleResponse *)assumeRole:(SecurityTokenServiceAssumeRoleRequest *)assumeRoleRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceAssumeRoleRequestMarshaller createRequest:assumeRoleRequest];

    return (SecurityTokenServiceAssumeRoleResponse *)[self invoke:request rawRequest:assumeRoleRequest unmarshallerDelegate:[SecurityTokenServiceAssumeRoleResponseUnmarshaller class]];
}



@end

