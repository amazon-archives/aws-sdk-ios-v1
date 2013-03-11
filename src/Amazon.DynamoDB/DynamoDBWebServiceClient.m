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

#import "DynamoDBWebServiceClient.h"


@implementation DynamoDBWebServiceClient

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [self init]) {
        [super initWithCredentials:theCredentials];
        // override values for DynamoDB
        self.maxRetries  = 11;
        self.timeout     = 30;
        self.delay       = 0.05;
        self.userAgent   = [AmazonSDKUtil userAgentString];
    }
    return self;
}

@end
