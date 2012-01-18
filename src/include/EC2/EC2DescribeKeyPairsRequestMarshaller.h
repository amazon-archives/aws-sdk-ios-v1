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

#import "../AmazonServiceRequest.h"

#import "EC2Request.h"
#import "EC2DescribeKeyPairsRequest.h"
#import "EC2Filter.h"
#import "EC2Filter.h"


/**
 * Describe Key Pairs Request Marshaller
 */
@interface EC2DescribeKeyPairsRequestMarshaller:NSObject {
}


+(AmazonServiceRequest *)createRequest:(EC2DescribeKeyPairsRequest *)describeKeyPairsRequest;


@end

