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

#import "AmazonListUnmarshaller.h"

@implementation AmazonListUnmarshaller

@synthesize list, delegateClass, entryElementName, endListElementName;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];

    if ([elementName isEqualToString:entryElementName]) {
        id delegate = [[[delegateClass alloc] initWithCaller:self withParentObject:self.list withSetter:@selector(addObject:)] autorelease];
        [delegate setEndElementTagName:entryElementName];

        [parser setDelegate:delegate];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:endListElementName]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.list];
        }

        return;
    }
}

-(NSMutableArray *)list
{
    if (nil == list) {
        list = [[NSMutableArray alloc] init];
    }
    return list;
}

-(void)dealloc
{
    [list release];
    [entryElementName release];
    [endListElementName release];
    [delegateClass release];
    [super dealloc];
}

@end
