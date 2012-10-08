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

#import "EC2ReportInstanceStatusRequestMarshaller.h"

@implementation EC2ReportInstanceStatusRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ReportInstanceStatusRequest *)reportInstanceStatusRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ReportInstanceStatus"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[reportInstanceStatusRequest delegate]];
    [request setCredentials:[reportInstanceStatusRequest credentials]];
    [request setEndpoint:[reportInstanceStatusRequest requestEndpoint]];
    [request setRequestTag:[reportInstanceStatusRequest requestTag]];


    if (reportInstanceStatusRequest != nil) {
        int instancesListIndex = 1;
        for (NSString *instancesListValue in reportInstanceStatusRequest.instances) {
            if (instancesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", instancesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"InstanceId", instancesListIndex]];
            }

            instancesListIndex++;
        }
    }
    if (reportInstanceStatusRequest != nil) {
        if (reportInstanceStatusRequest.status != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", reportInstanceStatusRequest.status] forKey:[NSString stringWithFormat:@"%@", @"Status"]];
        }
    }
    if (reportInstanceStatusRequest != nil) {
        if (reportInstanceStatusRequest.startTime != nil) {
            [request setParameterValue:[reportInstanceStatusRequest.startTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"StartTime"]];
        }
    }
    if (reportInstanceStatusRequest != nil) {
        if (reportInstanceStatusRequest.endTime != nil) {
            [request setParameterValue:[reportInstanceStatusRequest.endTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"EndTime"]];
        }
    }

    if (reportInstanceStatusRequest != nil) {
        int reasonCodesListIndex = 1;
        for (NSString *reasonCodesListValue in reportInstanceStatusRequest.reasonCodes) {
            if (reasonCodesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", reasonCodesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ReasonCode", reasonCodesListIndex]];
            }

            reasonCodesListIndex++;
        }
    }
    if (reportInstanceStatusRequest != nil) {
        if (reportInstanceStatusRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", reportInstanceStatusRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }


    return [request autorelease];
}

@end

