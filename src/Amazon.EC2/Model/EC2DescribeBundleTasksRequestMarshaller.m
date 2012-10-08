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

#import "EC2DescribeBundleTasksRequestMarshaller.h"

@implementation EC2DescribeBundleTasksRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeBundleTasksRequest *)describeBundleTasksRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeBundleTasks"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeBundleTasksRequest delegate]];
    [request setCredentials:[describeBundleTasksRequest credentials]];
    [request setEndpoint:[describeBundleTasksRequest requestEndpoint]];
    [request setRequestTag:[describeBundleTasksRequest requestTag]];


    if (describeBundleTasksRequest != nil) {
        int bundleIdsListIndex = 1;
        for (NSString *bundleIdsListValue in describeBundleTasksRequest.bundleIds) {
            if (bundleIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", bundleIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"BundleId", bundleIdsListIndex]];
            }

            bundleIdsListIndex++;
        }
    }

    if (describeBundleTasksRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeBundleTasksRequest.filters) {
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

