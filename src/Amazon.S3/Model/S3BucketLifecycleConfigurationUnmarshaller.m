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

#import "S3BucketLifecycleConfigurationUnmarshaller.h"
#import "S3BucketLifecycleConfigurationRuleUnmarshaller.h"

@implementation S3BucketLifecycleConfigurationUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
    
    if ([elementName isEqualToString:@"Rule"])
    {
        [parser setDelegate:[[[S3BucketLifecycleConfigurationRuleUnmarshaller alloc] initWithCaller:self withParentObject:[self configuration].rules withSetter:@selector(addObject:)] autorelease]];
    }
}

#pragma mark - Unmarshalled object property

-(S3BucketLifecycleConfiguration *)configuration
{
    if (nil == configuration)
    {
        configuration = [[S3BucketLifecycleConfiguration alloc] init];
        configuration.rules = [NSMutableArray arrayWithCapacity:1];
    }
    return configuration;
}

-(void)dealloc
{
    [configuration release];
    [super dealloc];
}

@end
