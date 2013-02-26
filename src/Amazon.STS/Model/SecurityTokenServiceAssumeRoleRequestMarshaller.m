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

#import "SecurityTokenServiceAssumeRoleRequestMarshaller.h"

@implementation SecurityTokenServiceAssumeRoleRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SecurityTokenServiceAssumeRoleRequest *)assumeRoleRequest
{
    AmazonServiceRequest *request = [[SecurityTokenServiceRequest alloc] init];

    [request setParameterValue:@"AssumeRole"           forKey:@"Action"];
    [request setParameterValue:@"2011-06-15"   forKey:@"Version"];

    [request setDelegate:[assumeRoleRequest delegate]];
    [request setCredentials:[assumeRoleRequest credentials]];
    [request setEndpoint:[assumeRoleRequest requestEndpoint]];
    [request setRequestTag:[assumeRoleRequest requestTag]];

    if (assumeRoleRequest != nil) {
        if (assumeRoleRequest.roleArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleRequest.roleArn] forKey:[NSString stringWithFormat:@"%@", @"RoleArn"]];
        }
    }
    if (assumeRoleRequest != nil) {
        if (assumeRoleRequest.roleSessionName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleRequest.roleSessionName] forKey:[NSString stringWithFormat:@"%@", @"RoleSessionName"]];
        }
    }
    if (assumeRoleRequest != nil) {
        if (assumeRoleRequest.policy != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleRequest.policy] forKey:[NSString stringWithFormat:@"%@", @"Policy"]];
        }
    }
    if (assumeRoleRequest != nil) {
        if (assumeRoleRequest.durationSeconds != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleRequest.durationSeconds] forKey:[NSString stringWithFormat:@"%@", @"DurationSeconds"]];
        }
    }
    if (assumeRoleRequest != nil) {
        if (assumeRoleRequest.externalId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleRequest.externalId] forKey:[NSString stringWithFormat:@"%@", @"ExternalId"]];
        }
    }


    return [request autorelease];
}

@end

