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

#import "EC2DisassociateAddressRequestMarshaller.h"

@implementation EC2DisassociateAddressRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DisassociateAddressRequest *)disassociateAddressRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DisassociateAddress"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[disassociateAddressRequest delegate]];
    [request setCredentials:[disassociateAddressRequest credentials]];
    [request setEndpoint:[disassociateAddressRequest requestEndpoint]];
    [request setRequestTag:[disassociateAddressRequest requestTag]];

    if (disassociateAddressRequest != nil) {
        if (disassociateAddressRequest.publicIp != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", disassociateAddressRequest.publicIp] forKey:[NSString stringWithFormat:@"%@", @"PublicIp"]];
        }
    }
    if (disassociateAddressRequest != nil) {
        if (disassociateAddressRequest.associationId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", disassociateAddressRequest.associationId] forKey:[NSString stringWithFormat:@"%@", @"AssociationId"]];
        }
    }


    return [request autorelease];
}

@end

