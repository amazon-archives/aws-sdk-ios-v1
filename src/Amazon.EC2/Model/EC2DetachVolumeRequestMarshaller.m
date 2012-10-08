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

#import "EC2DetachVolumeRequestMarshaller.h"

@implementation EC2DetachVolumeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DetachVolumeRequest *)detachVolumeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DetachVolume"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[detachVolumeRequest delegate]];
    [request setCredentials:[detachVolumeRequest credentials]];
    [request setEndpoint:[detachVolumeRequest requestEndpoint]];
    [request setRequestTag:[detachVolumeRequest requestTag]];

    if (detachVolumeRequest != nil) {
        if (detachVolumeRequest.volumeId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", detachVolumeRequest.volumeId] forKey:[NSString stringWithFormat:@"%@", @"VolumeId"]];
        }
    }
    if (detachVolumeRequest != nil) {
        if (detachVolumeRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", detachVolumeRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (detachVolumeRequest != nil) {
        if (detachVolumeRequest.device != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", detachVolumeRequest.device] forKey:[NSString stringWithFormat:@"%@", @"Device"]];
        }
    }
    if (detachVolumeRequest != nil) {
        if (detachVolumeRequest.forceIsSet) {
            [request setParameterValue:(detachVolumeRequest.force ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"Force"]];
        }
    }


    return [request autorelease];
}

@end

