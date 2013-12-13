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

#import "SecurityTokenServiceAssumeRoleWithSAMLRequestMarshaller.h"

@implementation SecurityTokenServiceAssumeRoleWithSAMLRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SecurityTokenServiceAssumeRoleWithSAMLRequest *)assumeRoleWithSAMLRequest
{
    AmazonServiceRequest *request = [[SecurityTokenServiceRequest alloc] init];

    [request setParameterValue:@"AssumeRoleWithSAML"           forKey:@"Action"];
    [request setParameterValue:@"2011-06-15"   forKey:@"Version"];

    [request setDelegate:[assumeRoleWithSAMLRequest delegate]];
    [request setCredentials:[assumeRoleWithSAMLRequest credentials]];
    [request setEndpoint:[assumeRoleWithSAMLRequest requestEndpoint]];
    [request setRequestTag:[assumeRoleWithSAMLRequest requestTag]];

    if (assumeRoleWithSAMLRequest != nil) {
        if (assumeRoleWithSAMLRequest.roleArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithSAMLRequest.roleArn] forKey:[NSString stringWithFormat:@"%@", @"RoleArn"]];
        }
    }
    if (assumeRoleWithSAMLRequest != nil) {
        if (assumeRoleWithSAMLRequest.principalArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithSAMLRequest.principalArn] forKey:[NSString stringWithFormat:@"%@", @"PrincipalArn"]];
        }
    }
    if (assumeRoleWithSAMLRequest != nil) {
        if (assumeRoleWithSAMLRequest.sAMLAssertion != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithSAMLRequest.sAMLAssertion] forKey:[NSString stringWithFormat:@"%@", @"SAMLAssertion"]];
        }
    }
    if (assumeRoleWithSAMLRequest != nil) {
        if (assumeRoleWithSAMLRequest.policy != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithSAMLRequest.policy] forKey:[NSString stringWithFormat:@"%@", @"Policy"]];
        }
    }
    if (assumeRoleWithSAMLRequest != nil) {
        if (assumeRoleWithSAMLRequest.durationSeconds != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", assumeRoleWithSAMLRequest.durationSeconds] forKey:[NSString stringWithFormat:@"%@", @"DurationSeconds"]];
        }
    }


    return [request autorelease];
}

@end

