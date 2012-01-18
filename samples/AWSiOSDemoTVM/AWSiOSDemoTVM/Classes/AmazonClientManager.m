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

#import "AmazonClientManager.h"
#import <AWSiOSSDK/AmazonLogger.h>
#import "AmazonKeyChainWrapper.h"
#import "AmazonTVMClient.h"

static AmazonS3Client       *s3  = nil;
static AmazonSimpleDBClient *sdb = nil;
static AmazonSQSClient      *sqs = nil;
static AmazonSNSClient      *sns = nil;
static AmazonTVMClient      *tvm = nil;

@implementation AmazonClientManager

+(AmazonS3Client *)s3
{
    [AmazonClientManager validateCredentials];
    return s3;
}

+(AmazonSimpleDBClient *)sdb
{
    [AmazonClientManager validateCredentials];
    return sdb;
}

+(AmazonSQSClient *)sqs
{
    [AmazonClientManager validateCredentials];
    return sqs;
}

+(AmazonSNSClient *)sns
{
    [AmazonClientManager validateCredentials];
    return sns;
}

+(AmazonTVMClient *)tvm
{
    if (tvm == nil) {
        tvm = [[AmazonTVMClient alloc] initWithEndpoint:TOKEN_VENDING_MACHINE_URL useSSL:USE_SSL];
    }

    return tvm;
}

+(bool)hasCredentials
{
    return ![TOKEN_VENDING_MACHINE_URL isEqualToString:@"CHANGE ME"];
}

+(Response *)validateCredentials
{
    Response *ableToGetToken = [[[Response alloc] initWithCode:200 andMessage:@"OK"] autorelease];

    if ( [AmazonKeyChainWrapper areCredentialsExpired]) {
        [AmazonClientManager clearCredentials];

        ableToGetToken = [[AmazonClientManager tvm] anonymousRegister];
        if ( [ableToGetToken wasSuccessful]) {
            ableToGetToken = [[AmazonClientManager tvm] getToken];
        }
    }

    if ( [ableToGetToken wasSuccessful] && ((sdb == nil) || (s3 == nil) || (sqs == nil) || (sns == nil))) {
        [AmazonClientManager clearCredentials];

        AmazonCredentials *credentials = [[AmazonKeyChainWrapper getCredentialsFromKeyChain] autorelease];
        s3  = [[AmazonS3Client alloc] initWithCredentials:credentials];
        sdb = [[AmazonSimpleDBClient alloc] initWithCredentials:credentials];
        sqs = [[AmazonSQSClient alloc] initWithCredentials:credentials];
        sns = [[AmazonSNSClient alloc] initWithCredentials:credentials];
    }

    return ableToGetToken;
}

+(void)clearCredentials
{
    [s3 release];
    [sdb release];
    [sns release];
    [sqs release];

    s3  = nil;
    sdb = nil;
    sqs = nil;
    sns = nil;
}

+(void)wipeAllCredentials
{
    [AmazonClientManager clearCredentials];
    [AmazonKeyChainWrapper wipeCredentialsFromKeyChain];
}


@end
