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

#import "EC2CopySnapshotRequestMarshaller.h"

@implementation EC2CopySnapshotRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CopySnapshotRequest *)copySnapshotRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CopySnapshot"           forKey:@"Action"];
    [request setParameterValue:@"2013-02-01"   forKey:@"Version"];

    [request setDelegate:[copySnapshotRequest delegate]];
    [request setCredentials:[copySnapshotRequest credentials]];
    [request setEndpoint:[copySnapshotRequest requestEndpoint]];
    [request setRequestTag:[copySnapshotRequest requestTag]];

    if (copySnapshotRequest != nil) {
        if (copySnapshotRequest.sourceRegion != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copySnapshotRequest.sourceRegion] forKey:[NSString stringWithFormat:@"%@", @"SourceRegion"]];
        }
    }
    if (copySnapshotRequest != nil) {
        if (copySnapshotRequest.sourceSnapshotId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copySnapshotRequest.sourceSnapshotId] forKey:[NSString stringWithFormat:@"%@", @"SourceSnapshotId"]];
        }
    }
    if (copySnapshotRequest != nil) {
        if (copySnapshotRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", copySnapshotRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }


    return [request autorelease];
}

@end

