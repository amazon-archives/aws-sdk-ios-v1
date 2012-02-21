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

#import "S3SetBucketWebsiteConfigurationRequest.h"

@implementation S3SetBucketWebsiteConfigurationRequest

@synthesize configuration;

-(id)initWithBucketName:(NSString *)theBucketName withConfiguration:(BucketWebsiteConfiguration *)theConfiguration
{
    self = [super init];
    if (self)
    {
        self.bucket        = theBucketName;
        self.configuration = theConfiguration;
    }

    return self;
}

-(id)initWithBucketName:(NSString *)theBucketName
{
    return [self initWithBucketName:theBucketName withConfiguration:nil];
}

+(id)requestWithBucketName:(NSString *)theBucketName withConfiguration:(BucketWebsiteConfiguration *)theConfiguration
{
    return [[[S3SetBucketWebsiteConfigurationRequest alloc] initWithBucketName:theBucketName withConfiguration:theConfiguration] autorelease];
}

+(id)requestWithBucketName:(NSString *)theBucketName
{
    return [[[S3SetBucketWebsiteConfigurationRequest alloc] initWithBucketName:theBucketName withConfiguration:nil] autorelease];
}

-(NSMutableURLRequest *)configureURLRequest
{
    [self setSubResource:kS3SubResourceWebsite];

    [super configureURLRequest];

    [self.urlRequest setHTTPMethod:kHttpMethodPut];

    NSData *data = [[self.configuration toXml] dataUsingEncoding:NSUTF8StringEncoding];

    [self.urlRequest setValue:[NSString stringWithFormat:@"%d", [data length]] forHTTPHeaderField:kHttpHdrContentLength];
    [self.urlRequest setValue:@"text/xml" forHTTPHeaderField:kHttpHdrContentType];
    [self.urlRequest setHTTPBody:data];

    return urlRequest;
}

-(void)dealloc
{
    [configuration release];

    [super dealloc];
}

@end
