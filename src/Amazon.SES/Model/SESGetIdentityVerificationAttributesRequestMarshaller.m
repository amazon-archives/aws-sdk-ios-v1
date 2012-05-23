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

#import "SESGetIdentityVerificationAttributesRequestMarshaller.h"

@implementation SESGetIdentityVerificationAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESGetIdentityVerificationAttributesRequest *)getIdentityVerificationAttributesRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"GetIdentityVerificationAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[getIdentityVerificationAttributesRequest delegate]];
    [request setCredentials:[getIdentityVerificationAttributesRequest credentials]];
    [request setEndpoint:[getIdentityVerificationAttributesRequest requestEndpoint]];
    [request setRequestTag:[getIdentityVerificationAttributesRequest requestTag]];


    if (getIdentityVerificationAttributesRequest != nil) {
        int identitiesListIndex = 1;
        for (NSString *identitiesListValue in getIdentityVerificationAttributesRequest.identities) {
            if (identitiesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", identitiesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Identities", identitiesListIndex]];
            }

            identitiesListIndex++;
        }
    }


    return [request autorelease];
}

@end

