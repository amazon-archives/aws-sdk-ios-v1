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

#import "AmazonSecurityTokenServiceClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonSecurityTokenServiceClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://sts.amazonaws.com";
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://sts.amazonaws.com";
    }
    return self;
}

-(SecurityTokenServiceGetSessionTokenResponse *)getSessionToken:(SecurityTokenServiceGetSessionTokenRequest *)getSessionTokenRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceGetSessionTokenRequestMarshaller createRequest:getSessionTokenRequest];

    return (SecurityTokenServiceGetSessionTokenResponse *)[self invoke:request rawRequest:getSessionTokenRequest unmarshallerDelegate:[SecurityTokenServiceGetSessionTokenResponseUnmarshaller class]];
}

-(SecurityTokenServiceGetFederationTokenResponse *)getFederationToken:(SecurityTokenServiceGetFederationTokenRequest *)getFederationTokenRequest
{
    AmazonServiceRequest *request = [SecurityTokenServiceGetFederationTokenRequestMarshaller createRequest:getFederationTokenRequest];

    return (SecurityTokenServiceGetFederationTokenResponse *)[self invoke:request rawRequest:getFederationTokenRequest unmarshallerDelegate:[SecurityTokenServiceGetFederationTokenResponseUnmarshaller class]];
}



@end

