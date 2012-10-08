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

#import "EC2ResetInstanceAttributeRequestMarshaller.h"

@implementation EC2ResetInstanceAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ResetInstanceAttributeRequest *)resetInstanceAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ResetInstanceAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[resetInstanceAttributeRequest delegate]];
    [request setCredentials:[resetInstanceAttributeRequest credentials]];
    [request setEndpoint:[resetInstanceAttributeRequest requestEndpoint]];
    [request setRequestTag:[resetInstanceAttributeRequest requestTag]];

    if (resetInstanceAttributeRequest != nil) {
        if (resetInstanceAttributeRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", resetInstanceAttributeRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (resetInstanceAttributeRequest != nil) {
        if (resetInstanceAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", resetInstanceAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }


    return [request autorelease];
}

@end

