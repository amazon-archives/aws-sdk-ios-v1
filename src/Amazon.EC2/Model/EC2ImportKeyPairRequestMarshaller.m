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

#import "EC2ImportKeyPairRequestMarshaller.h"

@implementation EC2ImportKeyPairRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ImportKeyPairRequest *)importKeyPairRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ImportKeyPair"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[importKeyPairRequest delegate]];
    [request setCredentials:[importKeyPairRequest credentials]];
    [request setEndpoint:[importKeyPairRequest requestEndpoint]];
    [request setRequestTag:[importKeyPairRequest requestTag]];

    if (importKeyPairRequest != nil) {
        if (importKeyPairRequest.keyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", importKeyPairRequest.keyName] forKey:[NSString stringWithFormat:@"%@", @"KeyName"]];
        }
    }
    if (importKeyPairRequest != nil) {
        if (importKeyPairRequest.publicKeyMaterial != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", importKeyPairRequest.publicKeyMaterial] forKey:[NSString stringWithFormat:@"%@", @"PublicKeyMaterial"]];
        }
    }


    return [request autorelease];
}

@end

