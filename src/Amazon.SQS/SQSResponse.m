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

#import "SQSResponse.h"
#import "AmazonSDKUtil.h"

@implementation SQSResponse

-(NSDate *)getDateFromResponse
{
    if ( [[self responseHeader] objectForKey:@"Date"] ) {
        NSString *date = [[self responseHeader] valueForKey:@"Date"];
        return [AmazonSDKUtil convertStringToDate:date usingFormat:kRFC822DateFormat];
    }
    
    NSString *msgBody = [[NSString alloc] initWithData:[self body] encoding:NSUTF8StringEncoding];
    NSString *time = nil;
    // if local device time is behind than server time
    if ([msgBody rangeOfString:@" + 15"].location == NSNotFound) {
        time = [self getTimeUsingBeginTag:@" (" andEndTag:@" - 15 min.)" fromResponseBody:msgBody];
    }
    else {
        time =  [self getTimeUsingBeginTag:@" (" andEndTag:@" + 15 min.)" fromResponseBody:msgBody];
    }
    [msgBody release];
    
    return [AmazonSDKUtil convertStringToDate:time usingFormat:kDateTimeFormat];
}

/**
 * Extract server time from response message body.
 *
 * @return the server time in a string format.
 */
-(NSString *)getTimeUsingBeginTag:(NSString *)bTag andEndTag:(NSString *)eTag fromResponseBody:(NSString *)responseBody
{
    @try {
        NSRange rLeft = [responseBody rangeOfString:bTag];
        NSRange rRight = [responseBody rangeOfString:eTag];
        NSUInteger loc = rLeft.location + rLeft.length;
        NSUInteger len = rRight.location - rLeft.location - rLeft.length;
        NSRange sub = NSMakeRange(loc, len);
        NSString *date = [responseBody substringWithRange:sub];
        return date;
    }
    @catch (NSException *e) {
        return nil;
    }
}

@end
