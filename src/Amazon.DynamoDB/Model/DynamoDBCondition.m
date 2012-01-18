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

#import "DynamoDBCondition.h"


@implementation DynamoDBCondition

@synthesize attributeValueList;
@synthesize comparisonOperator;


-(id)init
{
    if (self = [super init]) {
        attributeValueList = [[NSMutableArray alloc] initWithCapacity:1];
        comparisonOperator = nil;
    }

    return self;
}


-(void)addAttributeValueList:(DynamoDBAttributeValue *)attributeValueListObject
{
    if (attributeValueList == nil) {
        attributeValueList = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [attributeValueList addObject:attributeValueListObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeValueList: %@,", attributeValueList] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ComparisonOperator: %@,", comparisonOperator] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [attributeValueList release];
    [comparisonOperator release];

    [super dealloc];
}


@end
