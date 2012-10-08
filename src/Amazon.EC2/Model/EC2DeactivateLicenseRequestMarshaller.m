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

#import "EC2DeactivateLicenseRequestMarshaller.h"

@implementation EC2DeactivateLicenseRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeactivateLicenseRequest *)deactivateLicenseRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeactivateLicense"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deactivateLicenseRequest delegate]];
    [request setCredentials:[deactivateLicenseRequest credentials]];
    [request setEndpoint:[deactivateLicenseRequest requestEndpoint]];
    [request setRequestTag:[deactivateLicenseRequest requestTag]];

    if (deactivateLicenseRequest != nil) {
        if (deactivateLicenseRequest.licenseId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deactivateLicenseRequest.licenseId] forKey:[NSString stringWithFormat:@"%@", @"LicenseId"]];
        }
    }
    if (deactivateLicenseRequest != nil) {
        if (deactivateLicenseRequest.capacity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deactivateLicenseRequest.capacity] forKey:[NSString stringWithFormat:@"%@", @"Capacity"]];
        }
    }


    return [request autorelease];
}

@end

