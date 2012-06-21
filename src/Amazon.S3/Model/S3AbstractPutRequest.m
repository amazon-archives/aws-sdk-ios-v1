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

#import "S3AbstractPutRequest.h"

@implementation S3AbstractPutRequest

@synthesize cannedACL;
@synthesize storageClass;
@synthesize serverSideEncryption;
@synthesize fullACL;

-(NSMutableURLRequest *)configureURLRequest
{
    [super configureURLRequest];

    if (nil != self.cannedACL) {
        [self.urlRequest setValue:[self.cannedACL description] forHTTPHeaderField:kHttpHdrAmzAcl];
    }
    if (nil != self.storageClass) {
        [self.urlRequest setValue:self.storageClass forHTTPHeaderField:kHttpHdrAmzStorageClass];
    }
    if (nil != self.serverSideEncryption) {
        [self.urlRequest setValue:self.serverSideEncryption forHTTPHeaderField:kHttpHdrAmzServerSideEncryption];
    }
    for (id k in [self metadata]) {
        [self.urlRequest setValue:[[self metadata] objectForKey:k] forHTTPHeaderField:[NSString stringWithFormat:kHttpHdrAmzMetaFormat, [k description]]];
    }
    if (nil != self.fullACL) {
        NSDictionary *aclHeaders = [self.fullACL toHeaders];
        for (NSString *headerName in [aclHeaders allKeys]) {
            [self.urlRequest setValue:[aclHeaders valueForKey:headerName] forHTTPHeaderField:headerName];
        }
    }

    return urlRequest;
}

-(NSMutableDictionary *)metadata
{
    if (nil == metadata) {
        metadata = [[NSMutableDictionary alloc] init];
    }
    return metadata;
}

-(void) addMetadataWithValue:(NSString *)value forKey:(NSString *)aKey
{
    [[self metadata] setValue:value forKey:aKey];
}

-(void)dealloc
{
    [cannedACL release];
    [storageClass release];
    [metadata release];
    [serverSideEncryption release];
    [fullACL release];

    [super dealloc];
}


@end
