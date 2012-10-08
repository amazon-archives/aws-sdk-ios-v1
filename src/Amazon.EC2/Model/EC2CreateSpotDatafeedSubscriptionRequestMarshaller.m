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

#import "EC2CreateSpotDatafeedSubscriptionRequestMarshaller.h"

@implementation EC2CreateSpotDatafeedSubscriptionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CreateSpotDatafeedSubscriptionRequest *)createSpotDatafeedSubscriptionRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CreateSpotDatafeedSubscription"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[createSpotDatafeedSubscriptionRequest delegate]];
    [request setCredentials:[createSpotDatafeedSubscriptionRequest credentials]];
    [request setEndpoint:[createSpotDatafeedSubscriptionRequest requestEndpoint]];
    [request setRequestTag:[createSpotDatafeedSubscriptionRequest requestTag]];

    if (createSpotDatafeedSubscriptionRequest != nil) {
        if (createSpotDatafeedSubscriptionRequest.bucket != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSpotDatafeedSubscriptionRequest.bucket] forKey:[NSString stringWithFormat:@"%@", @"Bucket"]];
        }
    }
    if (createSpotDatafeedSubscriptionRequest != nil) {
        if (createSpotDatafeedSubscriptionRequest.prefix != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSpotDatafeedSubscriptionRequest.prefix] forKey:[NSString stringWithFormat:@"%@", @"Prefix"]];
        }
    }


    return [request autorelease];
}

@end

