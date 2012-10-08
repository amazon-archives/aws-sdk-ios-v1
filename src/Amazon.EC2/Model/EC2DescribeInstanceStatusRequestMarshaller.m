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

#import "EC2DescribeInstanceStatusRequestMarshaller.h"

@implementation EC2DescribeInstanceStatusRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeInstanceStatusRequest *)describeInstanceStatusRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeInstanceStatus"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeInstanceStatusRequest delegate]];
    [request setCredentials:[describeInstanceStatusRequest credentials]];
    [request setEndpoint:[describeInstanceStatusRequest requestEndpoint]];
    [request setRequestTag:[describeInstanceStatusRequest requestTag]];


    if (describeInstanceStatusRequest != nil) {
        int instanceIdsListIndex = 1;
        for (NSString *instanceIdsListValue in describeInstanceStatusRequest.instanceIds) {
            if (instanceIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", instanceIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"InstanceId", instanceIdsListIndex]];
            }

            instanceIdsListIndex++;
        }
    }

    if (describeInstanceStatusRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeInstanceStatusRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Filter", filtersListIndex, @"Name"]];
                }
            }

            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"Filter", filtersListIndex, @"Value", valuesListIndex]];
                    }

                    valuesListIndex++;
                }
            }

            filtersListIndex++;
        }
    }
    if (describeInstanceStatusRequest != nil) {
        if (describeInstanceStatusRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeInstanceStatusRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeInstanceStatusRequest != nil) {
        if (describeInstanceStatusRequest.maxResults != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeInstanceStatusRequest.maxResults] forKey:[NSString stringWithFormat:@"%@", @"MaxResults"]];
        }
    }
    if (describeInstanceStatusRequest != nil) {
        if (describeInstanceStatusRequest.includeAllInstancesIsSet) {
            [request setParameterValue:(describeInstanceStatusRequest.includeAllInstances ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"IncludeAllInstances"]];
        }
    }


    return [request autorelease];
}

@end

