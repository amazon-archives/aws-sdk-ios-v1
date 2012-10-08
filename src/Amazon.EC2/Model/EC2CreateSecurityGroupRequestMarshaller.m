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

#import "EC2CreateSecurityGroupRequestMarshaller.h"

@implementation EC2CreateSecurityGroupRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CreateSecurityGroupRequest *)createSecurityGroupRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CreateSecurityGroup"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[createSecurityGroupRequest delegate]];
    [request setCredentials:[createSecurityGroupRequest credentials]];
    [request setEndpoint:[createSecurityGroupRequest requestEndpoint]];
    [request setRequestTag:[createSecurityGroupRequest requestTag]];

    if (createSecurityGroupRequest != nil) {
        if (createSecurityGroupRequest.groupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSecurityGroupRequest.groupName] forKey:[NSString stringWithFormat:@"%@", @"GroupName"]];
        }
    }
    if (createSecurityGroupRequest != nil) {
        if (createSecurityGroupRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSecurityGroupRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"GroupDescription"]];
        }
    }
    if (createSecurityGroupRequest != nil) {
        if (createSecurityGroupRequest.vpcId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSecurityGroupRequest.vpcId] forKey:[NSString stringWithFormat:@"%@", @"VpcId"]];
        }
    }


    return [request autorelease];
}

@end

