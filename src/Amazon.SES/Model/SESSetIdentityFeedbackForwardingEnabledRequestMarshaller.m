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

#import "SESSetIdentityFeedbackForwardingEnabledRequestMarshaller.h"

@implementation SESSetIdentityFeedbackForwardingEnabledRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESSetIdentityFeedbackForwardingEnabledRequest *)setIdentityFeedbackForwardingEnabledRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"SetIdentityFeedbackForwardingEnabled"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[setIdentityFeedbackForwardingEnabledRequest delegate]];
    [request setCredentials:[setIdentityFeedbackForwardingEnabledRequest credentials]];
    [request setEndpoint:[setIdentityFeedbackForwardingEnabledRequest requestEndpoint]];
    [request setRequestTag:[setIdentityFeedbackForwardingEnabledRequest requestTag]];

    if (setIdentityFeedbackForwardingEnabledRequest != nil) {
        if (setIdentityFeedbackForwardingEnabledRequest.identity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setIdentityFeedbackForwardingEnabledRequest.identity] forKey:[NSString stringWithFormat:@"%@", @"Identity"]];
        }
    }
    if (setIdentityFeedbackForwardingEnabledRequest != nil) {
        if (setIdentityFeedbackForwardingEnabledRequest.forwardingEnabledIsSet) {
            [request setParameterValue:(setIdentityFeedbackForwardingEnabledRequest.forwardingEnabled ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"ForwardingEnabled"]];
        }
    }


    return [request autorelease];
}

@end

