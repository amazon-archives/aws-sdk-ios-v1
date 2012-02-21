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

#import "BucketWebsiteConfiguration.h"

@implementation BucketWebsiteConfiguration

@synthesize indexDocumentSuffix, errorDocument;

-(id)initWithIndexDocumentSuffix:(NSString *)theIndexDocumentSuffix withErrorDocument:(NSString *)theErrorDocument
{
    self = [super init];
    if (self)
    {
        self.indexDocumentSuffix = theIndexDocumentSuffix;
        self.errorDocument       = theErrorDocument;
    }

    return self;
}

-(id)initWithIndexDocumentSuffix:(NSString *)theIndexDocumentSuffix
{
    return [self initWithIndexDocumentSuffix:theIndexDocumentSuffix withErrorDocument:nil];
}

+(id)configurationWithIndexDocumentSuffix:(NSString *)theIndexDocumentSuffix withErrorDocument:(NSString *)theErrorDocument
{
    return [[[BucketWebsiteConfiguration alloc] initWithIndexDocumentSuffix:theIndexDocumentSuffix withErrorDocument:theErrorDocument] autorelease];
}

+(id)configurationWithIndexDocumentSuffix:(NSString *)theIndexDocumentSuffix
{
    return [[[BucketWebsiteConfiguration alloc] initWithIndexDocumentSuffix:theIndexDocumentSuffix] autorelease];
}

-(NSString *)toXml
{
    NSString *innerXml = [NSString stringWithFormat:@"<IndexDocument><Suffix>%@</Suffix></IndexDocument>", self.indexDocumentSuffix];

    if (self.errorDocument != nil)
    {
        innerXml = [innerXml stringByAppendingFormat:@"<ErrorDocument><Key>%@</Key></ErrorDocument>", self.errorDocument];
    }

    return [NSString stringWithFormat:@"<WebsiteConfiguration xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">%@</WebsiteConfiguration>", innerXml];
}

@end
