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

#import "EC2DescribeSnapshotAttributeRequestMarshaller.h"

@implementation EC2DescribeSnapshotAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeSnapshotAttributeRequest *)describeSnapshotAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeSnapshotAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeSnapshotAttributeRequest delegate]];
    [request setCredentials:[describeSnapshotAttributeRequest credentials]];
    [request setEndpoint:[describeSnapshotAttributeRequest requestEndpoint]];
    [request setRequestTag:[describeSnapshotAttributeRequest requestTag]];

    if (describeSnapshotAttributeRequest != nil) {
        if (describeSnapshotAttributeRequest.snapshotId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeSnapshotAttributeRequest.snapshotId] forKey:[NSString stringWithFormat:@"%@", @"SnapshotId"]];
        }
    }
    if (describeSnapshotAttributeRequest != nil) {
        if (describeSnapshotAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeSnapshotAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }


    return [request autorelease];
}

@end

