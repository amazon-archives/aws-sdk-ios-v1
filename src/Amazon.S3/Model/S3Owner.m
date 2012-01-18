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

#import "S3Owner.h"

@implementation S3Owner

@synthesize ID;
@synthesize displayName;

-(id)initWithID:(NSString *)theID withDisplayName:(NSString *)theDisplayName
{
    self = [super init];
    if (self) {
        self.ID          = theID;
        self.displayName = theDisplayName;
    }
    return self;
}

+(id)ownerWithID:(NSString *)theID withDisplayName:(NSString *)theDisplayName
{
    return [[[S3Owner alloc] initWithID:theID withDisplayName:theDisplayName] autorelease];
}

-(void)dealloc
{
    [ID release];
    [displayName release];

    [super dealloc];
}

@end
