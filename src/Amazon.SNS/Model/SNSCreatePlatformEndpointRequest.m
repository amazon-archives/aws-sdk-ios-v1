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

#import "SNSCreatePlatformEndpointRequest.h"


@implementation SNSCreatePlatformEndpointRequest

@synthesize platformApplicationArn;
@synthesize token;
@synthesize customUserData;
@synthesize attributes;


-(id)init
{
    if (self = [super init]) {
        platformApplicationArn = nil;
        token                  = nil;
        customUserData         = nil;
        attributes             = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setAttributesValue:(NSString *)theValue forKey:(NSString *)theKey
{
    if (attributes == nil) {
        attributes = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [attributes setValue:theValue forKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PlatformApplicationArn: %@,", platformApplicationArn] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Token: %@,", token] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CustomUserData: %@,", customUserData] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attributes: %@,", attributes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [platformApplicationArn release];
    [token release];
    [customUserData release];
    [attributes release];

    [super dealloc];
}


@end
