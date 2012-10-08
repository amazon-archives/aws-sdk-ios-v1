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

/**
 * Container for rules of cross origin configuration.
 */
@interface S3CORSRule:NSObject {
}

/** The Id of this rule. */
@property (nonatomic, retain) NSString *ruleId;

/** The list of allowed methods (GET, PUT, DELETE, HEAD) */
@property (nonatomic, retain) NSArray *allowedMethods;

/** The list of allowed origins */
@property (nonatomic, retain) NSArray *allowedOrigins;

/** Maximum age for this rule */
@property (nonatomic, assign) NSInteger maxAgeSeconds;

/** The list of exposed headers */
@property (nonatomic, retain) NSArray *exposeHeaders;

/** The list of allowed headers */
@property (nonatomic, retain) NSArray *allowedHeaders;

-(NSString *)toXml;

@end
