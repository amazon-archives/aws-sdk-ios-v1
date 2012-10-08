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

#import "EC2DescribeRegionsRequestMarshaller.h"

@implementation EC2DescribeRegionsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeRegionsRequest *)describeRegionsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeRegions"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeRegionsRequest delegate]];
    [request setCredentials:[describeRegionsRequest credentials]];
    [request setEndpoint:[describeRegionsRequest requestEndpoint]];
    [request setRequestTag:[describeRegionsRequest requestTag]];


    if (describeRegionsRequest != nil) {
        int regionNamesListIndex = 1;
        for (NSString *regionNamesListValue in describeRegionsRequest.regionNames) {
            if (regionNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", regionNamesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"RegionName", regionNamesListIndex]];
            }

            regionNamesListIndex++;
        }
    }

    if (describeRegionsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeRegionsRequest.filters) {
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

