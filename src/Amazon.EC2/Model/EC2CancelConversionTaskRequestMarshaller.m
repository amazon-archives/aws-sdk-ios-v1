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

#import "EC2CancelConversionTaskRequestMarshaller.h"

@implementation EC2CancelConversionTaskRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CancelConversionTaskRequest *)cancelConversionTaskRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CancelConversionTask"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[cancelConversionTaskRequest delegate]];
    [request setCredentials:[cancelConversionTaskRequest credentials]];
    [request setEndpoint:[cancelConversionTaskRequest requestEndpoint]];
    [request setRequestTag:[cancelConversionTaskRequest requestTag]];

    if (cancelConversionTaskRequest != nil) {
        if (cancelConversionTaskRequest.conversionTaskId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", cancelConversionTaskRequest.conversionTaskId] forKey:[NSString stringWithFormat:@"%@", @"ConversionTaskId"]];
        }
    }
    if (cancelConversionTaskRequest != nil) {
        if (cancelConversionTaskRequest.reasonMessage != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", cancelConversionTaskRequest.reasonMessage] forKey:[NSString stringWithFormat:@"%@", @"ReasonMessage"]];
        }
    }


    return [request autorelease];
}

@end

