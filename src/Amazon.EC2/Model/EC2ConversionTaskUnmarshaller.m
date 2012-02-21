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

#import "EC2ConversionTaskUnmarshaller.h"

@implementation EC2ConversionTaskUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"importInstance"]) {
        EC2ImportInstanceTaskDetailsUnmarshaller *unmarshaller = [[[EC2ImportInstanceTaskDetailsUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setImportInstance:)] autorelease];
        unmarshaller.endElementTagName = @"importInstance";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"importVolume"]) {
        EC2ImportVolumeTaskDetailsUnmarshaller *unmarshaller = [[[EC2ImportVolumeTaskDetailsUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setImportVolume:)] autorelease];
        unmarshaller.endElementTagName = @"importVolume";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"tagSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.tags withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"tagSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2TagUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)] autorelease]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([[elementName lowercaseString] isEqualToString:@"requestid"]) {
        if (parentObject != nil && [parentObject respondsToSelector:@selector(setRequestId:)]) {
            [parentObject performSelector:@selector(setRequestId:) withObject:self.currentText];
        }
    }

    if ([elementName isEqualToString:@"conversionTaskId"]) {
        self.response.conversionTaskId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"expirationTime"]) {
        self.response.expirationTime = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"state"]) {
        self.response.state = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"statusMessage"]) {
        self.response.statusMessage = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"conversionTask"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2ConversionTask *)response
{
    if (nil == response) {
        response = [[EC2ConversionTask alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
