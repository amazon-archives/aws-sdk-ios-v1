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

#import "AmazonUnmarshallerXMLParserDelegate.h"

@implementation AmazonUnmarshallerXMLParserDelegate

@synthesize currentTag;
@synthesize endElementTagName;

//
// When we find a start tag, keep track of the current tag
// subclasses should really, really call this method if overridden
//
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict
{
    // reset the current text
    if (currentText != nil) {
        [currentText release];
        currentText = nil;
    }

    self.currentTag = elementName;
}

//
// Keep track of the current text. Subclasses should not override
//
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (nil == currentText)
    {
        currentText = [[NSMutableString alloc] initWithCapacity:50];
    }

    [currentText appendString:string];
}


-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    // We don't do anything with this right now.
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    // We don't do anything with this right now.
}

-(NSString *)currentText
{
    if (nil == currentText) {
        return @"";
    }

    return [NSString stringWithString:currentText];
}

//
// When parsing nested tags, control is handed to another delegate.
// When that delegate is done, it will
// - set the parser's delegate to the caller, returning control to it
// - assign the object it created to the parent field with [parent setter:object]
//
-(AmazonUnmarshallerXMLParserDelegate *) initWithCaller:(AmazonUnmarshallerXMLParserDelegate *)aCaller withParentObject:(id)parent withSetter:(SEL)setter
{
    caller            = aCaller;
    parentObject      = parent;
    parentSetter      = setter;
    endElementTagName = nil;
    return self;
}

-(AmazonUnmarshallerXMLParserDelegate *) initWithCaller:(AmazonUnmarshallerXMLParserDelegate *)aCaller withParentObject:(id)parent withSetter:(SEL)setter withAlias:(NSString *)alias
{
    caller            = aCaller;
    parentObject      = parent;
    parentSetter      = setter;
    endElementTagName = alias;
    return self;
}

-(void)dealloc
{
    [currentTag release];
    [currentText release];
    [super dealloc];
}

@end
