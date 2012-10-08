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

#import "EC2ResetImageAttributeRequestMarshaller.h"

@implementation EC2ResetImageAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ResetImageAttributeRequest *)resetImageAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ResetImageAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[resetImageAttributeRequest delegate]];
    [request setCredentials:[resetImageAttributeRequest credentials]];
    [request setEndpoint:[resetImageAttributeRequest requestEndpoint]];
    [request setRequestTag:[resetImageAttributeRequest requestTag]];

    if (resetImageAttributeRequest != nil) {
        if (resetImageAttributeRequest.imageId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", resetImageAttributeRequest.imageId] forKey:[NSString stringWithFormat:@"%@", @"ImageId"]];
        }
    }
    if (resetImageAttributeRequest != nil) {
        if (resetImageAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", resetImageAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }


    return [request autorelease];
}

@end

