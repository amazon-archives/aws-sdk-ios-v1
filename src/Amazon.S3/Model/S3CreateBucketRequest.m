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

#import "S3CreateBucketRequest.h"


@implementation S3CreateBucketRequest

@synthesize region;
@synthesize cannedACL;
@synthesize fullACL;

-(NSMutableURLRequest *)configureURLRequest
{
    [super configureURLRequest];

    [self.urlRequest setHTTPMethod:kHttpMethodPut];

    if (self.region != nil) {
        [self.urlRequest setHTTPBody:self.createBucketConfiguration];
    }
    if (nil != self.cannedACL) {
        [self.urlRequest setValue:[self.cannedACL description] forHTTPHeaderField:kHttpHdrAmzAcl];
    }
    if (nil != self.fullACL) {
        NSDictionary *aclHeaders = [self.fullACL toHeaders];
        for (NSString *headerName in [aclHeaders allKeys]) {
            [self.urlRequest setValue:[aclHeaders valueForKey:headerName] forHTTPHeaderField:headerName];
        }
    }

    return self.urlRequest;
}

-(id)initWithName:(NSString *)theBucketName
{
    self = [self init];
    if (self != nil) {
        self.bucket = theBucketName;
    }

    return self;
}

-(id)initWithName:(NSString *)theBucketName andRegion:(S3Region *)theRegion
{
    self = [self initWithName:theBucketName];
    if (self != nil) {
        self.region = theRegion;
    }

    return self;
}

-(NSData *)createBucketConfiguration
{
    if (self.region == nil) {
        return nil;
    }
    NSString *config = [NSString stringWithFormat:@"<CreateBucketConfiguration xmlns=\"http://s3.amazonaws.com/doc/%@/\"><LocationConstraint>%@</LocationConstraint></CreateBucketConfiguration>", @"2006-03-01", [self.region description]];

    return [config dataUsingEncoding:NSUTF8StringEncoding];
}

- (AmazonClientException *)validate
{
    AmazonClientException *clientException = [super validate];
    
    if(clientException == nil)
    {
        clientException = [S3BucketNameUtilities validateBucketName:self.bucket];
    }
    
    return clientException;
}

-(void)dealloc
{
    [region release];
    [cannedACL release];
    [fullACL release];

    [super dealloc];
}


@end
