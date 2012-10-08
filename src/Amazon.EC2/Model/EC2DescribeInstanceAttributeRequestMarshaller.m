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

#import "EC2DescribeInstanceAttributeRequestMarshaller.h"

@implementation EC2DescribeInstanceAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeInstanceAttributeRequest *)describeInstanceAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeInstanceAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeInstanceAttributeRequest delegate]];
    [request setCredentials:[describeInstanceAttributeRequest credentials]];
    [request setEndpoint:[describeInstanceAttributeRequest requestEndpoint]];
    [request setRequestTag:[describeInstanceAttributeRequest requestTag]];

    if (describeInstanceAttributeRequest != nil) {
        if (describeInstanceAttributeRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeInstanceAttributeRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (describeInstanceAttributeRequest != nil) {
        if (describeInstanceAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeInstanceAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }


    return [request autorelease];
}

@end

