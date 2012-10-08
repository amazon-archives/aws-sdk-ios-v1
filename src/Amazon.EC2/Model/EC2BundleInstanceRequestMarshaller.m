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

#import "EC2BundleInstanceRequestMarshaller.h"

@implementation EC2BundleInstanceRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2BundleInstanceRequest *)bundleInstanceRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"BundleInstance"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[bundleInstanceRequest delegate]];
    [request setCredentials:[bundleInstanceRequest credentials]];
    [request setEndpoint:[bundleInstanceRequest requestEndpoint]];
    [request setRequestTag:[bundleInstanceRequest requestTag]];

    if (bundleInstanceRequest != nil) {
        if (bundleInstanceRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", bundleInstanceRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (bundleInstanceRequest != nil) {
        EC2Storage *storage = bundleInstanceRequest.storage;
        if (storage != nil) {
            EC2S3Storage *s3 = storage.s3;
            if (s3 != nil) {
                if (s3.bucket != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", s3.bucket] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Storage", @"S3", @"Bucket"]];
                }
            }
            if (s3 != nil) {
                if (s3.prefix != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", s3.prefix] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Storage", @"S3", @"Prefix"]];
                }
            }
            if (s3 != nil) {
                if (s3.aWSAccessKeyId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", s3.aWSAccessKeyId] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Storage", @"S3", @"AWSAccessKeyId"]];
                }
            }
            if (s3 != nil) {
                if (s3.uploadPolicy != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", s3.uploadPolicy] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Storage", @"S3", @"UploadPolicy"]];
                }
            }
            if (s3 != nil) {
                if (s3.uploadPolicySignature != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", s3.uploadPolicySignature] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"Storage", @"S3", @"UploadPolicySignature"]];
                }
            }
        }
    }


    return [request autorelease];
}

@end

