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

#import "DynamoDBProvisionedThroughputDescription.h"


@implementation DynamoDBProvisionedThroughputDescription

@synthesize lastIncreaseDateTime;
@synthesize lastDecreaseDateTime;
@synthesize readCapacityUnits;
@synthesize writeCapacityUnits;


-(id)init
{
    if (self = [super init]) {
        lastIncreaseDateTime = nil;
        lastDecreaseDateTime = nil;
        readCapacityUnits    = nil;
        writeCapacityUnits   = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LastIncreaseDateTime: %@,", lastIncreaseDateTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LastDecreaseDateTime: %@,", lastDecreaseDateTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReadCapacityUnits: %@,", readCapacityUnits] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"WriteCapacityUnits: %@,", writeCapacityUnits] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [lastIncreaseDateTime release];
    [lastDecreaseDateTime release];
    [readCapacityUnits release];
    [writeCapacityUnits release];

    [super dealloc];
}


@end
