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

#import "AmazonSDKUtil.h"
#import "AmazonAuthUtils.h"
#import "AmazonClientException.h"
#import "AmazonLogger.h"
#import "AmazonServiceException.h"
#import "AmazonSignatureException.h"
#import "AmazonUnmarshallerXMLParserDelegate.h"
#import "AmazonServiceRequest.h"
#import "AmazonServiceRequestConfig.h"
#import "AmazonServiceResponse.h"
#import "AmazonServiceResponseUnmarshaller.h"
#import "AmazonURLRequest.h"
#import "AmazonCredentials.h"
#import "AmazonRequestDelegate.h"
#import "AmazonAbstractWebServiceClient.h"

@interface AmazonWebServiceClient:AmazonAbstractWebServiceClient
{
}

/** Inits the client with the access key and the secret key.
 *
 * @param accessKey The AWS Access Key
 * @param secretKey The AWS Secret Key
 */
-(id)initWithAccessKey:(NSString *)accessKey withSecretKey:(NSString *)secretKey;

@end


