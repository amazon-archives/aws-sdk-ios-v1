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

#import "EC2CreateInstanceExportTaskRequestMarshaller.h"

@implementation EC2CreateInstanceExportTaskRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CreateInstanceExportTaskRequest *)createInstanceExportTaskRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CreateInstanceExportTask"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[createInstanceExportTaskRequest delegate]];
    [request setCredentials:[createInstanceExportTaskRequest credentials]];
    [request setEndpoint:[createInstanceExportTaskRequest requestEndpoint]];
    [request setRequestTag:[createInstanceExportTaskRequest requestTag]];

    if (createInstanceExportTaskRequest != nil) {
        if (createInstanceExportTaskRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createInstanceExportTaskRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }
    if (createInstanceExportTaskRequest != nil) {
        if (createInstanceExportTaskRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createInstanceExportTaskRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (createInstanceExportTaskRequest != nil) {
        if (createInstanceExportTaskRequest.targetEnvironment != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createInstanceExportTaskRequest.targetEnvironment] forKey:[NSString stringWithFormat:@"%@", @"TargetEnvironment"]];
        }
    }
    if (createInstanceExportTaskRequest != nil) {
        EC2ExportToS3TaskSpecification *exportToS3Task = createInstanceExportTaskRequest.exportToS3Task;
        if (exportToS3Task != nil) {
            if (exportToS3Task.diskImageFormat != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", exportToS3Task.diskImageFormat] forKey:[NSString stringWithFormat:@"%@.%@", @"ExportToS3", @"DiskImageFormat"]];
            }
        }
        if (exportToS3Task != nil) {
            if (exportToS3Task.containerFormat != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", exportToS3Task.containerFormat] forKey:[NSString stringWithFormat:@"%@.%@", @"ExportToS3", @"ContainerFormat"]];
            }
        }
        if (exportToS3Task != nil) {
            if (exportToS3Task.s3Bucket != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", exportToS3Task.s3Bucket] forKey:[NSString stringWithFormat:@"%@.%@", @"ExportToS3", @"S3Bucket"]];
            }
        }
        if (exportToS3Task != nil) {
            if (exportToS3Task.s3Prefix != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", exportToS3Task.s3Prefix] forKey:[NSString stringWithFormat:@"%@.%@", @"ExportToS3", @"S3Prefix"]];
            }
        }
    }


    return [request autorelease];
}

@end

