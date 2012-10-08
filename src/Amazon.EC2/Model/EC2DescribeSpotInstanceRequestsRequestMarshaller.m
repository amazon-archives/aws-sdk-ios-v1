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

#import "EC2DescribeSpotInstanceRequestsRequestMarshaller.h"

@implementation EC2DescribeSpotInstanceRequestsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeSpotInstanceRequestsRequest *)describeSpotInstanceRequestsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeSpotInstanceRequests"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeSpotInstanceRequestsRequest delegate]];
    [request setCredentials:[describeSpotInstanceRequestsRequest credentials]];
    [request setEndpoint:[describeSpotInstanceRequestsRequest requestEndpoint]];
    [request setRequestTag:[describeSpotInstanceRequestsRequest requestTag]];


    if (describeSpotInstanceRequestsRequest != nil) {
        int spotInstanceRequestIdsListIndex = 1;
        for (NSString *spotInstanceRequestIdsListValue in describeSpotInstanceRequestsRequest.spotInstanceRequestIds) {
            if (spotInstanceRequestIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", spotInstanceRequestIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"SpotInstanceRequestId", spotInstanceRequestIdsListIndex]];
            }

            spotInstanceRequestIdsListIndex++;
        }
    }

    if (describeSpotInstanceRequestsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeSpotInstanceRequestsRequest.filters) {
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


    return [request autorelease];
}

@end

