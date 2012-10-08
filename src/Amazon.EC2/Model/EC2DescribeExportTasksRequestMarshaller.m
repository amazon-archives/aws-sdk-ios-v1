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

#import "EC2DescribeExportTasksRequestMarshaller.h"

@implementation EC2DescribeExportTasksRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeExportTasksRequest *)describeExportTasksRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeExportTasks"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeExportTasksRequest delegate]];
    [request setCredentials:[describeExportTasksRequest credentials]];
    [request setEndpoint:[describeExportTasksRequest requestEndpoint]];
    [request setRequestTag:[describeExportTasksRequest requestTag]];


    if (describeExportTasksRequest != nil) {
        int exportTaskIdsListIndex = 1;
        for (NSString *exportTaskIdsListValue in describeExportTasksRequest.exportTaskIds) {
            if (exportTaskIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", exportTaskIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ExportTaskId", exportTaskIdsListIndex]];
            }

            exportTaskIdsListIndex++;
        }
    }


    return [request autorelease];
}

@end

