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

#import "S3ListVersionsResultUnmarshaller.h"

@implementation S3ListVersionsResultUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];

    if ([elementName isEqualToString:@"Version"]) {
        [parser setDelegate:[[[S3VersionSummaryUnmarshaller alloc] initWithCaller:self withParentObject:self.listVersionsResult.versionSummaries withSetter:@selector(addObject:)] autorelease]];
    }

    if ([elementName isEqualToString:@"DeleteMarker"]) {
        [parser setDelegate:[[[S3VersionSummaryUnmarshaller alloc] initWithCaller:self withParentObject:self.listVersionsResult withSetter:@selector(addDeleteMarker:)] autorelease]];
    }

    if ([elementName isEqualToString:@"CommonPrefixes"]) {
        [parser setDelegate:[[[S3CommonPrefixesUnmarshaller alloc] initWithCaller:self withParentObject:self.listVersionsResult.commonPrefixes withSetter:@selector(addObjectsFromArray:)] autorelease]];
    }
}


-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Name"]) {
        self.listVersionsResult.name = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Prefix"]) {
        self.listVersionsResult.prefix = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"KeyMarker"]) {
        self.listVersionsResult.keyMarker = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"NextKeyMarker"]) {
        self.listVersionsResult.nextKeyMarker = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"VersionIdMarker"]) {
        self.listVersionsResult.versionIdMarker = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"NextVersionIdMarker"]) {
        self.listVersionsResult.nextVersionIdMarker = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Delimiter"]) {
        self.listVersionsResult.delimiter = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"IsTruncated"]) {
        self.listVersionsResult.isTruncated = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"MaxKeys"]) {
        self.listVersionsResult.maxKeys = [self.currentText integerValue];
        return;
    }

    if ([elementName isEqualToString:@"ListVersionsResult"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.listVersionsResult];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3ListVersionsResult *)listVersionsResult
{
    if (nil == listVersionsResult)
    {
        listVersionsResult = [[S3ListVersionsResult alloc] init];
    }
    return listVersionsResult;
}

-(void)dealloc
{
    [listVersionsResult release];
    [super dealloc];
}

@end
