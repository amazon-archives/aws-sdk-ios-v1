/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "AmazonSDKUtil.h"


@interface AmazonServiceRequest : NSObject {
	NSMutableURLRequest *urlRequest;	
	NSMutableDictionary *parameters;
	NSString *httpMethod;
	NSString *endpoint;
}

/** The urlRequest object which represents this request. 
 * Use configureURLRequest to make sure all fields have 
 */
@property (nonatomic, retain) NSMutableURLRequest* urlRequest;

/** The HTTP Method (GET, PUT, POST, DELETE) used for the request. */
@property (nonatomic, retain) NSString* httpMethod;

/** The URL for the resource.
 * This property is read-only.
 */
@property (nonatomic, readonly) NSURL* url;

@property (nonatomic, retain) NSMutableDictionary* parameters;
@property (nonatomic, retain) NSString* endpoint;

-(NSMutableURLRequest *)configureURLRequest;

-(NSString *)queryString;

-(void)setParameterValue:(NSString *)theValue forKey:(NSString *)theKey;


@end
