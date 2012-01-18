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

#import "SNSPublishRequestMarshaller.h"

@implementation SNSPublishRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSPublishRequest *)publishRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"Publish"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[publishRequest delegate]];
    [request setCredentials:[publishRequest credentials]];
    [request setEndpoint:[publishRequest requestEndpoint]];
    [request setRequestTag:[publishRequest requestTag]];

    if (publishRequest != nil) {
        if (publishRequest.topicArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", publishRequest.topicArn] forKey:[NSString stringWithFormat:@"%@", @"TopicArn"]];
        }
    }
    if (publishRequest != nil) {
        if (publishRequest.message != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", publishRequest.message] forKey:[NSString stringWithFormat:@"%@", @"Message"]];
        }
    }
    if (publishRequest != nil) {
        if (publishRequest.subject != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", publishRequest.subject] forKey:[NSString stringWithFormat:@"%@", @"Subject"]];
        }
    }
    if (publishRequest != nil) {
        if (publishRequest.messageStructure != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", publishRequest.messageStructure] forKey:[NSString stringWithFormat:@"%@", @"MessageStructure"]];
        }
    }


    return [request autorelease];
}

@end

