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

#import "CloudWatchAlarmHistoryItem.h"


@implementation CloudWatchAlarmHistoryItem

@synthesize alarmName;
@synthesize timestamp;
@synthesize historyItemType;
@synthesize historySummary;
@synthesize historyData;


-(id)init
{
    if (self = [super init]) {
        alarmName       = nil;
        timestamp       = nil;
        historyItemType = nil;
        historySummary  = nil;
        historyData     = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AlarmName: %@,", alarmName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HistoryItemType: %@,", historyItemType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HistorySummary: %@,", historySummary] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HistoryData: %@,", historyData] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [alarmName release];
    [timestamp release];
    [historyItemType release];
    [historySummary release];
    [historyData release];

    [super dealloc];
}


@end
