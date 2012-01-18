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

#import "S3SetBucketVersioningConfigurationRequest.h"


@implementation S3SetBucketVersioningConfigurationRequest

@synthesize versioningConfiguration;
@synthesize mfa;

-(NSURLRequest *)configureURLRequest
{
    // This needs to be done before the superclass's implementation so that
    // it gets put into the URL.
    [self setSubResource:kS3SubResourceVersioning];

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodPut];


    if (self.versioningConfiguration.isMfaDeleteEnabled) {
        if (nil != self.mfa) {
            [self.urlRequest setValue:[NSString stringWithFormat:@"%@ %@", self.mfa.deviceSerialNumber, self.mfa.token] forHTTPHeaderField:kHttpHdrAmzMfa];
        }
    }

    NSData *data = [[[self versioningConfiguration] toXml] dataUsingEncoding:NSUTF8StringEncoding];
    [[self urlRequest] setHTTPBody:data];
    if (self.contentLength < 1) {
        [self.urlRequest setValue:[NSString stringWithFormat:@"%d", [data length]] forHTTPHeaderField:kHttpHdrContentLength];
    }

    return self.urlRequest;
}

-(void)dealloc
{
    [mfa release];
    [versioningConfiguration release];
    [super dealloc];
}

@end
