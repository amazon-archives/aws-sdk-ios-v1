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

#import "S3GrantUnmarshaller.h"

@implementation S3GrantUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"ID"]) {
        self.grant.grantee.ID = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"DisplayName"]) {
        self.grant.grantee.displayName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"EmailAddress"]) {
        self.grant.grantee.emailAddress = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"URI"]) {
        self.grant.grantee.URI = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Permission"]) {
        self.grant.permission = [S3Permission permissionWithString:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"Grant"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.grant];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3Grant *)grant
{
    if (nil == grant)
    {
        grant = [[S3Grant alloc] init];

        [grant setGrantee:[S3Grantee granteeWithID:nil withDisplayName:nil]];
    }
    return grant;
}

-(void)dealloc
{
    [grant release];
    [super dealloc];
}

@end
