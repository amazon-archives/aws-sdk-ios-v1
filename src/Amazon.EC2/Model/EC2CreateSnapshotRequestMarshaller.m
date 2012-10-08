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

#import "EC2CreateSnapshotRequestMarshaller.h"

@implementation EC2CreateSnapshotRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CreateSnapshotRequest *)createSnapshotRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CreateSnapshot"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[createSnapshotRequest delegate]];
    [request setCredentials:[createSnapshotRequest credentials]];
    [request setEndpoint:[createSnapshotRequest requestEndpoint]];
    [request setRequestTag:[createSnapshotRequest requestTag]];

    if (createSnapshotRequest != nil) {
        if (createSnapshotRequest.volumeId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSnapshotRequest.volumeId] forKey:[NSString stringWithFormat:@"%@", @"VolumeId"]];
        }
    }
    if (createSnapshotRequest != nil) {
        if (createSnapshotRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createSnapshotRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }


    return [request autorelease];
}

@end

