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

#import "S3ListMultipartUploadsResultUnmarshaller.h"

@implementation S3ListMultipartUploadsResultUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];

    if ([elementName isEqualToString:@"Upload"]) {
        [parser setDelegate:[[[S3MultipartUploadUnmarshaller alloc] initWithCaller:self withParentObject:self.listMultipartUploadsResult.uploads withSetter:@selector(addObject:)] autorelease]];
    }
    if ([elementName isEqualToString:@"CommonPrefixes"]) {
        [parser setDelegate:[[[S3CommonPrefixesUnmarshaller alloc] initWithCaller:self withParentObject:self.listMultipartUploadsResult.commonPrefixes withSetter:@selector(addObjectsFromArray:)] autorelease]];
    }
}

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Bucket"]) {
        self.listMultipartUploadsResult.bucket = self.currentText;
    }
    if ([elementName isEqualToString:@"KeyMarker"]) {
        self.listMultipartUploadsResult.keyMarker = self.currentText;
    }
    if ([elementName isEqualToString:@"UploadIdMarker"]) {
        self.listMultipartUploadsResult.uploadIdMarker = self.currentText;
    }
    if ([elementName isEqualToString:@"NextKeyMarker"]) {
        self.listMultipartUploadsResult.nextKeyMarker = self.currentText;
    }
    if ([elementName isEqualToString:@"NextUploadIdMarker"]) {
        self.listMultipartUploadsResult.nextUploadIdMarker = self.currentText;
    }
    if ([elementName isEqualToString:@"MaxUploads"]) {
        self.listMultipartUploadsResult.maxUploads = [self.currentText integerValue];
    }
    if ([elementName isEqualToString:@"IsTruncated"]) {
        self.listMultipartUploadsResult.isTruncated = [self.currentText boolValue];
    }
    if ([elementName isEqualToString:@"Delimiter"]) {
        self.listMultipartUploadsResult.delimiter = self.currentText;
    }
    if ([elementName isEqualToString:@"Prefix"]) {
        self.listMultipartUploadsResult.prefix = self.currentText;
    }
    if ([elementName isEqualToString:@"ListMultipartUploadsResult"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.listMultipartUploadsResult];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3ListMultipartUploadsResult *)listMultipartUploadsResult
{
    if (nil == listMultipartUploadsResult) {
        listMultipartUploadsResult = [[S3ListMultipartUploadsResult alloc] init];
    }
    return listMultipartUploadsResult;
}

-(void)dealloc
{
    [listMultipartUploadsResult release];

    [super dealloc];
}


@end
