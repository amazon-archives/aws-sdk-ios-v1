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

#import "EC2ExportTask.h"


@implementation EC2ExportTask

@synthesize exportTaskId;
@synthesize descriptionValue;
@synthesize state;
@synthesize statusMessage;
@synthesize instanceExportDetails;
@synthesize exportToS3Task;


-(id)init
{
    if (self = [super init]) {
        exportTaskId          = nil;
        descriptionValue      = nil;
        state                 = nil;
        statusMessage         = nil;
        instanceExportDetails = nil;
        exportToS3Task        = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ExportTaskId: %@,", exportTaskId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StatusMessage: %@,", statusMessage] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceExportDetails: %@,", instanceExportDetails] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ExportToS3Task: %@,", exportToS3Task] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [exportTaskId release];
    [descriptionValue release];
    [state release];
    [statusMessage release];
    [instanceExportDetails release];
    [exportToS3Task release];

    [super dealloc];
}


@end
