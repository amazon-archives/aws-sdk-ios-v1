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

#import "AmazonClientException.h"

@implementation AmazonClientException

@synthesize message;

+(AmazonClientException *)exceptionWithMessage:(NSString *)theMessage
{
	AmazonClientException *e = (AmazonClientException *)[AmazonClientException exceptionWithName:@"AmazonClientException" reason:theMessage userInfo:nil];
	e.message = theMessage;
	return e;
}

-(id)initWithMessage:(NSString *)theMessage 
{
	self = [super initWithName:@"AmazonClientException" reason:theMessage userInfo:nil];
	if ( self != nil ) {
		self.message = theMessage;
	}
	
	return self;
}


-(void)dealloc 
{
	[message release];

	[super dealloc];
}


@end
