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

#import "EC2DescribeSpotDatafeedSubscriptionRequestMarshaller.h"

@implementation EC2DescribeSpotDatafeedSubscriptionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeSpotDatafeedSubscriptionRequest *)describeSpotDatafeedSubscriptionRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeSpotDatafeedSubscription"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeSpotDatafeedSubscriptionRequest delegate]];
    [request setCredentials:[describeSpotDatafeedSubscriptionRequest credentials]];
    [request setEndpoint:[describeSpotDatafeedSubscriptionRequest requestEndpoint]];
    [request setRequestTag:[describeSpotDatafeedSubscriptionRequest requestTag]];



    return [request autorelease];
}

@end

