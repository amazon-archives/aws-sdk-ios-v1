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

#import "SESListIdentitiesRequestMarshaller.h"

@implementation SESListIdentitiesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESListIdentitiesRequest *)listIdentitiesRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"ListIdentities"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[listIdentitiesRequest delegate]];
    [request setCredentials:[listIdentitiesRequest credentials]];
    [request setEndpoint:[listIdentitiesRequest requestEndpoint]];
    [request setRequestTag:[listIdentitiesRequest requestTag]];

    if (listIdentitiesRequest != nil) {
        if (listIdentitiesRequest.identityType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listIdentitiesRequest.identityType] forKey:[NSString stringWithFormat:@"%@", @"IdentityType"]];
        }
    }
    if (listIdentitiesRequest != nil) {
        if (listIdentitiesRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listIdentitiesRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (listIdentitiesRequest != nil) {
        if (listIdentitiesRequest.maxItems != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listIdentitiesRequest.maxItems] forKey:[NSString stringWithFormat:@"%@", @"MaxItems"]];
        }
    }


    return [request autorelease];
}

@end

