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

#import "EC2LaunchPermissionModifications.h"


@implementation EC2LaunchPermissionModifications

@synthesize add;
@synthesize remove;


-(id)init
{
    if (self = [super init]) {
        add    = [[NSMutableArray alloc] initWithCapacity:1];
        remove = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addAdd:(EC2LaunchPermission *)addObject
{
    if (add == nil) {
        add = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [add addObject:addObject];
}

-(void)addRemove:(EC2LaunchPermission *)removeObject
{
    if (remove == nil) {
        remove = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [remove addObject:removeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Add: %@,", add] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Remove: %@,", remove] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [add release];
    [remove release];

    [super dealloc];
}


@end
