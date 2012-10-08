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

#import "EC2AttachVolumeRequestMarshaller.h"

@implementation EC2AttachVolumeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2AttachVolumeRequest *)attachVolumeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"AttachVolume"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[attachVolumeRequest delegate]];
    [request setCredentials:[attachVolumeRequest credentials]];
    [request setEndpoint:[attachVolumeRequest requestEndpoint]];
    [request setRequestTag:[attachVolumeRequest requestTag]];

    if (attachVolumeRequest != nil) {
        if (attachVolumeRequest.volumeId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", attachVolumeRequest.volumeId] forKey:[NSString stringWithFormat:@"%@", @"VolumeId"]];
        }
    }
    if (attachVolumeRequest != nil) {
        if (attachVolumeRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", attachVolumeRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (attachVolumeRequest != nil) {
        if (attachVolumeRequest.device != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", attachVolumeRequest.device] forKey:[NSString stringWithFormat:@"%@", @"Device"]];
        }
    }


    return [request autorelease];
}

@end

