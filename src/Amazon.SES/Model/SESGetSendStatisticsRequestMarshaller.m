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

#import "SESGetSendStatisticsRequestMarshaller.h"

@implementation SESGetSendStatisticsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESGetSendStatisticsRequest *)getSendStatisticsRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"GetSendStatistics"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[getSendStatisticsRequest delegate]];
    [request setCredentials:[getSendStatisticsRequest credentials]];
    [request setEndpoint:[getSendStatisticsRequest requestEndpoint]];
    [request setRequestTag:[getSendStatisticsRequest requestTag]];



    return [request autorelease];
}

@end

