/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "SESDestination.h"


@implementation SESDestination

@synthesize toAddresses;
@synthesize ccAddresses;
@synthesize bccAddresses;


-(id)init
{
    if (self = [super init]) {
        toAddresses  = [[NSMutableArray alloc] initWithCapacity:1];
        ccAddresses  = [[NSMutableArray alloc] initWithCapacity:1];
        bccAddresses = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ToAddresses: %@,", toAddresses] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CcAddresses: %@,", ccAddresses] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BccAddresses: %@,", bccAddresses] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [toAddresses release];
    [ccAddresses release];
    [bccAddresses release];

    [super dealloc];
}


@end
