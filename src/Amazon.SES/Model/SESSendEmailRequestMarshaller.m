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

#import "SESSendEmailRequestMarshaller.h"

@implementation SESSendEmailRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESSendEmailRequest *)sendEmailRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"SendEmail"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[sendEmailRequest delegate]];
    [request setCredentials:[sendEmailRequest credentials]];
    [request setEndpoint:[sendEmailRequest requestEndpoint]];
    [request setRequestTag:[sendEmailRequest requestTag]];

    if (sendEmailRequest != nil) {
        if (sendEmailRequest.source != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendEmailRequest.source] forKey:[NSString stringWithFormat:@"%@", @"Source"]];
        }
    }
    if (sendEmailRequest != nil) {
        SESDestination *destination = sendEmailRequest.destination;

        if (destination != nil) {
            int toAddressesListIndex = 1;
            for (NSString *toAddressesListValue in destination.toAddresses) {
                if (toAddressesListValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", toAddressesListValue] forKey:[NSString stringWithFormat:@"%@.%@.member.%d", @"Destination", @"ToAddresses", toAddressesListIndex]];
                }

                toAddressesListIndex++;
            }
        }

        if (destination != nil) {
            int ccAddressesListIndex = 1;
            for (NSString *ccAddressesListValue in destination.ccAddresses) {
                if (ccAddressesListValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", ccAddressesListValue] forKey:[NSString stringWithFormat:@"%@.%@.member.%d", @"Destination", @"CcAddresses", ccAddressesListIndex]];
                }

                ccAddressesListIndex++;
            }
        }

        if (destination != nil) {
            int bccAddressesListIndex = 1;
            for (NSString *bccAddressesListValue in destination.bccAddresses) {
                if (bccAddressesListValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", bccAddressesListValue] forKey:[NSString stringWithFormat:@"%@.%@.member.%d", @"Destination", @"BccAddresses", bccAddressesListIndex]];
                }

                bccAddressesListIndex++;
            }
        }
    }
    if (sendEmailRequest != nil) {
        SESMessage *message = sendEmailRequest.message;
        if (message != nil) {
            SESContent *subject = message.subject;
            if (subject != nil) {
                if (subject.data != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", subject.data] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Message", @"Subject", @"Data"]];
                }
            }
            if (subject != nil) {
                if (subject.charset != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", subject.charset] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Message", @"Subject", @"Charset"]];
                }
            }
        }
        if (message != nil) {
            SESBody *body = message.body;
            if (body != nil) {
                SESContent *text = body.text;
                if (text != nil) {
                    if (text.data != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", text.data] forKey:[NSString stringWithFormat:@"%@.%@.%@.%@", @"Message", @"Body", @"Text", @"Data"]];
                    }
                }
                if (text != nil) {
                    if (text.charset != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", text.charset] forKey:[NSString stringWithFormat:@"%@.%@.%@.%@", @"Message", @"Body", @"Text", @"Charset"]];
                    }
                }
            }
            if (body != nil) {
                SESContent *html = body.html;
                if (html != nil) {
                    if (html.data != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", html.data] forKey:[NSString stringWithFormat:@"%@.%@.%@.%@", @"Message", @"Body", @"Html", @"Data"]];
                    }
                }
                if (html != nil) {
                    if (html.charset != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", html.charset] forKey:[NSString stringWithFormat:@"%@.%@.%@.%@", @"Message", @"Body", @"Html", @"Charset"]];
                    }
                }
            }
        }
    }

    if (sendEmailRequest != nil) {
        int replyToAddressesListIndex = 1;
        for (NSString *replyToAddressesListValue in sendEmailRequest.replyToAddresses) {
            if (replyToAddressesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", replyToAddressesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"ReplyToAddresses", replyToAddressesListIndex]];
            }

            replyToAddressesListIndex++;
        }
    }
    if (sendEmailRequest != nil) {
        if (sendEmailRequest.returnPath != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendEmailRequest.returnPath] forKey:[NSString stringWithFormat:@"%@", @"ReturnPath"]];
        }
    }


    return [request autorelease];
}

@end

