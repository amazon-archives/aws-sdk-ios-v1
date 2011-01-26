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

#import "S3Response.h"

@implementation S3Response

@synthesize contentLength;
@synthesize connectionState;
@synthesize date;
@synthesize etag;
@synthesize server;
@synthesize deleteMarker;
@synthesize id2;
@synthesize versionId;

-(id)init
{
	self = [super init];	
	if ( self != nil ) {
		isFinishedLoading = NO;
		exception = nil;
	}
	
	return self;
}

-(void)setValue:(id)value forHTTPHeaderField:(NSString *)header
{
	// remove dashes from headers, and camelCase concatenate to get the corresponding
	// property name.
	// i.e., x-amz-version-id => versionId, Content-Length => contentLength.
	
	NSString *tmp = [[header lowercaseString] stringByReplacingOccurrencesOfString:@"x-amz-" withString:@""];
	NSArray *parts = [tmp componentsSeparatedByString:@"-"];
	
	NSString *keyName = [(NSString *)[parts objectAtIndex:0] lowercaseString];
	for (int i = 1; i < [parts count]; i++) {
		keyName = [keyName stringByAppendingString:[[(NSString *)[parts objectAtIndex:i] lowercaseString] capitalizedString]];
	}
	
	//NSLog( @"Setting response value [%@] from header [%@] with value [%@]", keyName, header, value );
	
	NSString *typeName = [self getTypeOfPropertyNamed:keyName];
	
	if ([typeName isEqualToString:@"T@\"NSString\""]) {
		[self setValue:value forKey:keyName];
	}
	else if ([typeName isEqualToString:@"T@\"NSDate\""]) {
		[self setValue:[self parseDateHeader:value] forKey:keyName];
	}
	else if ([typeName isEqualToString:@"Ti"]) {
		int v = [(NSString *)value intValue];
		[self setValue:[NSNumber numberWithInt:v] forKey:keyName];
	}
}

-(NSDate *)parseDateHeader:(NSString *)dateString
{
	if (nil == dateFormatter) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:kS3DateFormat];
	}
	
	return [dateFormatter dateFromString:dateString];
}


-(NSString *)getTypeOfPropertyNamed:(NSString *)propertyName
{
	objc_property_t property = class_getProperty( [self class], [propertyName UTF8String] );
	if (NULL == property) { return nil; }
	
	const char *propertyAttributes = property_getAttributes( property );
	if (NULL == propertyAttributes) { return nil; }
	
	NSString *attrString = [NSString stringWithUTF8String:propertyAttributes];
	
	return [[attrString componentsSeparatedByString:@","] objectAtIndex:0];
}

-(NSData *)body
{
	return [NSData dataWithData:body];
}

// TODO: Make the body property readonly when all operations are converted to the delegate technique.
-(void)setBody:(NSData *)data
{
	if (nil != body) {
		[body setLength:0];
	}
	body = [[NSMutableData dataWithData:data] retain];
	[self processBody];
}

// Override this to perform processing on the body.
-(void)processBody
{
	// Subclasses can use this to build object data from the response, for example
	// parsing XML content.
}

-(NSException *)exception
{
	return exception;
}

#pragma mark NSURLConnection delegate methods

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
	self.httpStatusCode = [httpResponse statusCode];
	
	NSDictionary *headers = [httpResponse allHeaderFields];
	
	for (id key in headers)
	{
		[self setValue:[headers valueForKey:key] forHTTPHeaderField:key];
	}
	
	[body setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if (nil == body) {
		body = [[NSMutableData data] retain];
	}
	[body appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection 
{
	if (self.httpStatusCode >= 400) {
		NSString *tmp = [[NSString alloc] initWithData:self.body encoding:NSUTF8StringEncoding];
		AMZLog( @"ErrorResponse:\n%@",  tmp );
		[tmp release];
		
		NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.body];
		S3ErrorResponseHandler *errorHandler = [[S3ErrorResponseHandler alloc] initWithStatusCode:self.httpStatusCode];
		[parser setDelegate:errorHandler];
		[parser parse];
		
		exception = [[errorHandler exception] copy];
		
		[parser       release];
		[errorHandler release];
	}
	else {
		[self processBody];
		isFinishedLoading = YES;
	}
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSDictionary *info = [error userInfo];
	for (id key in info)
	{
		NSLog( @"UserInfo.%@ = %@", [key description], [[info valueForKey:key] description]);
	}
	exception = [[AmazonClientException exceptionWithMessage:[error description]] retain];
	NSLog( @"An error occured in the request: %@", [error description] );
}

- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
	NSLog(@"didSendBodyData");
}

// When a request gets a redirect due to the bucket being in a different region, 
// The request gets re-written with a GET http method. This is to set the method back to
// the appropriate method if necessary
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)proposedRequest redirectResponse:(NSURLResponse *)redirectResponse
{
	if (![[proposedRequest URL] isEqual:self.request.urlRequest.URL]) {
		AMZLog( @"Redirect:" );
		AMZLog( @"  New  URL: %@", [[proposedRequest URL] description] );
		AMZLog( @"  Orig URL: %@", self.request.urlRequest.URL );

		NSMutableURLRequest *newRequest = [self.request.urlRequest mutableCopy];
		[newRequest setURL:[proposedRequest URL]];
		return [newRequest autorelease];
	}
	
	return proposedRequest;
}

#pragma mark memory managament

-(void)dealloc
{
	[connectionState release];
	[date            release];
	[etag            release];
	[server          release];
	[id2             release];
	[versionId       release];
	
	[dateFormatter release];

	[super dealloc];
}

@end
