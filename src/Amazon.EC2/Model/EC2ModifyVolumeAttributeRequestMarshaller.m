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

#import "EC2ModifyVolumeAttributeRequestMarshaller.h"

@implementation EC2ModifyVolumeAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ModifyVolumeAttributeRequest *)modifyVolumeAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ModifyVolumeAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[modifyVolumeAttributeRequest delegate]];
    [request setCredentials:[modifyVolumeAttributeRequest credentials]];
    [request setEndpoint:[modifyVolumeAttributeRequest requestEndpoint]];
    [request setRequestTag:[modifyVolumeAttributeRequest requestTag]];

    if (modifyVolumeAttributeRequest != nil) {
        if (modifyVolumeAttributeRequest.volumeId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyVolumeAttributeRequest.volumeId] forKey:[NSString stringWithFormat:@"%@", @"VolumeId"]];
        }
    }
    if (modifyVolumeAttributeRequest != nil) {
        if (modifyVolumeAttributeRequest.autoEnableIOIsSet) {
            [request setParameterValue:(modifyVolumeAttributeRequest.autoEnableIO ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"AutoEnableIO.Value"]];
        }
    }


    return [request autorelease];
}

@end

