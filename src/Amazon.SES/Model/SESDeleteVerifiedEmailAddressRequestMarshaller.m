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

#import "SESDeleteVerifiedEmailAddressRequestMarshaller.h"

@implementation SESDeleteVerifiedEmailAddressRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESDeleteVerifiedEmailAddressRequest *)deleteVerifiedEmailAddressRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"DeleteVerifiedEmailAddress"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[deleteVerifiedEmailAddressRequest delegate]];
    [request setCredentials:[deleteVerifiedEmailAddressRequest credentials]];
    [request setEndpoint:[deleteVerifiedEmailAddressRequest requestEndpoint]];
    [request setRequestTag:[deleteVerifiedEmailAddressRequest requestTag]];

    if (deleteVerifiedEmailAddressRequest != nil) {
        if (deleteVerifiedEmailAddressRequest.emailAddress != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteVerifiedEmailAddressRequest.emailAddress] forKey:[NSString stringWithFormat:@"%@", @"EmailAddress"]];
        }
    }


    return [request autorelease];
}

@end

