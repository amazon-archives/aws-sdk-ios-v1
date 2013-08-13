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

#import "SNSListEndpointsByPlatformApplicationRequestMarshaller.h"

@implementation SNSListEndpointsByPlatformApplicationRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSListEndpointsByPlatformApplicationRequest *)listEndpointsByPlatformApplicationRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"ListEndpointsByPlatformApplication"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[listEndpointsByPlatformApplicationRequest delegate]];
    [request setCredentials:[listEndpointsByPlatformApplicationRequest credentials]];
    [request setEndpoint:[listEndpointsByPlatformApplicationRequest requestEndpoint]];
    [request setRequestTag:[listEndpointsByPlatformApplicationRequest requestTag]];

    if (listEndpointsByPlatformApplicationRequest != nil) {
        if (listEndpointsByPlatformApplicationRequest.platformApplicationArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listEndpointsByPlatformApplicationRequest.platformApplicationArn] forKey:[NSString stringWithFormat:@"%@", @"PlatformApplicationArn"]];
        }
    }
    if (listEndpointsByPlatformApplicationRequest != nil) {
        if (listEndpointsByPlatformApplicationRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listEndpointsByPlatformApplicationRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

