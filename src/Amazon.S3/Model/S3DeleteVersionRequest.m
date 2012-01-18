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

#import "S3DeleteVersionRequest.h"

@implementation S3DeleteVersionRequest

@synthesize versionId;
@synthesize mfa;

-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableString *queryString = [NSMutableString stringWithCapacity:512];

    if (nil != self.versionId) {
        [queryString appendFormat:@"%@=%@", kS3SubResourceVersionId, self.versionId];
    }

    if (nil != self.mfa) {
        [self.urlRequest setValue:[NSString stringWithFormat:@"%@ %@", self.mfa.deviceSerialNumber, self.mfa.token] forHTTPHeaderField:kHttpHdrAmzMfa];
    }

    [self setSubResource:queryString];
    [super configureURLRequest];
    [self.urlRequest setHTTPMethod:kHttpMethodDelete];

    return urlRequest;
}


-(void)dealloc
{
    [versionId release];
    [mfa release];
    [super dealloc];
}

@end
