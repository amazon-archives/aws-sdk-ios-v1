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

#import "SNSSetTopicAttributesRequestMarshaller.h"

@implementation SNSSetTopicAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSSetTopicAttributesRequest *)setTopicAttributesRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"SetTopicAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[setTopicAttributesRequest delegate]];
    [request setCredentials:[setTopicAttributesRequest credentials]];
    [request setEndpoint:[setTopicAttributesRequest requestEndpoint]];
    [request setRequestTag:[setTopicAttributesRequest requestTag]];

    if (setTopicAttributesRequest != nil) {
        if (setTopicAttributesRequest.topicArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setTopicAttributesRequest.topicArn] forKey:[NSString stringWithFormat:@"%@", @"TopicArn"]];
        }
    }
    if (setTopicAttributesRequest != nil) {
        if (setTopicAttributesRequest.attributeName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setTopicAttributesRequest.attributeName] forKey:[NSString stringWithFormat:@"%@", @"AttributeName"]];
        }
    }
    if (setTopicAttributesRequest != nil) {
        if (setTopicAttributesRequest.attributeValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setTopicAttributesRequest.attributeValue] forKey:[NSString stringWithFormat:@"%@", @"AttributeValue"]];
        }
    }


    return [request autorelease];
}

@end

