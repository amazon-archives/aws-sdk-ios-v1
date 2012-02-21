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

#import "S3DeleteObjectsResultUnmarshaller.h"
#import "DeletedObject.h"
#import "DeleteError.h"
#import "S3DeletedObjectUnmarshaller.h"
#import "S3DeleteErrorUnmarshaller.h"

@implementation S3DeleteObjectsResultUnmarshaller

@synthesize deletedObjects, deleteErrors;

#pragma mark - NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];

    if ([elementName isEqualToString:@"Deleted"])
    {
        [parser setDelegate:[[[S3DeletedObjectUnmarshaller alloc] initWithCaller:self withParentObject:self.deletedObjects withSetter:@selector(addObject:)] autorelease]];
    }
    else if ([elementName isEqualToString:@"Error"])
    {
        [parser setDelegate:[[[S3DeleteErrorUnmarshaller alloc] initWithCaller:self withParentObject:self.deleteErrors withSetter:@selector(addObject:)] autorelease]];
    }
}

#pragma mark - Unmarshalled object property

-(NSMutableArray *)deletedObjects
{
    if (deletedObjects == nil)
    {
        deletedObjects = [[NSMutableArray alloc] init];
    }

    return deletedObjects;
}

-(NSMutableArray *)deleteErrors
{
    if (deleteErrors == nil)
    {
        deleteErrors = [[NSMutableArray alloc] init];
    }

    return deleteErrors;
}

#pragma mark -

-(void)dealloc
{
    [deletedObjects release];
    [deleteErrors release];

    [super dealloc];
}

@end
