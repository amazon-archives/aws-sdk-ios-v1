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

#import "S3KeyVersion.h"

@implementation S3KeyVersion

@synthesize key, version;

-(id)initWithKey:(NSString *)theKey withVersion:(NSString *)theVersion
{
    self = [super init];
    if (self)
    {
        self.key     = theKey;
        self.version = theVersion;
    }

    return self;
}

-(id)initWithKey:(NSString *)theKey
{
    return [self initWithKey:theKey withVersion:nil];
}

+(id)keyVersionWithKey:(NSString *)theKey withVersion:(NSString *)theVersion
{
    return [[[S3KeyVersion alloc] initWithKey:theKey withVersion:theVersion] autorelease];
}

+(id)keyVersionWithKey:(NSString *)theKey
{
    return [[[S3KeyVersion alloc] initWithKey:theKey] autorelease];
}

-(NSString *)toXml
{
    NSString *innerXml = [NSString stringWithFormat:@"<Key>%@</Key>", self.key];

    if (self.version != nil)
    {
        innerXml = [NSString stringWithFormat:@"%@<VersionId>%@</VersionId>", innerXml, self.version];
    }

    return [NSString stringWithFormat:@"<Object>%@</Object>", innerXml];
}

-(void)dealloc
{
    [key release];
    [version release];

    [super dealloc];
}

@end
