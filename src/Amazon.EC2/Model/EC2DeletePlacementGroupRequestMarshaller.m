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

#import "EC2DeletePlacementGroupRequestMarshaller.h"

@implementation EC2DeletePlacementGroupRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeletePlacementGroupRequest *)deletePlacementGroupRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeletePlacementGroup"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deletePlacementGroupRequest delegate]];
    [request setCredentials:[deletePlacementGroupRequest credentials]];
    [request setEndpoint:[deletePlacementGroupRequest requestEndpoint]];
    [request setRequestTag:[deletePlacementGroupRequest requestTag]];

    if (deletePlacementGroupRequest != nil) {
        if (deletePlacementGroupRequest.groupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deletePlacementGroupRequest.groupName] forKey:[NSString stringWithFormat:@"%@", @"GroupName"]];
        }
    }


    return [request autorelease];
}

@end

