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

#import "S3GetBucketWebsiteConfigurationResultUnmarshaller.h"

@implementation S3GetBucketWebsiteConfigurationResultUnmarshaller

@synthesize configuration;

#pragma mark - NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Suffix"])
    {
        self.configuration.indexDocumentSuffix = self.currentText;
    }
    else if ([elementName isEqualToString:@"Key"])
    {
        self.configuration.errorDocument = self.currentText;
    }
}

#pragma mark - Unmarshalled object property

-(BucketWebsiteConfiguration *)configuration
{
    if (nil == configuration)
    {
        configuration = [[BucketWebsiteConfiguration alloc] init];
    }
    return configuration;
}

#pragma mark -

-(void)dealloc
{
    [configuration release];

    [super dealloc];
}

@end
