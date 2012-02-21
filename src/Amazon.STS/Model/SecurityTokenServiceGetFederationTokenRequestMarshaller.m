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

#import "SecurityTokenServiceGetFederationTokenRequestMarshaller.h"

@implementation SecurityTokenServiceGetFederationTokenRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SecurityTokenServiceGetFederationTokenRequest *)getFederationTokenRequest
{
    AmazonServiceRequest *request = [[SecurityTokenServiceRequest alloc] init];

    [request setParameterValue:@"GetFederationToken"           forKey:@"Action"];
    [request setParameterValue:@"2011-06-15"   forKey:@"Version"];

    [request setDelegate:[getFederationTokenRequest delegate]];
    [request setCredentials:[getFederationTokenRequest credentials]];
    [request setEndpoint:[getFederationTokenRequest requestEndpoint]];
    [request setRequestTag:[getFederationTokenRequest requestTag]];

    if (getFederationTokenRequest != nil) {
        if (getFederationTokenRequest.name != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getFederationTokenRequest.name] forKey:[NSString stringWithFormat:@"%@", @"Name"]];
        }
    }
    if (getFederationTokenRequest != nil) {
        if (getFederationTokenRequest.policy != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getFederationTokenRequest.policy] forKey:[NSString stringWithFormat:@"%@", @"Policy"]];
        }
    }
    if (getFederationTokenRequest != nil) {
        if (getFederationTokenRequest.durationSeconds != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getFederationTokenRequest.durationSeconds] forKey:[NSString stringWithFormat:@"%@", @"DurationSeconds"]];
        }
    }


    return [request autorelease];
}

@end

