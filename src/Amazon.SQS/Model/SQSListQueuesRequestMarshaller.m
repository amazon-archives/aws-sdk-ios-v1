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

#import "SQSListQueuesRequestMarshaller.h"

@implementation SQSListQueuesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSListQueuesRequest *)listQueuesRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"ListQueues"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[listQueuesRequest delegate]];
    [request setCredentials:[listQueuesRequest credentials]];
    [request setEndpoint:[listQueuesRequest requestEndpoint]];
    [request setRequestTag:[listQueuesRequest requestTag]];

    if (listQueuesRequest != nil) {
        if (listQueuesRequest.queueNamePrefix != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listQueuesRequest.queueNamePrefix] forKey:[NSString stringWithFormat:@"%@", @"QueueNamePrefix"]];
        }
    }


    return [request autorelease];
}

@end

