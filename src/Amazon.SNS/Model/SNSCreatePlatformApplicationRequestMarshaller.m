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

#import "SNSCreatePlatformApplicationRequestMarshaller.h"

@implementation SNSCreatePlatformApplicationRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSCreatePlatformApplicationRequest *)createPlatformApplicationRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"CreatePlatformApplication"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[createPlatformApplicationRequest delegate]];
    [request setCredentials:[createPlatformApplicationRequest credentials]];
    [request setEndpoint:[createPlatformApplicationRequest requestEndpoint]];
    [request setRequestTag:[createPlatformApplicationRequest requestTag]];

    if (createPlatformApplicationRequest != nil) {
        if (createPlatformApplicationRequest.name != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createPlatformApplicationRequest.name] forKey:[NSString stringWithFormat:@"%@", @"Name"]];
        }
    }
    if (createPlatformApplicationRequest != nil) {
        if (createPlatformApplicationRequest.platform != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createPlatformApplicationRequest.platform] forKey:[NSString stringWithFormat:@"%@", @"Platform"]];
        }
    }
    if (createPlatformApplicationRequest != nil) {
        if (createPlatformApplicationRequest.attributes != nil) {
            int attributesListIndex = 1;
            for (NSString *attributesListKey in createPlatformApplicationRequest.attributes) {
                NSString *attributesListKeyValue = [createPlatformApplicationRequest.attributes valueForKey:attributesListKey];
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

