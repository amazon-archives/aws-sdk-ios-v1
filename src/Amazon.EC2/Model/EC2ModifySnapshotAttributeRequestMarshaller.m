/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "EC2ModifySnapshotAttributeRequestMarshaller.h"

@implementation EC2ModifySnapshotAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ModifySnapshotAttributeRequest *)modifySnapshotAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ModifySnapshotAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[modifySnapshotAttributeRequest delegate]];
    [request setCredentials:[modifySnapshotAttributeRequest credentials]];
    [request setEndpoint:[modifySnapshotAttributeRequest requestEndpoint]];

    if (modifySnapshotAttributeRequest != nil) {
        if (modifySnapshotAttributeRequest.snapshotId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifySnapshotAttributeRequest.snapshotId] forKey:[NSString stringWithFormat:@"%@", @"SnapshotId"]];
        }
    }
    if (modifySnapshotAttributeRequest != nil) {
        if (modifySnapshotAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifySnapshotAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }
    if (modifySnapshotAttributeRequest != nil) {
        if (modifySnapshotAttributeRequest.operationType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifySnapshotAttributeRequest.operationType] forKey:[NSString stringWithFormat:@"%@", @"OperationType"]];
        }
    }
    if (modifySnapshotAttributeRequest != nil) {
        int userIdsListIndex = 1;
        for (NSString *userIdsListValue in modifySnapshotAttributeRequest.userIds) {
            if (userIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", userIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"UserId", userIdsListIndex]];
            }
            userIdsListIndex++;
        }
    }
    if (modifySnapshotAttributeRequest != nil) {
        int groupNamesListIndex = 1;
        for (NSString *groupNamesListValue in modifySnapshotAttributeRequest.groupNames) {
            if (groupNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", groupNamesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"UserGroup", groupNamesListIndex]];
            }
            groupNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

