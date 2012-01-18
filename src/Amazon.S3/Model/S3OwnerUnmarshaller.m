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

#import "S3OwnerUnmarshaller.h"

@implementation S3OwnerUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"ID"]) {
        self.owner.ID = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"DisplayName"]) {
        self.owner.displayName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Owner"] || (self.endElementTagName != nil && [elementName isEqualToString:self.endElementTagName])) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.owner];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3Owner *)owner
{
    if (nil == owner)
    {
        owner = [[S3Owner alloc] init];
    }
    return owner;
}

-(void)dealloc
{
    [owner release];
    [super dealloc];
}

@end

