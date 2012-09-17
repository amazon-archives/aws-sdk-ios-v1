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

#import "SimpleDBDomainMetadataResponse.h"


@implementation SimpleDBDomainMetadataResponse

@synthesize itemCount;
@synthesize itemNamesSizeBytes;
@synthesize attributeNameCount;
@synthesize attributeNamesSizeBytes;
@synthesize attributeValueCount;
@synthesize attributeValuesSizeBytes;
@synthesize timestamp;


-(id)init
{
    if (self = [super init]) {
        itemCount                = nil;
        itemNamesSizeBytes       = nil;
        attributeNameCount       = nil;
        attributeNamesSizeBytes  = nil;
        attributeValueCount      = nil;
        attributeValuesSizeBytes = nil;
        timestamp                = nil;
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"NoSuchDomain"]) {
        [newException release];
        newException = [[SimpleDBNoSuchDomainException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"MissingParameter"]) {
        [newException release];
        newException = [[SimpleDBMissingParameterException alloc] initWithMessage:@""];
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ItemCount: %@,", itemCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ItemNamesSizeBytes: %@,", itemNamesSizeBytes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeNameCount: %@,", attributeNameCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeNamesSizeBytes: %@,", attributeNamesSizeBytes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeValueCount: %@,", attributeValueCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeValuesSizeBytes: %@,", attributeValuesSizeBytes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [itemCount release];
    [itemNamesSizeBytes release];
    [attributeNameCount release];
    [attributeNamesSizeBytes release];
    [attributeValueCount release];
    [attributeValuesSizeBytes release];
    [timestamp release];

    [super dealloc];
}


@end
