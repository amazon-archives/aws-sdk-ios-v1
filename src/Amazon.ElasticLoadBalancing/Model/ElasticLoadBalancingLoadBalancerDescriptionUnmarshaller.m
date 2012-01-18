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

#import "ElasticLoadBalancingLoadBalancerDescriptionUnmarshaller.h"

@implementation ElasticLoadBalancingLoadBalancerDescriptionUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"AvailabilityZones"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.availabilityZones withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"AvailabilityZones";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"Subnets"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.subnets withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"Subnets";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"SecurityGroups"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.securityGroups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"SecurityGroups";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"ListenerDescriptions"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.listenerDescriptions withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"ListenerDescriptions";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [ElasticLoadBalancingListenerDescriptionUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"Policies"]) {
        ElasticLoadBalancingPoliciesUnmarshaller *unmarshaller = [[[ElasticLoadBalancingPoliciesUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setPolicies:)] autorelease];
        unmarshaller.endElementTagName = @"Policies";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"BackendServerDescriptions"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.backendServerDescriptions withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"BackendServerDescriptions";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [ElasticLoadBalancingBackendServerDescriptionUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"Instances"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.instances withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"Instances";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [ElasticLoadBalancingInstanceUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"HealthCheck"]) {
        ElasticLoadBalancingHealthCheckUnmarshaller *unmarshaller = [[[ElasticLoadBalancingHealthCheckUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setHealthCheck:)] autorelease];
        unmarshaller.endElementTagName = @"HealthCheck";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"SourceSecurityGroup"]) {
        ElasticLoadBalancingSourceSecurityGroupUnmarshaller *unmarshaller = [[[ElasticLoadBalancingSourceSecurityGroupUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setSourceSecurityGroup:)] autorelease];
        unmarshaller.endElementTagName = @"SourceSecurityGroup";
        [parser setDelegate:unmarshaller];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)] autorelease]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([elementName isEqualToString:@"LoadBalancerName"]) {
        self.response.loadBalancerName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"DNSName"]) {
        self.response.dNSName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"CanonicalHostedZoneName"]) {
        self.response.canonicalHostedZoneName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"CanonicalHostedZoneNameID"]) {
        self.response.canonicalHostedZoneNameID = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"VPCId"]) {
        self.response.vPCId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"CreatedTime"]) {
        self.response.createdTime = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"LoadBalancerDescription"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(ElasticLoadBalancingLoadBalancerDescription *)response
{
    if (nil == response) {
        response = [[ElasticLoadBalancingLoadBalancerDescription alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
