/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import "EC2Instance.h"
#import "EC2ResponseUnmarshaller.h"
#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonValueUnmarshaller.h>
#import <AWSRuntime/AmazonBoolValueUnmarshaller.h>
#else
#import "../AmazonValueUnmarshaller.h"
#import "../AmazonBoolValueUnmarshaller.h"
#endif
#import "EC2InstanceStateUnmarshaller.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonListUnmarshaller.h>
#else
#import "../AmazonListUnmarshaller.h"
#endif
#import "EC2ProductCodeUnmarshaller.h"
#import "EC2PlacementUnmarshaller.h"
#import "EC2MonitoringUnmarshaller.h"
#import "EC2StateReasonUnmarshaller.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonListUnmarshaller.h>
#else
#import "../AmazonListUnmarshaller.h"
#endif
#import "EC2InstanceBlockDeviceMappingUnmarshaller.h"
#import "EC2InstanceLicenseUnmarshaller.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonListUnmarshaller.h>
#else
#import "../AmazonListUnmarshaller.h"
#endif
#import "EC2TagUnmarshaller.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonListUnmarshaller.h>
#else
#import "../AmazonListUnmarshaller.h"
#endif
#import "EC2GroupIdentifierUnmarshaller.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonListUnmarshaller.h>
#else
#import "../AmazonListUnmarshaller.h"
#endif
#import "EC2InstanceNetworkInterfaceUnmarshaller.h"
#import "EC2IamInstanceProfileUnmarshaller.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonSDKUtil.h>
#else
#import "../AmazonSDKUtil.h"
#endif


/**
 * Instance Unmarshaller
 */
@interface EC2InstanceUnmarshaller:EC2ResponseUnmarshaller {
    EC2Instance *response;
}


@property (nonatomic, readonly) EC2Instance *response;


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;


@end
