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

#import "SNSSetEndpointAttributesRequestMarshaller.h"

@implementation SNSSetEndpointAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSSetEndpointAttributesRequest *)setEndpointAttributesRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"SetEndpointAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[setEndpointAttributesRequest delegate]];
    [request setCredentials:[setEndpointAttributesRequest credentials]];
    [request setEndpoint:[setEndpointAttributesRequest requestEndpoint]];
    [request setRequestTag:[setEndpointAttributesRequest requestTag]];

    if (setEndpointAttributesRequest != nil) {
        if (setEndpointAttributesRequest.endpointArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setEndpointAttributesRequest.endpointArn] forKey:[NSString stringWithFormat:@"%@", @"EndpointArn"]];
        }
    }
    if (setEndpointAttributesRequest != nil) {
        if (setEndpointAttributesRequest.attributes != nil) {
            int attributesListIndex = 1;
            for (NSString *attributesListKey in setEndpointAttributesRequest.attributes) {
                NSString *attributesListKeyValue = [setEndpointAttributesRequest.attributes valueForKey:attributesListKey];
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

