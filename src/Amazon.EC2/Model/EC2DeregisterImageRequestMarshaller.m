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

#import "EC2DeregisterImageRequestMarshaller.h"

@implementation EC2DeregisterImageRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeregisterImageRequest *)deregisterImageRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeregisterImage"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deregisterImageRequest delegate]];
    [request setCredentials:[deregisterImageRequest credentials]];
    [request setEndpoint:[deregisterImageRequest requestEndpoint]];
    [request setRequestTag:[deregisterImageRequest requestTag]];

    if (deregisterImageRequest != nil) {
        if (deregisterImageRequest.imageId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deregisterImageRequest.imageId] forKey:[NSString stringWithFormat:@"%@", @"ImageId"]];
        }
    }


    return [request autorelease];
}

@end

