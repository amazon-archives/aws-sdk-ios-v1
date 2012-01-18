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


#import <Foundation/Foundation.h>
#import "AmazonServiceRequest.h"
#import "AmazonCredentials.h"


@interface AmazonServiceRequestConfig:NSObject {
    id<AmazonServiceRequestDelegate> delegate;
    AmazonCredentials                *credentials;
    NSString                         *requestEndpoint;
    NSURLConnection                  *urlConnection;
    NSString                         *requestTag;
}

/** Request specific credentials. */
@property (nonatomic, retain) AmazonCredentials *credentials;


/** Request specific endpoint.  This value will override the setting
 *  in the service specific client used to submit the request.
 *  Inspect the 'endpoint' property in the AmazonXXXClient class to
 *  see the default endpoint.
 */
@property (nonatomic, retain) NSString *requestEndpoint;

/**
 * The connection object used to make the request.
 */
@property (nonatomic, retain) NSURLConnection *urlConnection;

/**
 * Open property that enables user to distinquish various requests.
 */
@property (nonatomic, retain) NSString *requestTag;


-(void)setDelegate:(id<AmazonServiceRequestDelegate> )delegate;
-(id<AmazonServiceRequestDelegate> )delegate;
@end
