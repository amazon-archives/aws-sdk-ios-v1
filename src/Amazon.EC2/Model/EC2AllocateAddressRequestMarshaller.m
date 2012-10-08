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

#import "EC2AllocateAddressRequestMarshaller.h"

@implementation EC2AllocateAddressRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2AllocateAddressRequest *)allocateAddressRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"AllocateAddress"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[allocateAddressRequest delegate]];
    [request setCredentials:[allocateAddressRequest credentials]];
    [request setEndpoint:[allocateAddressRequest requestEndpoint]];
    [request setRequestTag:[allocateAddressRequest requestTag]];

    if (allocateAddressRequest != nil) {
        if (allocateAddressRequest.domain != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", allocateAddressRequest.domain] forKey:[NSString stringWithFormat:@"%@", @"Domain"]];
        }
    }


    return [request autorelease];
}

@end

