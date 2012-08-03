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

#import "SecurityTokenServiceGetSessionTokenRequestMarshaller.h"

@implementation SecurityTokenServiceGetSessionTokenRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SecurityTokenServiceGetSessionTokenRequest *)getSessionTokenRequest
{
    AmazonServiceRequest *request = [[SecurityTokenServiceRequest alloc] init];

    [request setParameterValue:@"GetSessionToken"           forKey:@"Action"];
    [request setParameterValue:@"2011-06-15"   forKey:@"Version"];

    [request setDelegate:[getSessionTokenRequest delegate]];
    [request setCredentials:[getSessionTokenRequest credentials]];
    [request setEndpoint:[getSessionTokenRequest requestEndpoint]];
    [request setRequestTag:[getSessionTokenRequest requestTag]];

    if (getSessionTokenRequest != nil) {
        if (getSessionTokenRequest.durationSeconds != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getSessionTokenRequest.durationSeconds] forKey:[NSString stringWithFormat:@"%@", @"DurationSeconds"]];
        }
    }
    if (getSessionTokenRequest != nil) {
        if (getSessionTokenRequest.serialNumber != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getSessionTokenRequest.serialNumber] forKey:[NSString stringWithFormat:@"%@", @"SerialNumber"]];
        }
    }
    if (getSessionTokenRequest != nil) {
        if (getSessionTokenRequest.tokenCode != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getSessionTokenRequest.tokenCode] forKey:[NSString stringWithFormat:@"%@", @"TokenCode"]];
        }
    }


    return [request autorelease];
}

@end

