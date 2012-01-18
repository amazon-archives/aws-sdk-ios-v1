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
#import <AWSiOSSDK/S3/AmazonS3Client.h>
#import <AWSiOSSDK/S3/S3GetObjectRequest.h>
#import <AWSiOSSDK/S3/S3GetObjectResponse.h>

static AmazonDynamoDBClient *ddb = nil;
static AmazonTVMClient   *tvm = nil;

@implementation AmazonClientManager

+(AmazonDynamoDBClient *)ddb
{
    @try
    {
        [AmazonClientManager validateCredentials];
        return ddb;
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception: %@", exception);
    }
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
    Response *ableToGetToken = nil;

    if ([AmazonKeyChainWrapper areCredentialsExpired]) {
        [AmazonClientManager clearCredentials];

        ableToGetToken = [[AmazonClientManager tvm] anonymousRegister];

        if ( [ableToGetToken wasSuccessful])
        {
            ableToGetToken = [[AmazonClientManager tvm] getToken];
        }
    }
    else
    {
        ableToGetToken = [[[Response alloc] initWithCode:200 andMessage:@"OK"] autorelease];
    }

    if ( [ableToGetToken wasSuccessful] && ddb == nil)
    {
        [AmazonClientManager clearCredentials];

        AmazonCredentials *credentials = [AmazonKeyChainWrapper getCredentialsFromKeyChain];

        ddb = [[AmazonDynamoDBClient alloc] initWithCredentials:credentials];
    }

    return ableToGetToken;
}

+(void)clearCredentials
{
    [ddb release];
    ddb = nil;
}

+(void)wipeAllCredentials
{
    [AmazonClientManager clearCredentials];
    [AmazonKeyChainWrapper wipeCredentialsFromKeyChain];
}

@end
