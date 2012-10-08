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

#import "EC2DescribePlacementGroupsRequestMarshaller.h"

@implementation EC2DescribePlacementGroupsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribePlacementGroupsRequest *)describePlacementGroupsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribePlacementGroups"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describePlacementGroupsRequest delegate]];
    [request setCredentials:[describePlacementGroupsRequest credentials]];
    [request setEndpoint:[describePlacementGroupsRequest requestEndpoint]];
    [request setRequestTag:[describePlacementGroupsRequest requestTag]];


    if (describePlacementGroupsRequest != nil) {
        int groupNamesListIndex = 1;
        for (NSString *groupNamesListValue in describePlacementGroupsRequest.groupNames) {
            if (groupNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", groupNamesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"GroupName", groupNamesListIndex]];
            }

            groupNamesListIndex++;
        }
    }

    if (describePlacementGroupsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describePlacementGroupsRequest.filters) {
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

