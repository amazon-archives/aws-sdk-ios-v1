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

#import "EC2CancelSpotInstanceRequestsRequestMarshaller.h"

@implementation EC2CancelSpotInstanceRequestsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CancelSpotInstanceRequestsRequest *)cancelSpotInstanceRequestsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CancelSpotInstanceRequests"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[cancelSpotInstanceRequestsRequest delegate]];
    [request setCredentials:[cancelSpotInstanceRequestsRequest credentials]];
    [request setEndpoint:[cancelSpotInstanceRequestsRequest requestEndpoint]];
    [request setRequestTag:[cancelSpotInstanceRequestsRequest requestTag]];


    if (cancelSpotInstanceRequestsRequest != nil) {
        int spotInstanceRequestIdsListIndex = 1;
        for (NSString *spotInstanceRequestIdsListValue in cancelSpotInstanceRequestsRequest.spotInstanceRequestIds) {
            if (spotInstanceRequestIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", spotInstanceRequestIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"SpotInstanceRequestId", spotInstanceRequestIdsListIndex]];
            }

            spotInstanceRequestIdsListIndex++;
        }
    }


    return [request autorelease];
}

@end

