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

#import "SecurityTokenServiceAssumeRoleWithWebIdentityRequestMarshaller.h"

@implementation SecurityTokenServiceAssumeRoleWithWebIdentityRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SecurityTokenServiceAssumeRoleWithWebIdentityRequest *)assumeRoleWithWebIdentityRequest
{
    AmazonServiceRequest *request = [[SecurityTokenServiceRequest alloc] init];

    [request setParameterValue:@"AssumeRoleWithWebIdentity"           forKey:@"Action"];
    [request setParameterValue:@"2011-06-15"   forKey:@"Version"];

    [request setDelegate:[assumeRoleWithWebIdentityRequest delegate]];
    [request setCredentials:[assumeRoleWithWebIdentityRequest credentials]];
    [request setEndpoint:[assumeRoleWithWebIdentityRequest requestEndpoint]];
    [request setRequestTag:[assumeRoleWithWebIdentityRequest requestTag]];

    if (assumeRoleWithWebIdentityRequest != nil) {
        if (assumeRoleWithWebIdentityRequest.roleArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithWebIdentityRequest.roleArn] forKey:[NSString stringWithFormat:@"%@", @"RoleArn"]];
        }
    }
    if (assumeRoleWithWebIdentityRequest != nil) {
        if (assumeRoleWithWebIdentityRequest.roleSessionName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithWebIdentityRequest.roleSessionName] forKey:[NSString stringWithFormat:@"%@", @"RoleSessionName"]];
        }
    }
    if (assumeRoleWithWebIdentityRequest != nil) {
        if (assumeRoleWithWebIdentityRequest.webIdentityToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithWebIdentityRequest.webIdentityToken] forKey:[NSString stringWithFormat:@"%@", @"WebIdentityToken"]];
        }
    }
    if (assumeRoleWithWebIdentityRequest != nil) {
        if (assumeRoleWithWebIdentityRequest.providerId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithWebIdentityRequest.providerId] forKey:[NSString stringWithFormat:@"%@", @"ProviderId"]];
        }
    }
    if (assumeRoleWithWebIdentityRequest != nil) {
        if (assumeRoleWithWebIdentityRequest.policy != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithWebIdentityRequest.policy] forKey:[NSString stringWithFormat:@"%@", @"Policy"]];
        }
    }
    if (assumeRoleWithWebIdentityRequest != nil) {
        if (assumeRoleWithWebIdentityRequest.durationSeconds != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithWebIdentityRequest.durationSeconds] forKey:[NSString stringWithFormat:@"%@", @"DurationSeconds"]];
        }
    }


    return [request autorelease];
}

@end

