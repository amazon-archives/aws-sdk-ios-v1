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

#import "AmazonBoolValueUnmarshaller.h"

@implementation AmazonBoolValueUnmarshaller

@synthesize value;
@synthesize internalElementName;


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:internalElementName]) {
        self.value = [self.currentText boolValue];

        if (caller != nil) {
            [parser setDelegate:caller];
        }

        NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[parentObject methodSignatureForSelector:parentSetter]];
        [inv setSelector:parentSetter];
        [inv setTarget:parentObject];
        [inv setArgument:&value atIndex:2];
        [inv invoke];

        return;
    }
}

-(bool)value
{
    return value;
}

-(void)dealloc
{
    [internalElementName release];
    [super dealloc];
}

@end
