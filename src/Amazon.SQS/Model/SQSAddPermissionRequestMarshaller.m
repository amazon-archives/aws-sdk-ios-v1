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

#import "SQSAddPermissionRequestMarshaller.h"

@implementation SQSAddPermissionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"AddPermission"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[addPermissionRequest delegate]];
    [request setCredentials:[addPermissionRequest credentials]];
    [request setEndpoint:[addPermissionRequest requestEndpoint]];
    [request setRequestTag:[addPermissionRequest requestTag]];

    if (addPermissionRequest != nil) {
        if (addPermissionRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", addPermissionRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }
    if (addPermissionRequest != nil) {
        if (addPermissionRequest.label != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", addPermissionRequest.label] forKey:[NSString stringWithFormat:@"%@", @"Label"]];
        }
    }

    if (addPermissionRequest != nil) {
        int aWSAccountIdsListIndex = 1;
        for (NSString *aWSAccountIdsListValue in addPermissionRequest.aWSAccountIds) {
            if (aWSAccountIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", aWSAccountIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"AWSAccountId", aWSAccountIdsListIndex]];
            }

            aWSAccountIdsListIndex++;
        }
    }

    if (addPermissionRequest != nil) {
        int actionsListIndex = 1;
        for (NSString *actionsListValue in addPermissionRequest.actions) {
            if (actionsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", actionsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ActionName", actionsListIndex]];
            }

            actionsListIndex++;
        }
    }


    return [request autorelease];
}

@end

