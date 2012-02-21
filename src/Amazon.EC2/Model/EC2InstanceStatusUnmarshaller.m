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

#import "EC2InstanceStatusUnmarshaller.h"

@implementation EC2InstanceStatusUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"eventsSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.events withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"eventsSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2InstanceStatusEventUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"instanceState"]) {
        EC2InstanceStateUnmarshaller *unmarshaller = [[[EC2InstanceStateUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setInstanceState:)] autorelease];
        unmarshaller.endElementTagName = @"instanceState";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"systemStatus"]) {
        EC2InstanceStatusSummaryUnmarshaller *unmarshaller = [[[EC2InstanceStatusSummaryUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setSystemStatus:)] autorelease];
        unmarshaller.endElementTagName = @"systemStatus";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"instanceStatus"]) {
        EC2InstanceStatusSummaryUnmarshaller *unmarshaller = [[[EC2InstanceStatusSummaryUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setInstanceStatus:)] autorelease];
        unmarshaller.endElementTagName = @"instanceStatus";
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

    if ([elementName isEqualToString:@"instanceId"]) {
        self.response.instanceId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"availabilityZone"]) {
        self.response.availabilityZone = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"instanceStatus"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2InstanceStatus *)response
{
    if (nil == response) {
        response = [[EC2InstanceStatus alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
