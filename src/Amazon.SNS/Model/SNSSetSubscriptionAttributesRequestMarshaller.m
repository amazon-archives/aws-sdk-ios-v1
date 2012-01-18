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

#import "SNSSetSubscriptionAttributesRequestMarshaller.h"

@implementation SNSSetSubscriptionAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSSetSubscriptionAttributesRequest *)setSubscriptionAttributesRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"SetSubscriptionAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[setSubscriptionAttributesRequest delegate]];
    [request setCredentials:[setSubscriptionAttributesRequest credentials]];
    [request setEndpoint:[setSubscriptionAttributesRequest requestEndpoint]];
    [request setRequestTag:[setSubscriptionAttributesRequest requestTag]];

    if (setSubscriptionAttributesRequest != nil) {
        if (setSubscriptionAttributesRequest.subscriptionArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setSubscriptionAttributesRequest.subscriptionArn] forKey:[NSString stringWithFormat:@"%@", @"SubscriptionArn"]];
        }
    }
    if (setSubscriptionAttributesRequest != nil) {
        if (setSubscriptionAttributesRequest.attributeName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setSubscriptionAttributesRequest.attributeName] forKey:[NSString stringWithFormat:@"%@", @"AttributeName"]];
        }
    }
    if (setSubscriptionAttributesRequest != nil) {
        if (setSubscriptionAttributesRequest.attributeValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setSubscriptionAttributesRequest.attributeValue] forKey:[NSString stringWithFormat:@"%@", @"AttributeValue"]];
        }
    }


    return [request autorelease];
}

@end

