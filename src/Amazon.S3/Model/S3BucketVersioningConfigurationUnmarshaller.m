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

#import "S3BucketVersioningConfigurationUnmarshaller.h"

@implementation S3BucketVersioningConfigurationUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Status"]) {
        self.versioningConfiguration.status = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"MfaDelete"]) {
        self.versioningConfiguration.isMfaDeleteEnabled = [self.currentText isEqualToString:@"Enabled"];
        return;
    }

    if ([elementName isEqualToString:@"VersioningConfiguration"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.versioningConfiguration];
        }

        return;
    }
}

#pragma mark Unmarshalled object property

-(S3BucketVersioningConfiguration *)versioningConfiguration
{
    if (nil == versioningConfiguration)
    {
        versioningConfiguration = [[S3BucketVersioningConfiguration alloc] init];
    }
    return versioningConfiguration;
}

-(void)dealloc
{
    [versioningConfiguration release];
    [super dealloc];
}

@end
