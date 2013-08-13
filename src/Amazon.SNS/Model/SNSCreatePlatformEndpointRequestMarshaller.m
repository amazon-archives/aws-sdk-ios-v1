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

#import "SNSCreatePlatformEndpointRequestMarshaller.h"

@implementation SNSCreatePlatformEndpointRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSCreatePlatformEndpointRequest *)createPlatformEndpointRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"CreatePlatformEndpoint"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[createPlatformEndpointRequest delegate]];
    [request setCredentials:[createPlatformEndpointRequest credentials]];
    [request setEndpoint:[createPlatformEndpointRequest requestEndpoint]];
    [request setRequestTag:[createPlatformEndpointRequest requestTag]];

    if (createPlatformEndpointRequest != nil) {
        if (createPlatformEndpointRequest.platformApplicationArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createPlatformEndpointRequest.platformApplicationArn] forKey:[NSString stringWithFormat:@"%@", @"PlatformApplicationArn"]];
        }
    }
    if (createPlatformEndpointRequest != nil) {
        if (createPlatformEndpointRequest.token != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createPlatformEndpointRequest.token] forKey:[NSString stringWithFormat:@"%@", @"Token"]];
        }
    }
    if (createPlatformEndpointRequest != nil) {
        if (createPlatformEndpointRequest.customUserData != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createPlatformEndpointRequest.customUserData] forKey:[NSString stringWithFormat:@"%@", @"CustomUserData"]];
        }
    }
    if (createPlatformEndpointRequest != nil) {
        if (createPlatformEndpointRequest.attributes != nil) {
            int attributesListIndex = 1;
            for (NSString *attributesListKey in createPlatformEndpointRequest.attributes) {
                NSString *attributesListKeyValue = [createPlatformEndpointRequest.attributes valueForKey:attributesListKey];
                if (attributesListKey != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", attributesListKey] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Attribute", attributesListIndex, @"Name"]];
                }

                if (attributesListKeyValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", attributesListKeyValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Attribute", attributesListIndex, @"Value"]];
                }




                ++attributesListIndex;
            }
        }
    }


    return [request autorelease];
}

@end

