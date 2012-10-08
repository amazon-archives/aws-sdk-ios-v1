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

#import "S3CORSRuleUnmarshaller.h"
#import "AmazonDictionaryUnmarshaller.h"

@implementation S3CORSRuleUnmarshaller

#pragma mark - NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
    
    if ([elementName isEqualToString:@"CORSRule"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }
        
        self.rule.allowedHeaders = allowedHeaders;
        self.rule.allowedMethods = allowedMethods;
        self.rule.allowedOrigins = allowedOrigins;
        self.rule.exposeHeaders = exposeHeaders;
        
        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.rule];
        }
        
        return;
    }
    
    if ([elementName isEqualToString:@"ID"]) {
        self.rule.ruleId = self.currentText;
    } else if ([elementName isEqualToString:@"AllowedMethod"]) {
        if (allowedMethods == nil) {
            allowedMethods = [[NSMutableArray alloc] initWithCapacity:2];
        }
        [allowedMethods addObject:self.currentText];
    } else if ([elementName isEqualToString:@"AllowedOrigin"]) {
        if (allowedOrigins == nil) {
            allowedOrigins = [[NSMutableArray alloc] initWithCapacity:2];
        }
        [allowedOrigins addObject:self.currentText];
    } else if ([elementName isEqualToString:@"ExposeHeader"]) {
        if (exposeHeaders == nil) {
            exposeHeaders = [[NSMutableArray alloc] initWithCapacity:2];
        }
        [exposeHeaders addObject:self.currentText];
    } else if ([elementName isEqualToString:@"AllowedHeader"]) {
        if (allowedHeaders == nil) {
            allowedHeaders = [[NSMutableArray alloc] initWithCapacity:2];
        }
        [allowedHeaders addObject:self.currentText];
    } else if ([elementName isEqualToString:@"MaxAgeSeconds"]) {
        self.rule.maxAgeSeconds = [self.currentText integerValue];
    }
}

#pragma mark - Unmarshalled object property

-(S3CORSRule *)rule
{
    if (_rule == nil)
    {
        _rule = [[S3CORSRule alloc] init];
    }
    
    return _rule;
}

#pragma mark -

-(void)dealloc
{
    [_rule release];
    [allowedOrigins release];
    [allowedHeaders release];
    [allowedMethods release];
    [exposeHeaders release];
    [super dealloc];
}

@end
