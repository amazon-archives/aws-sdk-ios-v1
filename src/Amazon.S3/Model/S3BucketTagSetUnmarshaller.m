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

#import "S3BucketTagSetUnmarshaller.h"
#import "AmazonDictionaryUnmarshaller.h"

@implementation S3BucketTagSetUnmarshaller

@synthesize tagset;

#pragma mark - NSXMLParserDelegate implementation

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];
    
    
    if ([elementName isEqualToString:@"Tag"]) {
        AmazonDictionaryUnmarshaller *dictionaryUnmarshaller = [[[AmazonDictionaryUnmarshaller alloc] initWithCaller:self withParentObject:self.tagset.tags withSetter:@selector(addEntriesFromDictionary:)] autorelease];
        dictionaryUnmarshaller.keyXpathElement      = @"Key";
        dictionaryUnmarshaller.valueXpathElement    = @"Value";
        dictionaryUnmarshaller.dictionaryEndElement = @"Tag";
        [parser setDelegate:dictionaryUnmarshaller];
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
    
    if ([elementName isEqualToString:@"TagSet"])
    {
        if (caller != nil) {
            [parser setDelegate:caller];
        }
        
        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.tagset];
        }
        
        return;
    }
}

#pragma mark - Unmarshalled object property

-(S3BucketTagSet *)tagset
{
    if (tagset == nil)
    {
        tagset = [[S3BucketTagSet alloc] init];
        tagset.tags = [[[NSMutableDictionary alloc] init] autorelease];
    }
    
    return tagset;
}

#pragma mark -

-(void)dealloc
{
    [tagset release];
    
    [super dealloc];
}

@end
