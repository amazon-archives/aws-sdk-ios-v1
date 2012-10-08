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

#import "EC2ReleaseAddressRequestMarshaller.h"

@implementation EC2ReleaseAddressRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ReleaseAddressRequest *)releaseAddressRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ReleaseAddress"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[releaseAddressRequest delegate]];
    [request setCredentials:[releaseAddressRequest credentials]];
    [request setEndpoint:[releaseAddressRequest requestEndpoint]];
    [request setRequestTag:[releaseAddressRequest requestTag]];

    if (releaseAddressRequest != nil) {
        if (releaseAddressRequest.publicIp != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", releaseAddressRequest.publicIp] forKey:[NSString stringWithFormat:@"%@", @"PublicIp"]];
        }
    }
    if (releaseAddressRequest != nil) {
        if (releaseAddressRequest.allocationId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", releaseAddressRequest.allocationId] forKey:[NSString stringWithFormat:@"%@", @"AllocationId"]];
        }
    }


    return [request autorelease];
}

@end

