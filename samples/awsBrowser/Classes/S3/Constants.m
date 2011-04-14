/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "Constants.h"


@implementation Constants

static AmazonS3Client       *s3  = nil;
static AmazonSimpleDBClient *sdb = nil;
static AmazonSQSClient      *sqs = nil;
static AmazonSNSClient      *sns = nil;

+(AmazonS3Client *)s3
{
    if (s3 == nil) {
        s3 = [[AmazonS3Client alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];
    }
    return s3;
}

+(AmazonSimpleDBClient *)sdb
{
    if (sdb == nil) {
        sdb = [[AmazonSimpleDBClient alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];
    }
    return sdb;
}

+(AmazonSQSClient *)sqs
{
    if (sqs == nil) {
        sqs = [[AmazonSQSClient alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];
    }
    return sqs;
}

+(AmazonSNSClient *)sns
{
    if (sns == nil) {
        sns = [[AmazonSNSClient alloc] initWithAccessKey:ACCESS_KEY withSecretKey:SECRET_KEY];
    }
    return sns;
}

+(UIAlertView *)credentialsAlert
{
    return [[[UIAlertView alloc] initWithTitle:@"AWS Credentials" message:CREDENTIALS_ALERT_MESSAGE delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
}

@end
