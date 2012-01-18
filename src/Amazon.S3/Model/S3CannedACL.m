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

#import "S3CannedACL.h"


@implementation S3CannedACL

-(id)initWithStringValue:(NSString *)value
{
    self = [super init];
    if (self) {
        stringValue = [value retain];
    }
    return self;
}

+(S3CannedACL *)private
{
    static S3CannedACL *thisCannedAcl = nil;

    if (thisCannedAcl == nil) {
        thisCannedAcl = [[S3CannedACL alloc] initWithStringValue:kS3CannedAclPrivate];
    }
    return thisCannedAcl;
}

+(S3CannedACL *)publicRead
{
    static S3CannedACL *thisCannedAcl = nil;

    if (thisCannedAcl == nil) {
        thisCannedAcl = [[S3CannedACL alloc] initWithStringValue:kS3CannedAclPublicRead];
    }
    return thisCannedAcl;
}

+(S3CannedACL *)publicReadWrite
{
    static S3CannedACL *thisCannedAcl = nil;

    if (thisCannedAcl == nil) {
        thisCannedAcl = [[S3CannedACL alloc] initWithStringValue:kS3CannedAclPublicReadWrite];
    }
    return thisCannedAcl;
}

+(S3CannedACL *)authenticatedRead
{
    static S3CannedACL *thisCannedAcl = nil;

    if (thisCannedAcl == nil) {
        thisCannedAcl = [[S3CannedACL alloc] initWithStringValue:kS3CannedAclAuthRead];
    }
    return thisCannedAcl;
}

+(S3CannedACL *)bucketOwnerRead
{
    static S3CannedACL *thisCannedAcl = nil;

    if (thisCannedAcl == nil) {
        thisCannedAcl = [[S3CannedACL alloc] initWithStringValue:kS3CannedAclBucketOwnerRead];
    }
    return thisCannedAcl;
}

+(S3CannedACL *)bucketOwnerFullControl
{
    static S3CannedACL *thisCannedAcl = nil;

    if (thisCannedAcl == nil) {
        thisCannedAcl = [[S3CannedACL alloc] initWithStringValue:kS3CannedAclBucketOwnerFullControl];
    }
    return thisCannedAcl;
}

-(NSString *)description
{
    return stringValue;
}


@end
