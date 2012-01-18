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

#import "EC2InstanceStateChangeUnmarshaller.h"

@implementation EC2InstanceStateChangeUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"currentState"]) {
        EC2InstanceStateUnmarshaller *unmarshaller = [[[EC2InstanceStateUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setCurrentState:)] autorelease];
        unmarshaller.endElementTagName = @"currentState";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"previousState"]) {
        EC2InstanceStateUnmarshaller *unmarshaller = [[[EC2InstanceStateUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setPreviousState:)] autorelease];
        unmarshaller.endElementTagName = @"previousState";
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

    if ([elementName isEqualToString:@"instanceStateChange"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2InstanceStateChange *)response
{
    if (nil == response) {
        response = [[EC2InstanceStateChange alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
