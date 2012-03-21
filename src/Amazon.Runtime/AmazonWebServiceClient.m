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

#import "AmazonWebServiceClient.h"
#import "AmazonEndpoints.h"

@implementation AmazonWebServiceClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [self init]) {
        credentials = [[AmazonCredentials alloc] initWithAccessKey:theAccessKey withSecretKey:theSecretKey];
        maxRetries  = 5;
        timeout     = 240;
        delay       = 0.2;
        userAgent   = [[AmazonSDKUtil userAgentString] retain];
    }
    return self;
}

@end
