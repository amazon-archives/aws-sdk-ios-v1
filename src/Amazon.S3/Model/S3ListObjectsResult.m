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

#import "S3ListObjectsResult.h"


@implementation S3ListObjectsResult

@synthesize objectSummaries;

-(void)setObjectSummaries:(NSMutableArray *)theSummaries
{
	objectSummaries = theSummaries;
}

-(NSMutableArray *)objectSummaries
{
	if (nil==objectSummaries) {
		objectSummaries = [[NSMutableArray alloc] init];
	}
	return objectSummaries;
}

-(void)dealloc
{
	[objectSummaries release];
	
	[super dealloc];
}


@end
