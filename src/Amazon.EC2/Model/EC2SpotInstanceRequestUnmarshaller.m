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

#import "EC2SpotInstanceRequestUnmarshaller.h"

@implementation EC2SpotInstanceRequestUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"fault"]) {
        EC2SpotInstanceStateFaultUnmarshaller *unmarshaller = [[[EC2SpotInstanceStateFaultUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setFault:)] autorelease];
        unmarshaller.endElementTagName = @"fault";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"launchSpecification"]) {
        EC2LaunchSpecificationUnmarshaller *unmarshaller = [[[EC2LaunchSpecificationUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setLaunchSpecification:)] autorelease];
        unmarshaller.endElementTagName = @"launchSpecification";
        [parser setDelegate:unmarshaller];
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

    if ([elementName isEqualToString:@"spotInstanceRequestId"]) {
        self.response.spotInstanceRequestId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"spotPrice"]) {
        self.response.spotPrice = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"type"]) {
        self.response.type = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"state"]) {
        self.response.state = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"validFrom"]) {
        self.response.validFrom = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"validUntil"]) {
        self.response.validUntil = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"launchGroup"]) {
        self.response.launchGroup = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"availabilityZoneGroup"]) {
        self.response.availabilityZoneGroup = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"instanceId"]) {
        self.response.instanceId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"createTime"]) {
        self.response.createTime = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"productDescription"]) {
        self.response.productDescription = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"launchedAvailabilityZone"]) {
        self.response.launchedAvailabilityZone = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"spotInstanceRequest"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2SpotInstanceRequest *)response
{
    if (nil == response) {
        response = [[EC2SpotInstanceRequest alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
