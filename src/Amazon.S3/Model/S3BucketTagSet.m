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

#import "S3BucketTagSet.h"


@implementation S3BucketTagSet

@synthesize tags;

-(NSString *)toXml
{
    NSMutableString *xml = [[NSMutableString alloc] init];

    [xml appendString:@"<TagSet>"];
    
    for (NSString *key in [tags allKeys]) {
        [xml appendString:@"<Tag>"];
        [xml appendFormat:@"<Key>%@</Key>", key];
        [xml appendFormat:@"<Value>%@</Value>", [tags objectForKey:key]];
        [xml appendString:@"</Tag>"];
    }
    
    [xml appendString:@"</TagSet>"];


    NSString *retval = [NSString stringWithString:xml];
    [xml release];

    return retval;
}

-(void)dealloc
{
    [tags release];
    [super dealloc];
}

@end
