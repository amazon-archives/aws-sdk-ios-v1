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

#import "EC2AssociateAddressRequestMarshaller.h"

@implementation EC2AssociateAddressRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2AssociateAddressRequest *)associateAddressRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"AssociateAddress"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[associateAddressRequest delegate]];
    [request setCredentials:[associateAddressRequest credentials]];
    [request setEndpoint:[associateAddressRequest requestEndpoint]];
    [request setRequestTag:[associateAddressRequest requestTag]];

    if (associateAddressRequest != nil) {
        if (associateAddressRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", associateAddressRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (associateAddressRequest != nil) {
        if (associateAddressRequest.publicIp != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", associateAddressRequest.publicIp] forKey:[NSString stringWithFormat:@"%@", @"PublicIp"]];
        }
    }
    if (associateAddressRequest != nil) {
        if (associateAddressRequest.allocationId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", associateAddressRequest.allocationId] forKey:[NSString stringWithFormat:@"%@", @"AllocationId"]];
        }
    }
    if (associateAddressRequest != nil) {
        if (associateAddressRequest.networkInterfaceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", associateAddressRequest.networkInterfaceId] forKey:[NSString stringWithFormat:@"%@", @"NetworkInterfaceId"]];
        }
    }
    if (associateAddressRequest != nil) {
        if (associateAddressRequest.privateIpAddress != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", associateAddressRequest.privateIpAddress] forKey:[NSString stringWithFormat:@"%@", @"PrivateIpAddress"]];
        }
    }
    if (associateAddressRequest != nil) {
        if (associateAddressRequest.allowReassociationIsSet) {
            [request setParameterValue:(associateAddressRequest.allowReassociation ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"AllowReassociation"]];
        }
    }


    return [request autorelease];
}

@end

