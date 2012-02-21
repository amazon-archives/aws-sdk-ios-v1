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
#import "EC2ImportInstanceRequest.h"
#import "EC2ImportInstanceLaunchSpecification.h"
#import "EC2Placement.h"
#import "EC2BlockDeviceMapping.h"
#import "EC2EbsBlockDevice.h"
#import "EC2BlockDeviceMapping.h"
#import "EC2EbsBlockDevice.h"
#import "EC2DiskImage.h"
#import "EC2DiskImageDetail.h"
#import "EC2VolumeDetail.h"


/**
 * Import Instance Request Marshaller
 */
@interface EC2ImportInstanceRequestMarshaller:NSObject {
}


+(AmazonServiceRequest *)createRequest:(EC2ImportInstanceRequest *)importInstanceRequest;


@end

