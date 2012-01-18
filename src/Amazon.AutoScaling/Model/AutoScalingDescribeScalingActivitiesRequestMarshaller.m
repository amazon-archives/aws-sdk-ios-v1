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

#import "AutoScalingDescribeScalingActivitiesRequestMarshaller.h"

@implementation AutoScalingDescribeScalingActivitiesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeScalingActivitiesRequest *)describeScalingActivitiesRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeScalingActivities"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeScalingActivitiesRequest delegate]];
    [request setCredentials:[describeScalingActivitiesRequest credentials]];
    [request setEndpoint:[describeScalingActivitiesRequest requestEndpoint]];
    [request setRequestTag:[describeScalingActivitiesRequest requestTag]];


    if (describeScalingActivitiesRequest != nil) {
        int activityIdsListIndex = 1;
        for (NSString *activityIdsListValue in describeScalingActivitiesRequest.activityIds) {
            if (activityIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", activityIdsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"ActivityIds", activityIdsListIndex]];
            }

            activityIdsListIndex++;
        }
    }
    if (describeScalingActivitiesRequest != nil) {
        if (describeScalingActivitiesRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeScalingActivitiesRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (describeScalingActivitiesRequest != nil) {
        if (describeScalingActivitiesRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeScalingActivitiesRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }
    if (describeScalingActivitiesRequest != nil) {
        if (describeScalingActivitiesRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeScalingActivitiesRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

