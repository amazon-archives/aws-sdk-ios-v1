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

#import "EC2DescribeSpotPriceHistoryRequestMarshaller.h"

@implementation EC2DescribeSpotPriceHistoryRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeSpotPriceHistoryRequest *)describeSpotPriceHistoryRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeSpotPriceHistory"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeSpotPriceHistoryRequest delegate]];
    [request setCredentials:[describeSpotPriceHistoryRequest credentials]];
    [request setEndpoint:[describeSpotPriceHistoryRequest requestEndpoint]];
    [request setRequestTag:[describeSpotPriceHistoryRequest requestTag]];

    if (describeSpotPriceHistoryRequest != nil) {
        if (describeSpotPriceHistoryRequest.startTime != nil) {
            [request setParameterValue:[describeSpotPriceHistoryRequest.startTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"StartTime"]];
        }
    }
    if (describeSpotPriceHistoryRequest != nil) {
        if (describeSpotPriceHistoryRequest.endTime != nil) {
            [request setParameterValue:[describeSpotPriceHistoryRequest.endTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"EndTime"]];
        }
    }

    if (describeSpotPriceHistoryRequest != nil) {
        int instanceTypesListIndex = 1;
        for (NSString *instanceTypesListValue in describeSpotPriceHistoryRequest.instanceTypes) {
            if (instanceTypesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", instanceTypesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"InstanceType", instanceTypesListIndex]];
            }

            instanceTypesListIndex++;
        }
    }

    if (describeSpotPriceHistoryRequest != nil) {
        int productDescriptionsListIndex = 1;
        for (NSString *productDescriptionsListValue in describeSpotPriceHistoryRequest.productDescriptions) {
            if (productDescriptionsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", productDescriptionsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ProductDescription", productDescriptionsListIndex]];
            }

            productDescriptionsListIndex++;
        }
    }

    if (describeSpotPriceHistoryRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeSpotPriceHistoryRequest.filters) {
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
    if (describeSpotPriceHistoryRequest != nil) {
        if (describeSpotPriceHistoryRequest.availabilityZone != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeSpotPriceHistoryRequest.availabilityZone] forKey:[NSString stringWithFormat:@"%@", @"AvailabilityZone"]];
        }
    }
    if (describeSpotPriceHistoryRequest != nil) {
        if (describeSpotPriceHistoryRequest.maxResults != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeSpotPriceHistoryRequest.maxResults] forKey:[NSString stringWithFormat:@"%@", @"MaxResults"]];
        }
    }
    if (describeSpotPriceHistoryRequest != nil) {
        if (describeSpotPriceHistoryRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeSpotPriceHistoryRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

