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


#ifndef AWS_MULTI_FRAMEWORK
#define AWS_MULTI_FRAMEWORK
#endif

#import "AmazonAbstractJsonWebServiceClient.h"
#import "AmazonAbstractWebServiceClient.h"
#import "AmazonAuthUtils.h"
#import "AmazonClientException.h"
#import "AmazonCredentials.h"
#import "AmazonCredentialsProvider.h"
#import "AmazonEndpoints.h"
#import "AmazonErrorHandler.h"
#import "AmazonJSON.h"
#import "AmazonLogger.h"
#import "AmazonMD5Util.h"
#import "AmazonRequestDelegate.h"
#import "AmazonSDKUtil.h"
#import "AmazonServiceException.h"
#import "AmazonServiceRequest.h"
#import "AmazonServiceRequestConfig.h"
#import "AmazonServiceResponse.h"
#import "AmazonSignatureException.h"
#import "AmazonStaticCredentialsProvider.h"
#import "AmazonURLRequest.h"
#import "AmazonWebServiceClient.h"
#import "AWS_SBJson.h"
