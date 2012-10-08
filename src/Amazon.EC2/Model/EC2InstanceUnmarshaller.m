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

#import "EC2InstanceUnmarshaller.h"

@implementation EC2InstanceUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"instanceState"]) {
        EC2InstanceStateUnmarshaller *unmarshaller = [[[EC2InstanceStateUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setState:)] autorelease];
        unmarshaller.endElementTagName = @"instanceState";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"productCodes"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.productCodes withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"productCodes";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2ProductCodeUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"placement"]) {
        EC2PlacementUnmarshaller *unmarshaller = [[[EC2PlacementUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setPlacement:)] autorelease];
        unmarshaller.endElementTagName = @"placement";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"monitoring"]) {
        EC2MonitoringUnmarshaller *unmarshaller = [[[EC2MonitoringUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setMonitoring:)] autorelease];
        unmarshaller.endElementTagName = @"monitoring";
        [parser setDelegate:unmarshaller];
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
        listUnmarshaller.delegateClass      = [EC2InstanceBlockDeviceMappingUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"license"]) {
        EC2InstanceLicenseUnmarshaller *unmarshaller = [[[EC2InstanceLicenseUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setLicense:)] autorelease];
        unmarshaller.endElementTagName = @"license";
        [parser setDelegate:unmarshaller];
    }

    if ([elementName isEqualToString:@"tagSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.tags withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"tagSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2TagUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"groupSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.securityGroups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"groupSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2GroupIdentifierUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"networkInterfaceSet"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.networkInterfaces withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"networkInterfaceSet";
        listUnmarshaller.entryElementName   = @"item";
        listUnmarshaller.delegateClass      = [EC2InstanceNetworkInterfaceUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"iamInstanceProfile"]) {
        EC2IamInstanceProfileUnmarshaller *unmarshaller = [[[EC2IamInstanceProfileUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setIamInstanceProfile:)] autorelease];
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

    if ([elementName isEqualToString:@"instanceId"]) {
        self.response.instanceId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"imageId"]) {
        self.response.imageId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"privateDnsName"]) {
        self.response.privateDnsName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"dnsName"]) {
        self.response.publicDnsName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"reason"]) {
        self.response.stateTransitionReason = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"keyName"]) {
        self.response.keyName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"amiLaunchIndex"]) {
        self.response.amiLaunchIndex = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"instanceType"]) {
        self.response.instanceType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"launchTime"]) {
        self.response.launchTime = [AmazonSDKUtil convertStringToDate:self.currentText];
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

    if ([elementName isEqualToString:@"subnetId"]) {
        self.response.subnetId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"vpcId"]) {
        self.response.vpcId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"privateIpAddress"]) {
        self.response.privateIpAddress = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"ipAddress"]) {
        self.response.publicIpAddress = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"architecture"]) {
        self.response.architecture = self.currentText;
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

    if ([elementName isEqualToString:@"instanceLifecycle"]) {
        self.response.instanceLifecycle = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"spotInstanceRequestId"]) {
        self.response.spotInstanceRequestId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"clientToken"]) {
        self.response.clientToken = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"sourceDestCheck"]) {
        self.response.sourceDestCheck = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"hypervisor"]) {
        self.response.hypervisor = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"ebsOptimized"]) {
        self.response.ebsOptimized = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"instance"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(EC2Instance *)response
{
    if (nil == response) {
        response = [[EC2Instance alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
