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

#import "SNSSubscribeResponse.h"


@implementation SNSSubscribeResponse

@synthesize subscriptionArn;


-(id)init
{
    if (self = [super init]) {
        subscriptionArn = nil;
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"NotFound"]) {
        [newException release];
        newException = [[SNSNotFoundException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"AuthorizationError"]) {
        [newException release];
        newException = [[SNSAuthorizationErrorException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InternalError"]) {
        [newException release];
        newException = [[SNSInternalErrorException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"SubscriptionLimitExceeded"]) {
        [newException release];
        newException = [[SNSSubscriptionLimitExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InvalidParameter"]) {
        [newException release];
        newException = [[SNSInvalidParameterException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SubscriptionArn: %@,", subscriptionArn] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [subscriptionArn release];

    [super dealloc];
}


@end
