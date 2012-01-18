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

#import "ElasticLoadBalancingPolicyTypeDescription.h"


@implementation ElasticLoadBalancingPolicyTypeDescription

@synthesize policyTypeName;
@synthesize descriptionValue;
@synthesize policyAttributeTypeDescriptions;


-(id)init
{
    if (self = [super init]) {
        policyTypeName                  = nil;
        descriptionValue                = nil;
        policyAttributeTypeDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addPolicyAttributeTypeDescription:(ElasticLoadBalancingPolicyAttributeTypeDescription *)policyAttributeTypeDescriptionObject
{
    if (policyAttributeTypeDescriptions == nil) {
        policyAttributeTypeDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [policyAttributeTypeDescriptions addObject:policyAttributeTypeDescriptionObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PolicyTypeName: %@,", policyTypeName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PolicyAttributeTypeDescriptions: %@,", policyAttributeTypeDescriptions] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [policyTypeName release];
    [descriptionValue release];
    [policyAttributeTypeDescriptions release];

    [super dealloc];
}


@end
