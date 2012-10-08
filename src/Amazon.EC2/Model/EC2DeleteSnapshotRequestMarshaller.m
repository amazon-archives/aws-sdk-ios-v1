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

#import "EC2DeleteSnapshotRequestMarshaller.h"

@implementation EC2DeleteSnapshotRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeleteSnapshotRequest *)deleteSnapshotRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeleteSnapshot"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deleteSnapshotRequest delegate]];
    [request setCredentials:[deleteSnapshotRequest credentials]];
    [request setEndpoint:[deleteSnapshotRequest requestEndpoint]];
    [request setRequestTag:[deleteSnapshotRequest requestTag]];

    if (deleteSnapshotRequest != nil) {
        if (deleteSnapshotRequest.snapshotId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteSnapshotRequest.snapshotId] forKey:[NSString stringWithFormat:@"%@", @"SnapshotId"]];
        }
    }


    return [request autorelease];
}

@end

