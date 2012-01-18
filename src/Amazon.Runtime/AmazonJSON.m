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

#import "AmazonJSON.h"

@implementation AmazonJSON

+(NSString *)JSONRepresentation:(NSObject *)object
{
    SBJsonWriter *writer = [[[SBJsonWriter alloc] init] autorelease];
    NSString     *json   = [writer stringWithObject:object];

    if (!json) {
        NSLog(@"-[AmazonJSON JSONRepresentation:json] failed. Error is: %@", writer.error);
    }
    return json;
}

+(id)JSONValue:(NSString *)jsonString
{
    SBJsonParser *parser = [[[SBJsonParser alloc] init] autorelease];
    id           repr    = [parser objectWithString:jsonString];

    if (!repr) {
        NSLog(@"-JSONValue failed. Error is: %@", parser.error);
    }
    return repr;
}

@end
