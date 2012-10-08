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

#import "EC2PurchaseReservedInstancesOfferingRequestMarshaller.h"

@implementation EC2PurchaseReservedInstancesOfferingRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2PurchaseReservedInstancesOfferingRequest *)purchaseReservedInstancesOfferingRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"PurchaseReservedInstancesOffering"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[purchaseReservedInstancesOfferingRequest delegate]];
    [request setCredentials:[purchaseReservedInstancesOfferingRequest credentials]];
    [request setEndpoint:[purchaseReservedInstancesOfferingRequest requestEndpoint]];
    [request setRequestTag:[purchaseReservedInstancesOfferingRequest requestTag]];

    if (purchaseReservedInstancesOfferingRequest != nil) {
        if (purchaseReservedInstancesOfferingRequest.reservedInstancesOfferingId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", purchaseReservedInstancesOfferingRequest.reservedInstancesOfferingId] forKey:[NSString stringWithFormat:@"%@", @"ReservedInstancesOfferingId"]];
        }
    }
    if (purchaseReservedInstancesOfferingRequest != nil) {
        if (purchaseReservedInstancesOfferingRequest.instanceCount != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", purchaseReservedInstancesOfferingRequest.instanceCount] forKey:[NSString stringWithFormat:@"%@", @"InstanceCount"]];
        }
    }
    if (purchaseReservedInstancesOfferingRequest != nil) {
        EC2ReservedInstanceLimitPrice *limitPrice = purchaseReservedInstancesOfferingRequest.limitPrice;
        if (limitPrice != nil) {
            if (limitPrice.amount != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", limitPrice.amount] forKey:[NSString stringWithFormat:@"%@.%@", @"LimitPrice", @"Amount"]];
            }
        }
        if (limitPrice != nil) {
            if (limitPrice.currencyCode != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", limitPrice.currencyCode] forKey:[NSString stringWithFormat:@"%@.%@", @"LimitPrice", @"CurrencyCode"]];
            }
        }
    }


    return [request autorelease];
}

@end

