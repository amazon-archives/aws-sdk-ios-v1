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

#import "SNSListSubscriptionsRequestMarshaller.h"

@implementation SNSListSubscriptionsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSListSubscriptionsRequest *)listSubscriptionsRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"ListSubscriptions"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[listSubscriptionsRequest delegate]];
    [request setCredentials:[listSubscriptionsRequest credentials]];
    [request setEndpoint:[listSubscriptionsRequest requestEndpoint]];
    [request setRequestTag:[listSubscriptionsRequest requestTag]];

    if (listSubscriptionsRequest != nil) {
        if (listSubscriptionsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listSubscriptionsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

