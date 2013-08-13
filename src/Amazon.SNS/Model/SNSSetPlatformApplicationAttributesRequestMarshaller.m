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

#import "SNSSetPlatformApplicationAttributesRequestMarshaller.h"

@implementation SNSSetPlatformApplicationAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSSetPlatformApplicationAttributesRequest *)setPlatformApplicationAttributesRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"SetPlatformApplicationAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[setPlatformApplicationAttributesRequest delegate]];
    [request setCredentials:[setPlatformApplicationAttributesRequest credentials]];
    [request setEndpoint:[setPlatformApplicationAttributesRequest requestEndpoint]];
    [request setRequestTag:[setPlatformApplicationAttributesRequest requestTag]];

    if (setPlatformApplicationAttributesRequest != nil) {
        if (setPlatformApplicationAttributesRequest.platformApplicationArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setPlatformApplicationAttributesRequest.platformApplicationArn] forKey:[NSString stringWithFormat:@"%@", @"PlatformApplicationArn"]];
        }
    }
    if (setPlatformApplicationAttributesRequest != nil) {
        if (setPlatformApplicationAttributesRequest.attributes != nil) {
            int attributesListIndex = 1;
            for (NSString *attributesListKey in setPlatformApplicationAttributesRequest.attributes) {
                NSString *attributesListKeyValue = [setPlatformApplicationAttributesRequest.attributes valueForKey:attributesListKey];
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

