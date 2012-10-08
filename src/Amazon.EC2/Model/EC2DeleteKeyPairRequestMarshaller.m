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

#import "EC2DeleteKeyPairRequestMarshaller.h"

@implementation EC2DeleteKeyPairRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeleteKeyPairRequest *)deleteKeyPairRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeleteKeyPair"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deleteKeyPairRequest delegate]];
    [request setCredentials:[deleteKeyPairRequest credentials]];
    [request setEndpoint:[deleteKeyPairRequest requestEndpoint]];
    [request setRequestTag:[deleteKeyPairRequest requestTag]];

    if (deleteKeyPairRequest != nil) {
        if (deleteKeyPairRequest.keyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteKeyPairRequest.keyName] forKey:[NSString stringWithFormat:@"%@", @"KeyName"]];
        }
    }


    return [request autorelease];
}

@end

