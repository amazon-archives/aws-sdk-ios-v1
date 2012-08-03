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

#import "S3ListPartsResultUnmarshaller.h"


@implementation S3ListPartsResultUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];

    if ([elementName isEqualToString:@"Part"]) {
        [parser setDelegate:[[[S3PartUnmarshaller alloc] initWithCaller:self withParentObject:self.listPartsResult.parts withSetter:@selector(addObject:)] autorelease]];
    }
    if ([elementName isEqualToString:@"Owner"]) {
        [parser setDelegate:[[[S3OwnerUnmarshaller alloc] initWithCaller:self withParentObject:self.listPartsResult withSetter:@selector(setOwner:)] autorelease]];
    }
    if ([elementName isEqualToString:@"Initator"]) {
        [parser setDelegate:[[[S3OwnerUnmarshaller alloc] initWithCaller:self withParentObject:self.listPartsResult withSetter:@selector(setInitiator:) withAlias:@"Iniatiator"] autorelease]];
    }
}

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Bucket"]) {
        self.listPartsResult.bucket = self.currentText;
    }
    if ([elementName isEqualToString:@"Key"]) {
        self.listPartsResult.key = self.currentText;
    }
    if ([elementName isEqualToString:@"UploadId"]) {
        self.listPartsResult.uploadId = self.currentText;
    }
    if ([elementName isEqualToString:@"StorageClass"]) {
        self.listPartsResult.storageClass = self.currentText;
    }
    if ([elementName isEqualToString:@"PartNumberMarker"]) {
        self.listPartsResult.partNumberMarker = [self.currentText integerValue];
    }
    if ([elementName isEqualToString:@"NextPartNumberMarker"]) {
        self.listPartsResult.nextPartNumberMarker = [self.currentText integerValue];
    }
    if ([elementName isEqualToString:@"MaxParts"]) {
        self.listPartsResult.maxParts = [self.currentText integerValue];
    }
    if ([elementName isEqualToString:@"IsTruncated"]) {
        self.listPartsResult.isTruncated = [self.currentText boolValue];
    }
    if ([elementName isEqualToString:@"ListPartsResult"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.listPartsResult];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3ListPartsResult *)listPartsResult
{
    if (nil == listPartsResult) {
        listPartsResult = [[S3ListPartsResult alloc] init];
    }
    return listPartsResult;
}

-(void)dealloc
{
    [listPartsResult release];

    [super dealloc];
}

@end
