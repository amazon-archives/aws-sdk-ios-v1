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

#import "EC2CopyImageRequest.h"


@implementation EC2CopyImageRequest

@synthesize sourceRegion;
@synthesize sourceImageId;
@synthesize name;
@synthesize descriptionValue;
@synthesize clientToken;


-(id)init
{
    if (self = [super init]) {
        sourceRegion     = nil;
        sourceImageId    = nil;
        name             = nil;
        descriptionValue = nil;
        clientToken      = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceRegion: %@,", sourceRegion] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceImageId: %@,", sourceImageId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ClientToken: %@,", clientToken] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [sourceRegion release];
    [sourceImageId release];
    [name release];
    [descriptionValue release];
    [clientToken release];

    [super dealloc];
}


@end
