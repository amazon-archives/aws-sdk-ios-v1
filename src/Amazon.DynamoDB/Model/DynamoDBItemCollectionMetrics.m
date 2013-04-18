/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "DynamoDBItemCollectionMetrics.h"


@implementation DynamoDBItemCollectionMetrics

@synthesize itemCollectionKey;
@synthesize sizeEstimateRangeGB;


-(id)init
{
    if (self = [super init]) {
        itemCollectionKey   = [[NSMutableDictionary alloc] initWithCapacity:1];
        sizeEstimateRangeGB = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setItemCollectionKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey
{
    if (itemCollectionKey == nil) {
        itemCollectionKey = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [itemCollectionKey setValue:theValue forKey:theKey];
}

-(void)addSizeEstimateRangeGB:(NSNumber *)sizeEstimateRangeGBObject
{
    if (sizeEstimateRangeGB == nil) {
        sizeEstimateRangeGB = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [sizeEstimateRangeGB addObject:sizeEstimateRangeGBObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ItemCollectionKey: %@,", itemCollectionKey] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SizeEstimateRangeGB: %@,", sizeEstimateRangeGB] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [itemCollectionKey release];
    [sizeEstimateRangeGB release];

    [super dealloc];
}


@end
