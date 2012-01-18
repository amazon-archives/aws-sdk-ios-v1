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

#import "AutoScalingDescribePoliciesRequestMarshaller.h"

@implementation AutoScalingDescribePoliciesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribePoliciesRequest *)describePoliciesRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribePolicies"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describePoliciesRequest delegate]];
    [request setCredentials:[describePoliciesRequest credentials]];
    [request setEndpoint:[describePoliciesRequest requestEndpoint]];
    [request setRequestTag:[describePoliciesRequest requestTag]];

    if (describePoliciesRequest != nil) {
        if (describePoliciesRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describePoliciesRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }

    if (describePoliciesRequest != nil) {
        int policyNamesListIndex = 1;
        for (NSString *policyNamesListValue in describePoliciesRequest.policyNames) {
            if (policyNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", policyNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"PolicyNames", policyNamesListIndex]];
            }

            policyNamesListIndex++;
        }
    }
    if (describePoliciesRequest != nil) {
        if (describePoliciesRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describePoliciesRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describePoliciesRequest != nil) {
        if (describePoliciesRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describePoliciesRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }


    return [request autorelease];
}

@end

