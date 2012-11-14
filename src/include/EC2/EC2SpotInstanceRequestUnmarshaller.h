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

#import <Foundation/Foundation.h>
#import "EC2SpotInstanceRequest.h"
#import "EC2ResponseUnmarshaller.h"
#import "../AmazonValueUnmarshaller.h"
#import "../AmazonBoolValueUnmarshaller.h"
#import "EC2SpotInstanceStateFaultUnmarshaller.h"
#import "EC2SpotInstanceStatusUnmarshaller.h"
#import "EC2LaunchSpecificationUnmarshaller.h"
#import "../AmazonListUnmarshaller.h"
#import "EC2TagUnmarshaller.h"
#import "../AmazonSDKUtil.h"


/**
 * Spot Instance Request Unmarshaller
 */
@interface EC2SpotInstanceRequestUnmarshaller:EC2ResponseUnmarshaller {
    EC2SpotInstanceRequest *response;
}


@property (nonatomic, readonly) EC2SpotInstanceRequest *response;


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;


@end
