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

#import "EC2DescribeVolumeAttributeRequestMarshaller.h"

@implementation EC2DescribeVolumeAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeVolumeAttributeRequest *)describeVolumeAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeVolumeAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeVolumeAttributeRequest delegate]];
    [request setCredentials:[describeVolumeAttributeRequest credentials]];
    [request setEndpoint:[describeVolumeAttributeRequest requestEndpoint]];
    [request setRequestTag:[describeVolumeAttributeRequest requestTag]];

    if (describeVolumeAttributeRequest != nil) {
        if (describeVolumeAttributeRequest.volumeId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeVolumeAttributeRequest.volumeId] forKey:[NSString stringWithFormat:@"%@", @"VolumeId"]];
        }
    }
    if (describeVolumeAttributeRequest != nil) {
        if (describeVolumeAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeVolumeAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }


    return [request autorelease];
}

@end

