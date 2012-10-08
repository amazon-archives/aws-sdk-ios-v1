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

#import "EC2InstanceAttributeUnmarshaller.h"

@implementation EC2InstanceAttributeUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"instanceType"]) {
        AmazonValueUnmarshaller *unmarshaller = [[[AmazonValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setInstanceType:)] autorelease];
        unmarshaller.endElementTagName   = @"instanceType";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"kernel"]) {
        AmazonValueUnmarshaller *unmarshaller = [[[AmazonValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setKernelId:)] autorelease];
        unmarshaller.endElementTagName   = @"kernel";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"ramdisk"]) {
        AmazonValueUnmarshaller *unmarshaller = [[[AmazonValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setRamdiskId:)] autorelease];
        unmarshaller.endElementTagName   = @"ramdisk";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"userData"]) {
        AmazonValueUnmarshaller *unmarshaller = [[[AmazonValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setUserData:)] autorelease];
        unmarshaller.endElementTagName   = @"userData";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"disableApiTermination"]) {
        AmazonBoolValueUnmarshaller *unmarshaller = [[[AmazonBoolValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setDisableApiTermination:)] autorelease];
        unmarshaller.endElementTagName   = @"disableApiTermination";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"instanceInitiatedShutdownBehavior"]) {
        AmazonValueUnmarshaller *unmarshaller = [[[AmazonValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setInstanceInitiatedShutdownBehavior:)] autorelease];
        unmarshaller.endElementTagName   = @"instanceInitiatedShutdownBehavior";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"rootDeviceName"]) {
        AmazonValueUnmarshaller *unmarshaller = [[[AmazonValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setRootDeviceName:)] autorelease];
        unmarshaller.endElementTagName   = @"rootDeviceName";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"ebsOptimized"]) {
        AmazonBoolValueUnmarshaller *unmarshaller = [[[AmazonBoolValueUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setEbsOptimized:)] autorelease];
        unmarshaller.endElementTagName   = @"ebsOptimized";
        unmarshaller.internalElementName = @"value";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"blockDeviceMapping"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.blockDeviceMappings withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"blockDeviceMapping";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2InstanceBlockDeviceMappingUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"productCodes"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.productCodes withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"productCodes";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2ProductCodeUnmarshaller class];

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

    if ([elementName isEqualToString:@"instanceId"]) {
        self.response.instanceId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"instanceAttribute"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2InstanceAttribute *)response
{
    if (nil == response) {
        response = [[EC2InstanceAttribute alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
