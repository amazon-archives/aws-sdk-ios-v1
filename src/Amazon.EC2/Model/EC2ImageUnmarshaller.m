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

#import "EC2ImageUnmarshaller.h"

@implementation EC2ImageUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"productCodes"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.productCodes withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"productCodes";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2ProductCodeUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"stateReason"]) {
        EC2StateReasonUnmarshaller *unmarshaller = [[[EC2StateReasonUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setStateReason:)] autorelease];
        unmarshaller.endElementTagName = @"stateReason";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"blockDeviceMapping"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.blockDeviceMappings withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"blockDeviceMapping";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2BlockDeviceMappingUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"tagSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.tags withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"tagSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2TagUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)] autorelease]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([[elementName lowercaseString] isEqualToString:@"requestid"]) {
        if (parentObject != nil && [parentObject respondsToSelector:@selector(setRequestId:)]) {
            [parentObject performSelector:@selector(setRequestId:) withObject:self.currentText];
        }
    }

    if ([elementName isEqualToString:@"imageId"]) {
        self.response.imageId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"imageLocation"]) {
        self.response.imageLocation = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"imageState"]) {
        self.response.state = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"imageOwnerId"]) {
        self.response.ownerId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"isPublic"]) {
        self.response.publicValue = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"architecture"]) {
        self.response.architecture = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"imageType"]) {
        self.response.imageType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"kernelId"]) {
        self.response.kernelId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"ramdiskId"]) {
        self.response.ramdiskId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"platform"]) {
        self.response.platform = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"imageOwnerAlias"]) {
        self.response.imageOwnerAlias = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"name"]) {
        self.response.name = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"description"]) {
        self.response.descriptionValue = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"rootDeviceType"]) {
        self.response.rootDeviceType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"rootDeviceName"]) {
        self.response.rootDeviceName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"virtualizationType"]) {
        self.response.virtualizationType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"hypervisor"]) {
        self.response.hypervisor = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"image"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2Image *)response
{
    if (nil == response) {
        response = [[EC2Image alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
