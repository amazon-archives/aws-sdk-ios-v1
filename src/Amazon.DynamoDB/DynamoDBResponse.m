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


#import "DynamoDBResponse.h"
#import "AmazonServiceResponseUnmarshaller.h"
#import "AmazonLogger.h"
#import "AmazonJSON.h"

#define REQUEST_ID_HEADER    @"X-Amzn-Requestid"

@implementation DynamoDBResponse

-(id)init
{
    self = [super init];
    if (self != nil) {
    }

    return self;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [super connection:connection didReceiveResponse:response];

    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    self.requestId = [[httpResponse allHeaderFields] valueForKey:REQUEST_ID_HEADER];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDate *startDate = [NSDate date];

    isFinishedLoading = YES;

    NSString *jsonString = [[[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding] autorelease];
    AMZLogDebug(@"Response Body:\n%@", jsonString);
    if (self.httpStatusCode == 413) {
        @throw [AmazonServiceException exceptionWithMessage : @"Request Entity Too Large" withErrorCode : @"RequestEntityTooLarge" withStatusCode : 413 withRequestId : self.requestId];
    }
    else {
        NSMutableDictionary   *jsonObject = [AmazonJSON JSONValue:jsonString];
        AmazonServiceResponse *response   = [unmarshallerDelegate unmarshall:jsonObject];

        if (response.exception) {
            ((AmazonServiceException *)response.exception).requestId = self.requestId;

            NSException *exceptionFound = [[response.exception copy] autorelease];
            if ([(NSObject *)request.delegate respondsToSelector:@selector(request:didFailWithServiceException:)]) {
                [request.delegate request:request didFailWithServiceException:(AmazonServiceException *)exceptionFound];
                return;
            }
            else {
                @throw exceptionFound;
            }
        }
        response.requestId = self.requestId;


        [response postProcess];
        processingTime          = fabs([startDate timeIntervalSinceNow]);
        response.processingTime = processingTime;



        if ([(NSObject *)request.delegate respondsToSelector:@selector(request:didCompleteWithResponse:)]) {
            [request.delegate request:request didCompleteWithResponse:response];
        }
    }
}

-(void)dealloc
{
    [super dealloc];
}

@end
