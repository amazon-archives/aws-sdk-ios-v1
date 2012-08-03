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

#import "EC2InstanceNetworkInterfaceSpecificationUnmarshaller.h"

@implementation EC2InstanceNetworkInterfaceSpecificationUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"groupSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.groups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"groupSet";
        listUnmarshaller.entryElementName   = @"groupId";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"privateIpAddressesSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.privateIpAddresses withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"privateIpAddressesSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2PrivateIpAddressSpecificationUnmarshaller class];

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

    if ([elementName isEqualToString:@"networkInterfaceId"]) {
        self.response.networkInterfaceId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"deviceIndex"]) {
        self.response.deviceIndex = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"subnetId"]) {
        self.response.subnetId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"description"]) {
        self.response.descriptionValue = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"privateIpAddress"]) {
        self.response.privateIpAddress = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"deleteOnTermination"]) {
        self.response.deleteOnTermination = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"secondaryPrivateIpAddressCount"]) {
        self.response.secondaryPrivateIpAddressCount = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"instanceNetworkInterfaceSpecification"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2InstanceNetworkInterfaceSpecification *)response
{
    if (nil == response) {
        response = [[EC2InstanceNetworkInterfaceSpecification alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
