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


#import "AmazonServiceRequest.h"

@implementation AmazonServiceRequest

@synthesize httpMethod;
@synthesize parameters;
@synthesize endpoint;

-(NSMutableURLRequest *)configureURLRequest
{
	[self.urlRequest setHTTPMethod:@"POST"];
	[self.urlRequest setHTTPBody:[[self queryString] dataUsingEncoding:NSUTF8StringEncoding]];
	[self.urlRequest setValue:[AmazonSDKUtil userAgentString] forHTTPHeaderField:@"User-Agent"];
	return self.urlRequest;
}

-(NSString *)queryString 
{
	NSMutableString* buffer = [[NSMutableString alloc] initWithCapacity:256];
	
	NSArray *keys = [[self parameters] allKeys];
    NSArray *sortedKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
	
	for ( int index = 0; index < [sortedKeys count]; index++ ) {
		NSString* key = [sortedKeys objectAtIndex:index];
		NSString* value = (NSString*)[[self parameters] valueForKey:key];
		
		[buffer appendString:[AmazonSDKUtil urlEncode:key]];
		[buffer appendString:@"="];
		[buffer appendString:[AmazonSDKUtil urlEncode:value]];
		
		if ( index < [sortedKeys count] - 1 ) {
			[buffer appendString:@"&"];
		}
	}
	
	return [buffer autorelease];
}

-(NSMutableURLRequest *)urlRequest
{
	if (nil == urlRequest) {
		urlRequest = [[NSMutableURLRequest alloc] init];
	}
	
	return urlRequest;
}

-(void)setUrlRequest:(NSMutableURLRequest *)request
{
	if (nil != urlRequest) 
	{
		[urlRequest release];
		urlRequest = nil;
	}
	urlRequest = [request retain];
}

-(void)setParameterValue:(NSString *)theValue forKey:(NSString *)theKey
{
	if (nil == parameters) {
		parameters = [[NSMutableDictionary alloc] initWithCapacity:1];
	}
	[parameters setValue:theValue forKey:theKey];
}

-(NSURL *)url
{
	return nil;
}

-(void)dealloc
{
	[endpoint   release];
	[urlRequest release];
	[parameters release];
	
	[super dealloc];
}

@end
