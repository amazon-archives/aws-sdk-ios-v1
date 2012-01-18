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

#import "ElasticLoadBalancingPolicyAttributeTypeDescription.h"


@implementation ElasticLoadBalancingPolicyAttributeTypeDescription

@synthesize attributeName;
@synthesize attributeType;
@synthesize descriptionValue;
@synthesize defaultValue;
@synthesize cardinality;


-(id)init
{
    if (self = [super init]) {
        attributeName    = nil;
        attributeType    = nil;
        descriptionValue = nil;
        defaultValue     = nil;
        cardinality      = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeName: %@,", attributeName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeType: %@,", attributeType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DefaultValue: %@,", defaultValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Cardinality: %@,", cardinality] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [attributeName release];
    [attributeType release];
    [descriptionValue release];
    [defaultValue release];
    [cardinality release];

    [super dealloc];
}


@end
