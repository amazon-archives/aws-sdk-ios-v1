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
#import "EC2VolumeStatusItem.h"
#import "EC2ResponseUnmarshaller.h"
#import "../AmazonValueUnmarshaller.h"
#import "../AmazonBoolValueUnmarshaller.h"
#import "EC2VolumeStatusInfoUnmarshaller.h"
#import "../AmazonListUnmarshaller.h"
#import "EC2VolumeStatusEventUnmarshaller.h"
#import "../AmazonListUnmarshaller.h"
#import "EC2VolumeStatusActionUnmarshaller.h"


/**
 * Volume Status Item Unmarshaller
 */
@interface EC2VolumeStatusItemUnmarshaller:EC2ResponseUnmarshaller {
    EC2VolumeStatusItem *response;
}


@property (nonatomic, readonly) EC2VolumeStatusItem *response;


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;


@end
