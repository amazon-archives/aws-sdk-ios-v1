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

#import "DynamoDBAttributeValueUpdate.h"


@implementation DynamoDBAttributeValueUpdate

@synthesize value;
@synthesize action;


-(id)init
{
    if (self = [super init]) {
        value  = nil;
        action = nil;
    }

    return self;
}

-(id)initWithValue:(DynamoDBAttributeValue *)theValue andAction:(NSString *)theAction
{
    if (self = [self init]) {
        self.value  = theValue;
        self.action = theAction;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Value: %@,", value] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Action: %@,", action] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [value release];
    [action release];

    [super dealloc];
}


@end
