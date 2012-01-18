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

#import "S3MultipartUploadUnmarshaller.h"


@implementation S3MultipartUploadUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];

    if ([elementName isEqualToString:@"Owner"]) {
        [parser setDelegate:[[[S3OwnerUnmarshaller alloc] initWithCaller:self withParentObject:self.multipartUpload withSetter:@selector(setOwner:)] autorelease]];
    }

    if ([elementName isEqualToString:@"Initiator"]) {
        [parser setDelegate:[[[S3OwnerUnmarshaller alloc] initWithCaller:self withParentObject:self.multipartUpload withSetter:@selector(setInitiator:) withAlias:@"Iniatiator"] autorelease]];
    }
}

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Key"]) {
        self.multipartUpload.key = self.currentText;
    }
    if ([elementName isEqualToString:@"Bucket"]) {
        self.multipartUpload.bucket = self.currentText;
    }
    if ([elementName isEqualToString:@"UploadId"]) {
        self.multipartUpload.uploadId = self.currentText;
    }
    if ([elementName isEqualToString:@"StorageClass"]) {
        self.multipartUpload.storageClass = self.currentText;
    }
    if ([elementName isEqualToString:@"Initiated"]) {
        self.multipartUpload.initiated = [NSDate dateWithISO8061Format:currentText];
    }

    if ([elementName isEqualToString:@"Upload"] || (self.endElementTagName != nil && [elementName isEqualToString:self.endElementTagName])) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.multipartUpload];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3MultipartUpload *)multipartUpload
{
    if (nil == multipartUpload)
    {
        multipartUpload = [[S3MultipartUpload alloc] init];
    }
    return multipartUpload;
}

-(void)dealloc
{
    [multipartUpload release];
    [super dealloc];
}

@end
