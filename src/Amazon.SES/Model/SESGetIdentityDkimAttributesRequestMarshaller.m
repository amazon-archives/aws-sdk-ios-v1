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

#import "SESGetIdentityDkimAttributesRequestMarshaller.h"

@implementation SESGetIdentityDkimAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESGetIdentityDkimAttributesRequest *)getIdentityDkimAttributesRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"GetIdentityDkimAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[getIdentityDkimAttributesRequest delegate]];
    [request setCredentials:[getIdentityDkimAttributesRequest credentials]];
    [request setEndpoint:[getIdentityDkimAttributesRequest requestEndpoint]];
    [request setRequestTag:[getIdentityDkimAttributesRequest requestTag]];


    if (getIdentityDkimAttributesRequest != nil) {
        int identitiesListIndex = 1;
        for (NSString *identitiesListValue in getIdentityDkimAttributesRequest.identities) {
            if (identitiesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", identitiesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Identities", identitiesListIndex]];
            }

            identitiesListIndex++;
        }
    }


    return [request autorelease];
}

@end

