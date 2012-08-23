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
        
        BOOL throwsExceptions = [AmazonErrorHandler throwsExceptions];
        NSException *requestEntityTooLargeException = [AmazonServiceException exceptionWithMessage:@"Request Entity Too Large"
                                                                withErrorCode:@"RequestEntityTooLarge"
                                                               withStatusCode:413
                                                                withRequestId:self.requestId];
        
        if (throwsExceptions == YES
            && [(NSObject *)request.delegate respondsToSelector:@selector(request:didFailWithServiceException:)]) {
            [request.delegate request:request didFailWithServiceException:requestEntityTooLargeException];
        }
        else if (throwsExceptions == NO
                 && [(NSObject *)request.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
            [request.delegate request:request 
                     didFailWithError:[AmazonErrorHandler errorFromException:requestEntityTooLargeException]];
        }
    }
    else {
        NSMutableDictionary   *jsonObject = [AmazonJSON JSONValue:jsonString];
        AmazonServiceResponse *response   = [unmarshallerDelegate performSelector:@selector(unmarshall:) withObject:jsonObject];
        
        if(response.error)
        {
            NSError *errorFound = [[response.error copy] autorelease];
            
            if ([(NSObject *)request.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
                [request.delegate request:request didFailWithError:errorFound];
            }
        }
        else if (response.exception) {
            ((AmazonServiceException *)response.exception).requestId = self.requestId;
            
            BOOL throwsExceptions = [AmazonErrorHandler throwsExceptions];
            NSException *exceptionFound = [[response.exception copy] autorelease];
            
            if (throwsExceptions == YES
                && [(NSObject *)request.delegate respondsToSelector:@selector(request:didFailWithServiceException:)]) {
                [request.delegate request:request didFailWithServiceException:(AmazonServiceException *)exceptionFound];
            }
            else if (throwsExceptions == NO
                     && [(NSObject *)request.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
                [request.delegate request:request didFailWithError:[AmazonErrorHandler errorFromException:exceptionFound]];
            }
        }
        else {
            response.requestId = self.requestId;
            
            [response postProcess];
            processingTime          = fabs([startDate timeIntervalSinceNow]);
            response.processingTime = processingTime;
            

            
            if ([(NSObject *)request.delegate respondsToSelector:@selector(request:didCompleteWithResponse:)]) {
                [request.delegate request:request didCompleteWithResponse:response];
            }
        }
    }
}

-(void)dealloc
{
    [super dealloc];
}

@end
