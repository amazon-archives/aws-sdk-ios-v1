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

#import "AutoScalingLaunchConfigurationUnmarshaller.h"

@implementation AutoScalingLaunchConfigurationUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"SecurityGroups"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.securityGroups withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"SecurityGroups";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"BlockDeviceMappings"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.blockDeviceMappings withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"BlockDeviceMappings";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AutoScalingBlockDeviceMappingUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"InstanceMonitoring"]) {
        AutoScalingInstanceMonitoringUnmarshaller *unmarshaller = [[[AutoScalingInstanceMonitoringUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setInstanceMonitoring:)] autorelease];
        unmarshaller.endElementTagName = @"InstanceMonitoring";
        [parser setDelegate:unmarshaller];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)] autorelease]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([elementName isEqualToString:@"LaunchConfigurationName"]) {
        self.response.launchConfigurationName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"LaunchConfigurationARN"]) {
        self.response.launchConfigurationARN = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"ImageId"]) {
        self.response.imageId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"KeyName"]) {
        self.response.keyName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"UserData"]) {
        self.response.userData = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"InstanceType"]) {
        self.response.instanceType = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"KernelId"]) {
        self.response.kernelId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"RamdiskId"]) {
        self.response.ramdiskId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"SpotPrice"]) {
        self.response.spotPrice = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"IamInstanceProfile"]) {
        self.response.iamInstanceProfile = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"CreatedTime"]) {
        self.response.createdTime = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"LaunchConfiguration"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(AutoScalingLaunchConfiguration *)response
{
    if (nil == response) {
        response = [[AutoScalingLaunchConfiguration alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
