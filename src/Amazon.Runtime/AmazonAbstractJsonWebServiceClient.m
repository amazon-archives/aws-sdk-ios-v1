/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AmazonAbstractJsonWebServiceClient.h"

@implementation AmazonAbstractJsonWebServiceClient

-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)generatedRequest rawRequest:(AmazonServiceRequestConfig *)originalRequest unmarshallerDelegate:(Class)unmarshallerDelegate
{
    if (nil == generatedRequest) {
        return [self nilRequestResponse];
    }
    
    [generatedRequest setUserAgent:self.userAgent];
    
    if (nil == generatedRequest.endpoint) {
        generatedRequest.endpoint = [self endpoint];
    }
    if (nil == generatedRequest.credentials) {
        [generatedRequest setCredentials: [self.provider credentials]];
    }
    
    NSMutableURLRequest *urlRequest = [generatedRequest configureURLRequest];
    [urlRequest setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
    
    [self logTheRequest:urlRequest];
    
    AmazonServiceResponse *response = nil;
    int retries = 0;
    while (retries < self.maxRetries) {
        AMZLogDebug(@"Begin Request: %@:%d", NSStringFromClass([generatedRequest class]), retries);
        
        response = [self createResponse:generatedRequest withUnmarshallerDelegate:unmarshallerDelegate];
        [self setupRequestTimeout:urlRequest];
        [self logTheRequestHeaders:urlRequest];
 
        if ([generatedRequest delegate] != nil) {
            response.isAsyncCall = YES;
            [self startAsyncRequest:urlRequest response:response originalRequest:originalRequest];
            return nil;
        }
        
        response.isAsyncCall = NO;
        [self startSyncRequest:generatedRequest forRequest:urlRequest response:response originalRequest:originalRequest];
        
        AMZLogDebug(@"Response Status Code : %d", response.httpStatusCode);
        
        if ( [self shouldRetry:response exception:((AmazonRequestDelegate *)generatedRequest.delegate).exception]) {
            AMZLog(@"Retring Request: %d", retries);
            
            if(response.hasClockSkewError) {
                urlRequest = [generatedRequest configureURLRequest];
            }
            
            [self pauseExponentially:retries];
            retries++;
            
            if (retries < self.maxRetries)
            {
                generatedRequest.delegate = nil;
            }
        }
        else {
            break;
        }
    }
    
    return [self returnErrorOrResponse:response forRequest:generatedRequest];
}

@end
