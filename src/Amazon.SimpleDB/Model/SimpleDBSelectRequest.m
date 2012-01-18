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

#import "SimpleDBSelectRequest.h"


@implementation SimpleDBSelectRequest

@synthesize selectExpression;
@synthesize nextToken;
@synthesize consistentRead;
@synthesize consistentReadIsSet;


-(id)init
{
    if (self = [super init]) {
        selectExpression    = nil;
        nextToken           = nil;
        consistentRead      = NO;
        consistentReadIsSet = NO;
    }

    return self;
}

-(id)initWithSelectExpression:(NSString *)theSelectExpression
{
    if (self = [self init]) {
        self.selectExpression = theSelectExpression;
    }

    return self;
}

-(id)initWithSelectExpression:(NSString *)theSelectExpression andConsistentRead:(bool)theConsistentRead
{
    if (self = [self init]) {
        self.selectExpression = theSelectExpression;
        self.consistentRead   = theConsistentRead;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SelectExpression: %@,", selectExpression] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ConsistentRead: %d,", consistentRead] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setConsistentRead:(bool)theValue
{
    consistentRead      = theValue;
    consistentReadIsSet = YES;
}


-(void)dealloc
{
    [selectExpression release];
    [nextToken release];

    [super dealloc];
}


@end
