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

#import "AutoScalingPutNotificationConfigurationRequest.h"


@implementation AutoScalingPutNotificationConfigurationRequest

@synthesize autoScalingGroupName;
@synthesize topicARN;
@synthesize notificationTypes;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupName = nil;
        topicARN             = nil;
        notificationTypes    = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addNotificationType:(NSString *)notificationTypeObject
{
    if (notificationTypes == nil) {
        notificationTypes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [notificationTypes addObject:notificationTypeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TopicARN: %@,", topicARN] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NotificationTypes: %@,", notificationTypes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingGroupName release];
    [topicARN release];
    [notificationTypes release];

    [super dealloc];
}


@end
