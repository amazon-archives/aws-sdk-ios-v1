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

#import "EC2DescribeSnapshotsRequestMarshaller.h"

@implementation EC2DescribeSnapshotsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeSnapshotsRequest *)describeSnapshotsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeSnapshots"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeSnapshotsRequest delegate]];
    [request setCredentials:[describeSnapshotsRequest credentials]];
    [request setEndpoint:[describeSnapshotsRequest requestEndpoint]];
    [request setRequestTag:[describeSnapshotsRequest requestTag]];


    if (describeSnapshotsRequest != nil) {
        int snapshotIdsListIndex = 1;
        for (NSString *snapshotIdsListValue in describeSnapshotsRequest.snapshotIds) {
            if (snapshotIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", snapshotIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"SnapshotId", snapshotIdsListIndex]];
            }

            snapshotIdsListIndex++;
        }
    }

    if (describeSnapshotsRequest != nil) {
        int ownerIdsListIndex = 1;
        for (NSString *ownerIdsListValue in describeSnapshotsRequest.ownerIds) {
            if (ownerIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", ownerIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"Owner", ownerIdsListIndex]];
            }

            ownerIdsListIndex++;
        }
    }

    if (describeSnapshotsRequest != nil) {
        int restorableByUserIdsListIndex = 1;
        for (NSString *restorableByUserIdsListValue in describeSnapshotsRequest.restorableByUserIds) {
            if (restorableByUserIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", restorableByUserIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"RestorableBy", restorableByUserIdsListIndex]];
            }

            restorableByUserIdsListIndex++;
        }
    }

    if (describeSnapshotsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeSnapshotsRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Filter", filtersListIndex, @"Name"]];
                }
            }

            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"Filter", filtersListIndex, @"Value", valuesListIndex]];
                    }

                    valuesListIndex++;
                }
            }

            filtersListIndex++;
        }
    }


    return [request autorelease];
}

@end

