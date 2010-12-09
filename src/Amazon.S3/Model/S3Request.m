/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "S3Request.h"

@implementation S3Request

#pragma mark Properties

@synthesize authorization;
@synthesize contentLength;
@synthesize contentType;
@synthesize securityToken;
@synthesize bucket;
@synthesize key;
@synthesize subResource;

#pragma mark methods

-(NSMutableURLRequest *)configureURLRequest
{
	[super configureURLRequest];
	[self setHttpMethod:kHttpMethodGet];
	
	[self.urlRequest setValue:[NSString stringWithFormat:@"%d", self.contentLength, nil] forHTTPHeaderField:kHttpHdrContentLength];
	
	[self.urlRequest setValue:self.host                 forHTTPHeaderField:kHttpHdrHost];
	[self.urlRequest setValue:[self.date requestFormat] forHTTPHeaderField:kHttpHdrDate]; 
	
	if (nil != self.httpMethod)		[self.urlRequest setHTTPMethod:self.httpMethod];
	if (nil != self.contentType)	[self.urlRequest setValue:self.contentType	 forHTTPHeaderField:kHttpHdrContentType];
	if (nil != self.securityToken)	[self.urlRequest setValue:self.securityToken forHTTPHeaderField:kHttpHdrAmzSecurityToken];
	
	[self.urlRequest setURL:self.url];
	
	return urlRequest;
}

-(NSString *)timestamp 
{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:kS3DateFormat];
	
	return [dateFormatter stringFromDate:[self date]];
}

#pragma mark accessors

-(NSURL *)url
{   
	NSString *keyPath  = (self.key         == nil ? @"" : [NSString stringWithFormat:@"/%@", self.key]);
	NSString *resQuery = (self.subResource == nil ? @"" : [NSString stringWithFormat:@"?%@", self.subResource]);
	
	return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@%@", self.host, keyPath, resQuery]];
}

-(NSString *)host
{
	if (nil != self.bucket) {
		return [NSString stringWithFormat:@"%@.s3.amazonaws.com", self.bucket];
	}
	
	return @"s3.amazonaws.com";
}

-(NSDate *)date
{
	if (date == nil) {
		date = [NSDate date];
	}
	return date;
}

-(void)setDate:(NSDate *)aDate
{
	date = aDate;
}

#pragma mark memory management

-(void)dealloc
{
	[contentType    release];
	[securityToken  release];
	[httpMethod     release];
	[subResource    release];
	[key            release];
	[bucket         release];
	
	[super dealloc];
}

@end

#pragma mark Categories

@implementation NSDate (WithS3RequestFormat)

-(NSString *)requestFormat
{
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateFormat:kS3DateFormat];
	
	return [dateFormatter stringFromDate:self];
}

@end

