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

#import "SNSAddPermissionRequestMarshaller.h"

@implementation SNSAddPermissionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"AddPermission"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[addPermissionRequest delegate]];
    [request setCredentials:[addPermissionRequest credentials]];
    [request setEndpoint:[addPermissionRequest requestEndpoint]];
    [request setRequestTag:[addPermissionRequest requestTag]];

    if (addPermissionRequest != nil) {
        if (addPermissionRequest.topicArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", addPermissionRequest.topicArn] forKey:[NSString stringWithFormat:@"%@", @"TopicArn"]];
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
                [request setParameterValue:[NSString stringWithFormat:@"%@", aWSAccountIdsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AWSAccountId", aWSAccountIdsListIndex]];
            }

            aWSAccountIdsListIndex++;
        }
    }

    if (addPermissionRequest != nil) {
        int actionNamesListIndex = 1;
        for (NSString *actionNamesListValue in addPermissionRequest.actionNames) {
            if (actionNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", actionNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"ActionName", actionNamesListIndex]];
            }

            actionNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

