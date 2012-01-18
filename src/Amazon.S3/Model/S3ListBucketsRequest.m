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

#import "S3ListBucketsRequest.h"


@implementation S3ListBucketsRequest


-(id)init
{
    self = [super init];
    if (self != nil) {
        self.httpMethod = kHttpMethodGet;
    }

    return self;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [super configureURLRequest];

    [self.urlRequest setURL:self.url];

    return self.urlRequest;
}

-(void)dealloc
{
    [super dealloc];
}

@end
