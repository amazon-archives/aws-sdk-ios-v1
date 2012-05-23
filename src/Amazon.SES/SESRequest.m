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

#import "SESRequest.h"

@implementation SESRequest

-(void)sign
{
    [self setParameterValue:credentials.accessKey forKey:@"AWSAccessKeyId"];
}

-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableURLRequest *mutableURLRequest = [super configureURLRequest];

    NSString            *rfc822Date = [[NSDate date] stringWithRFC822Format];
    NSString            *nonce      = [AmazonAuthUtils nonce];
    NSString            *sts        = [AmazonAuthUtils getV3StringToSign:rfc822Date nonce:nonce];
    NSString            *signature  = [AmazonAuthUtils signRequestV3:self sts:sts credentials:credentials];

    [mutableURLRequest setValue:nonce forHTTPHeaderField:@"x-amz-nonce"];
    [mutableURLRequest setValue:rfc822Date forHTTPHeaderField:@"Date"];
    [mutableURLRequest setValue:[AmazonAuthUtils amznAuthorization:credentials.accessKey algorithm:@"HmacSHA256" signature:signature]   forHTTPHeaderField:@"X-Amzn-Authorization"];

    return mutableURLRequest;
}


@end
