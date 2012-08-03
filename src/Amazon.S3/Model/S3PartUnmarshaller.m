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

#import "S3PartUnmarshaller.h"


@implementation S3PartUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"ETag"]) {
        self.part.etag = self.currentText;
    }
    if ([elementName isEqualToString:@"PartNumber"]) {
        self.part.partNumber = [self.currentText integerValue];
    }
    if ([elementName isEqualToString:@"Size"]) {
        self.part.size = [self.currentText longLongValue];
    }
    if ([elementName isEqualToString:@"LastModified"]) {
        self.part.lastModified = [NSDate dateWithISO8061Format:currentText];
    }

    if ([elementName isEqualToString:@"Part"] || (self.endElementTagName != nil && [elementName isEqualToString:self.endElementTagName])) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.part];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3Part *)part
{
    if (nil == part)
    {
        part = [[S3Part alloc] init];
    }
    return part;
}

-(void)dealloc
{
    [part release];
    [super dealloc];
}

@end
