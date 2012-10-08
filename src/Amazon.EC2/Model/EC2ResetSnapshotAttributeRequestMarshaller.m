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

#import "EC2ResetSnapshotAttributeRequestMarshaller.h"

@implementation EC2ResetSnapshotAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ResetSnapshotAttributeRequest *)resetSnapshotAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ResetSnapshotAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[resetSnapshotAttributeRequest delegate]];
    [request setCredentials:[resetSnapshotAttributeRequest credentials]];
    [request setEndpoint:[resetSnapshotAttributeRequest requestEndpoint]];
    [request setRequestTag:[resetSnapshotAttributeRequest requestTag]];

    if (resetSnapshotAttributeRequest != nil) {
        if (resetSnapshotAttributeRequest.snapshotId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", resetSnapshotAttributeRequest.snapshotId] forKey:[NSString stringWithFormat:@"%@", @"SnapshotId"]];
        }
    }
    if (resetSnapshotAttributeRequest != nil) {
        if (resetSnapshotAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", resetSnapshotAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }


    return [request autorelease];
}

@end

