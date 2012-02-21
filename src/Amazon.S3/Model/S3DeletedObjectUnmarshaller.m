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

#import "S3DeletedObjectUnmarshaller.h"

@implementation S3DeletedObjectUnmarshaller

@synthesize deletedObject;

#pragma mark - NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Key"])
    {
        self.deletedObject.key = self.currentText;
    }
    else if ([elementName isEqualToString:@"VersionId"])
    {
        self.deletedObject.versionId = self.currentText;
    }
    else if ([elementName isEqualToString:@"DeleteMarker"])
    {
        self.deletedObject.deleteMarker = [self.currentText isEqualToString:@"true"];
    }
    else if ([elementName isEqualToString:@"DeleteMarkerVersionId"])
    {
        self.deletedObject.deleteMarkerVersionId = self.currentText;
    }
    else if ([elementName isEqualToString:@"Deleted"])
    {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.deletedObject];
        }

        return;
    }
}

#pragma mark - Unmarshalled object property

-(DeletedObject *)deletedObject
{
    if (deletedObject == nil)
    {
        deletedObject = [[DeletedObject alloc] init];
    }

    return deletedObject;
}

#pragma mark -

-(void)dealloc
{
    [deletedObject release];

    [super dealloc];
}

@end
