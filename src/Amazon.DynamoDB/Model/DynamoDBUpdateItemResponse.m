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

#import "DynamoDBUpdateItemResponse.h"


@implementation DynamoDBUpdateItemResponse

@synthesize attributes;
@synthesize consumedCapacityUnits;


-(id)init
{
    if (self = [super init]) {
        attributes            = [[NSMutableDictionary alloc] initWithCapacity:1];
        consumedCapacityUnits = nil;
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"ProvisionedThroughputExceededException"]) {
        [newException release];
        newException = [[DynamoDBProvisionedThroughputExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"ConditionalCheckFailedException"]) {
        [newException release];
        newException = [[DynamoDBConditionalCheckFailedException alloc] initWithMessage:@""];
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


-(DynamoDBAttributeValue *)attributesValueForKey:(NSString *)theKey
{
    return (DynamoDBAttributeValue *)[attributes valueForKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attributes: %@,", attributes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ConsumedCapacityUnits: %@,", consumedCapacityUnits] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [attributes release];
    [consumedCapacityUnits release];

    [super dealloc];
}


@end
