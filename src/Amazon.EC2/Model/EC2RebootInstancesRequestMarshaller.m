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

#import "EC2RebootInstancesRequestMarshaller.h"

@implementation EC2RebootInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2RebootInstancesRequest *)rebootInstancesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"RebootInstances"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[rebootInstancesRequest delegate]];
    [request setCredentials:[rebootInstancesRequest credentials]];
    [request setEndpoint:[rebootInstancesRequest requestEndpoint]];
    [request setRequestTag:[rebootInstancesRequest requestTag]];


    if (rebootInstancesRequest != nil) {
        int instanceIdsListIndex = 1;
        for (NSString *instanceIdsListValue in rebootInstancesRequest.instanceIds) {
            if (instanceIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", instanceIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"InstanceId", instanceIdsListIndex]];
            }

            instanceIdsListIndex++;
        }
    }


    return [request autorelease];
}

@end

