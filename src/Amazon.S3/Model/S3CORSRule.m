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

#import "S3CORSRule.h"


@implementation S3CORSRule

@synthesize ruleId=_ruleId;
@synthesize allowedMethods=_allowedMethods;
@synthesize allowedOrigins=_allowedOrigins;
@synthesize maxAgeSeconds=_maxAgeSeconds;
@synthesize exposeHeaders=_exposeHeaders;
@synthesize allowedHeaders=_allowedHeaders;

-(NSString *)toXml
{
    NSMutableString *xml = [[NSMutableString alloc] init];

    [xml appendString:@"<CORSRule>"];
    
    if (self.ruleId != nil) {
        [xml appendFormat:@"<ID>%@</ID>", self.ruleId];
    }
    
    for (NSString *method in self.allowedMethods) {
        [xml appendFormat:@"<AllowedMethod>%@</AllowedMethod>", method];
    }
    
    for (NSString *origin in self.allowedOrigins) {
        [xml appendFormat:@"<AllowedOrigin>%@</AllowedOrigin>", origin];
    }
    
    if (self.maxAgeSeconds > 0) {
        [xml appendFormat:@"<MaxAgeSeconds>%d<MaxAgeSeconds>", self.maxAgeSeconds];
    }
    
    for (NSString *header in self.exposeHeaders) {
        [xml appendFormat:@"<ExposeHeader>%@</ExposeHeader>", header];
    }
    
    for (NSString *header in self.allowedHeaders) {
        [xml appendFormat:@"<AllowedHeader>%@</AllowedHeader>", header];
    }
    
    [xml appendString:@"</CORSRule>"];


    NSString *retval = [NSString stringWithString:xml];
    [xml release];

    return retval;
}

-(void)dealloc
{
    self.ruleId = nil;
    self.allowedMethods = nil;
    self.allowedOrigins = nil;
    self.exposeHeaders = nil;
    self.allowedHeaders = nil;
    [super dealloc];
}

@end
