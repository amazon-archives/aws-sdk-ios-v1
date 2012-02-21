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

#import "AutoScalingDescribeTagsRequestMarshaller.h"

@implementation AutoScalingDescribeTagsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeTagsRequest *)describeTagsRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeTags"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeTagsRequest delegate]];
    [request setCredentials:[describeTagsRequest credentials]];
    [request setEndpoint:[describeTagsRequest requestEndpoint]];
    [request setRequestTag:[describeTagsRequest requestTag]];


    if (describeTagsRequest != nil) {
        int filtersListIndex = 1;
        for (AutoScalingFilter *filtersListValue in describeTagsRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Filters", filtersListIndex, @"Name"]];
                }
            }

            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.member.%d", @"Filters", filtersListIndex, @"Values", valuesListIndex]];
                    }

                    valuesListIndex++;
                }
            }

            filtersListIndex++;
        }
    }
    if (describeTagsRequest != nil) {
        if (describeTagsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeTagsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeTagsRequest != nil) {
        if (describeTagsRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeTagsRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }


    return [request autorelease];
}

@end

