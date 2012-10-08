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

#import "EC2DescribeVolumeStatusRequestMarshaller.h"

@implementation EC2DescribeVolumeStatusRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeVolumeStatusRequest *)describeVolumeStatusRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeVolumeStatus"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeVolumeStatusRequest delegate]];
    [request setCredentials:[describeVolumeStatusRequest credentials]];
    [request setEndpoint:[describeVolumeStatusRequest requestEndpoint]];
    [request setRequestTag:[describeVolumeStatusRequest requestTag]];


    if (describeVolumeStatusRequest != nil) {
        int volumeIdsListIndex = 1;
        for (NSString *volumeIdsListValue in describeVolumeStatusRequest.volumeIds) {
            if (volumeIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", volumeIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"VolumeId", volumeIdsListIndex]];
            }

            volumeIdsListIndex++;
        }
    }

    if (describeVolumeStatusRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeVolumeStatusRequest.filters) {
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
    if (describeVolumeStatusRequest != nil) {
        if (describeVolumeStatusRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeVolumeStatusRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeVolumeStatusRequest != nil) {
        if (describeVolumeStatusRequest.maxResults != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeVolumeStatusRequest.maxResults] forKey:[NSString stringWithFormat:@"%@", @"MaxResults"]];
        }
    }


    return [request autorelease];
}

@end

