/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "SimpleDBRequest.h"
#import "AmazonAuthUtils.h"

@implementation SimpleDBRequest

-(void)sign
{
    [self setParameterValue:credentials.accessKey forKey:@"AWSAccessKeyId"];
    [self setParameterValue:@"2"                                        forKey:@"SignatureVersion"];
    [self setParameterValue:[NSDate ISO8061FormattedCurrentTimestamp]   forKey:@"Timestamp"];
    [self setParameterValue:@"HmacSHA256"                               forKey:@"SignatureMethod"];
    
    NSData   *dataToSign = [[AmazonAuthUtils getV2StringToSign:[NSURL URLWithString:self.endpoint] request:self] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *signature  = [AmazonAuthUtils HMACSign:dataToSign withKey:credentials.secretKey usingAlgorithm:kCCHmacAlgSHA256];
    
    [self setParameterValue:signature forKey:@"Signature"];
}

@end
