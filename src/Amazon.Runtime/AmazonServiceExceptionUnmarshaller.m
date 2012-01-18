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

#import "AmazonServiceExceptionUnmarshaller.h"


@implementation AmazonServiceExceptionUnmarshaller

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Code"]) {
        self.exception.errorCode = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Message"]) {
        self.exception.message = self.currentText;
        return;
    }

    if ([[elementName lowercaseString] isEqualToString:@"requestid"]) {
        self.exception.requestId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Response"] || [elementName isEqualToString:@"ErrorResponse"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.exception];
        }

        return;
    }

    // Capture extra fields for service-specific exceptions
    [self.exception.additionalFields setValue:self.currentText forKey:elementName];
}

-(AmazonServiceException *)exception;
{
    if (exception == nil) {
        exception = [[AmazonServiceException exceptionWithMessage:@""] retain];
    }

    return exception;
}

-(NSString *)serviceName
{
    return @"";
}

-(void)dealloc
{
    [exception release];
    [super dealloc];
}

@end
