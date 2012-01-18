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

#import "SESSendRawEmailRequestMarshaller.h"

@implementation SESSendRawEmailRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESSendRawEmailRequest *)sendRawEmailRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"SendRawEmail"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[sendRawEmailRequest delegate]];
    [request setCredentials:[sendRawEmailRequest credentials]];
    [request setEndpoint:[sendRawEmailRequest requestEndpoint]];
    [request setRequestTag:[sendRawEmailRequest requestTag]];

    if (sendRawEmailRequest != nil) {
        if (sendRawEmailRequest.source != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendRawEmailRequest.source] forKey:[NSString stringWithFormat:@"%@", @"Source"]];
        }
    }

    if (sendRawEmailRequest != nil) {
        int destinationsListIndex = 1;
        for (NSString *destinationsListValue in sendRawEmailRequest.destinations) {
            if (destinationsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", destinationsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Destinations", destinationsListIndex]];
            }

            destinationsListIndex++;
        }
    }
    if (sendRawEmailRequest != nil) {
        SESRawMessage *rawMessage = sendRawEmailRequest.rawMessage;
        if (rawMessage != nil) {
            if (rawMessage.data != nil) {
                [request setParameterValue:[rawMessage.data base64EncodedString] forKey:[NSString stringWithFormat:@"%@.%@", @"RawMessage", @"Data"]];
            }
        }
    }


    return [request autorelease];
}

@end

