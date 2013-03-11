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

#import "EC2CopyImageRequestMarshaller.h"

@implementation EC2CopyImageRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CopyImageRequest *)copyImageRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CopyImage"           forKey:@"Action"];
    [request setParameterValue:@"2013-02-01"   forKey:@"Version"];

    [request setDelegate:[copyImageRequest delegate]];
    [request setCredentials:[copyImageRequest credentials]];
    [request setEndpoint:[copyImageRequest requestEndpoint]];
    [request setRequestTag:[copyImageRequest requestTag]];

    if (copyImageRequest != nil) {
        if (copyImageRequest.sourceRegion != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copyImageRequest.sourceRegion] forKey:[NSString stringWithFormat:@"%@", @"SourceRegion"]];
        }
    }
    if (copyImageRequest != nil) {
        if (copyImageRequest.sourceImageId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copyImageRequest.sourceImageId] forKey:[NSString stringWithFormat:@"%@", @"SourceImageId"]];
        }
    }
    if (copyImageRequest != nil) {
        if (copyImageRequest.name != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copyImageRequest.name] forKey:[NSString stringWithFormat:@"%@", @"Name"]];
        }
    }
    if (copyImageRequest != nil) {
        if (copyImageRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copyImageRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }
    if (copyImageRequest != nil) {
        if (copyImageRequest.clientToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copyImageRequest.clientToken] forKey:[NSString stringWithFormat:@"%@", @"ClientToken"]];
        }
    }


    return [request autorelease];
}

@end

