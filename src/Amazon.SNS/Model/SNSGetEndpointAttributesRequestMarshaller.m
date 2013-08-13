/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "SNSGetEndpointAttributesRequestMarshaller.h"

@implementation SNSGetEndpointAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSGetEndpointAttributesRequest *)getEndpointAttributesRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"GetEndpointAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[getEndpointAttributesRequest delegate]];
    [request setCredentials:[getEndpointAttributesRequest credentials]];
    [request setEndpoint:[getEndpointAttributesRequest requestEndpoint]];
    [request setRequestTag:[getEndpointAttributesRequest requestTag]];

    if (getEndpointAttributesRequest != nil) {
        if (getEndpointAttributesRequest.endpointArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getEndpointAttributesRequest.endpointArn] forKey:[NSString stringWithFormat:@"%@", @"EndpointArn"]];
        }
    }


    return [request autorelease];
}

@end

