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

#import "EC2StartInstancesRequestMarshaller.h"

@implementation EC2StartInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2StartInstancesRequest *)startInstancesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"StartInstances"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[startInstancesRequest delegate]];
    [request setCredentials:[startInstancesRequest credentials]];
    [request setEndpoint:[startInstancesRequest requestEndpoint]];
    [request setRequestTag:[startInstancesRequest requestTag]];


    if (startInstancesRequest != nil) {
        int instanceIdsListIndex = 1;
        for (NSString *instanceIdsListValue in startInstancesRequest.instanceIds) {
            if (instanceIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", instanceIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"InstanceId", instanceIdsListIndex]];
            }

            instanceIdsListIndex++;
        }
    }
    if (startInstancesRequest != nil) {
        if (startInstancesRequest.additionalInfo != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", startInstancesRequest.additionalInfo] forKey:[NSString stringWithFormat:@"%@", @"AdditionalInfo"]];
        }
    }


    return [request autorelease];
}

@end

