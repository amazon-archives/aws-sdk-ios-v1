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

#import "DynamoDBDeleteTableResponse.h"


@implementation DynamoDBDeleteTableResponse

@synthesize tableDescription;


-(id)init
{
    if (self = [super init]) {
        tableDescription = nil;
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"ResourceInUseException"]) {
        [newException release];
        newException = [[DynamoDBResourceInUseException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"LimitExceededException"]) {
        [newException release];
        newException = [[DynamoDBLimitExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InternalServerError"]) {
        [newException release];
        newException = [[DynamoDBInternalServerErrorException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"ResourceNotFoundException"]) {
        [newException release];
        newException = [[DynamoDBResourceNotFoundException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableDescription: %@,", tableDescription] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [tableDescription release];

    [super dealloc];
}


@end
