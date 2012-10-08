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

#import "EC2ImportVolumeRequestMarshaller.h"

@implementation EC2ImportVolumeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ImportVolumeRequest *)importVolumeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ImportVolume"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[importVolumeRequest delegate]];
    [request setCredentials:[importVolumeRequest credentials]];
    [request setEndpoint:[importVolumeRequest requestEndpoint]];
    [request setRequestTag:[importVolumeRequest requestTag]];

    if (importVolumeRequest != nil) {
        if (importVolumeRequest.availabilityZone != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", importVolumeRequest.availabilityZone] forKey:[NSString stringWithFormat:@"%@", @"AvailabilityZone"]];
        }
    }
    if (importVolumeRequest != nil) {
        EC2DiskImageDetail *image = importVolumeRequest.image;
        if (image != nil) {
            if (image.format != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", image.format] forKey:[NSString stringWithFormat:@"%@.%@", @"Image", @"Format"]];
            }
        }
        if (image != nil) {
            if (image.bytes != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", image.bytes] forKey:[NSString stringWithFormat:@"%@.%@", @"Image", @"Bytes"]];
            }
        }
        if (image != nil) {
            if (image.importManifestUrl != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", image.importManifestUrl] forKey:[NSString stringWithFormat:@"%@.%@", @"Image", @"ImportManifestUrl"]];
            }
        }
    }
    if (importVolumeRequest != nil) {
        if (importVolumeRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", importVolumeRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }
    if (importVolumeRequest != nil) {
        EC2VolumeDetail *volume = importVolumeRequest.volume;
        if (volume != nil) {
            if (volume.size != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", volume.size] forKey:[NSString stringWithFormat:@"%@.%@", @"Volume", @"Size"]];
            }
        }
    }


    return [request autorelease];
}

@end

