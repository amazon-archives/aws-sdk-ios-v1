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

#import "EC2DeleteSecurityGroupRequestMarshaller.h"

@implementation EC2DeleteSecurityGroupRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeleteSecurityGroupRequest *)deleteSecurityGroupRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeleteSecurityGroup"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deleteSecurityGroupRequest delegate]];
    [request setCredentials:[deleteSecurityGroupRequest credentials]];
    [request setEndpoint:[deleteSecurityGroupRequest requestEndpoint]];
    [request setRequestTag:[deleteSecurityGroupRequest requestTag]];

    if (deleteSecurityGroupRequest != nil) {
        if (deleteSecurityGroupRequest.groupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteSecurityGroupRequest.groupName] forKey:[NSString stringWithFormat:@"%@", @"GroupName"]];
        }
    }
    if (deleteSecurityGroupRequest != nil) {
        if (deleteSecurityGroupRequest.groupId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteSecurityGroupRequest.groupId] forKey:[NSString stringWithFormat:@"%@", @"GroupId"]];
        }
    }


    return [request autorelease];
}

@end

