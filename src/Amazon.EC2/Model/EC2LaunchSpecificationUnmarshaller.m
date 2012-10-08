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

#import "EC2LaunchSpecificationUnmarshaller.h"

@implementation EC2LaunchSpecificationUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"groupSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.securityGroups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"groupSet";
        listUnmarshaller.entryElementName   = @"groupName";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"monitoring"]) {
        AmazonBoolValueUnmarshaller *unmarshaller = [[[AmazonBoolValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setMonitoringEnabled:)] autorelease];
        unmarshaller.endElementTagName   = @"monitoring";
        unmarshaller.internalElementName = @"enabled";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"groupSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.securityGroups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"groupSet";
        listUnmarshaller.entryElementName   = @"groupName";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"groupSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.allSecurityGroups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"groupSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2GroupIdentifierUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"placement"]) {
        EC2SpotPlacementUnmarshaller *unmarshaller = [[[EC2SpotPlacementUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setPlacement:)] autorelease];
        unmarshaller.endElementTagName = @"placement";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"blockDeviceMapping"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.blockDeviceMappings withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"blockDeviceMapping";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2BlockDeviceMappingUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"networkInterfaceSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.networkInterfaces withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"networkInterfaceSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2InstanceNetworkInterfaceSpecificationUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"iamInstanceProfile"]) {
        EC2IamInstanceProfileSpecificationUnmarshaller *unmarshaller = [[[EC2IamInstanceProfileSpecificationUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setIamInstanceProfile:)] autorelease];
        unmarshaller.endElementTagName = @"iamInstanceProfile";
        [parser setDelegate:unmarshaller];
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

    if ([elementName isEqualToString:@"keyName"]) {
        self.response.keyName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"groupSet/item/groupName"]) {
        [self.response.securityGroups addObject:self.currentText];
    }

    if ([elementName isEqualToString:@"userData"]) {
        self.response.userData = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"addressingType"]) {
        self.response.addressingType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"instanceType"]) {
        self.response.instanceType = self.currentText;
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

    if ([elementName isEqualToString:@"subnetId"]) {
        self.response.subnetId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"ebsOptimized"]) {
        self.response.ebsOptimized = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"launchSpecification"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2LaunchSpecification *)response
{
    if (nil == response) {
        response = [[EC2LaunchSpecification alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
