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

#import "S3ListMultipartUploadsResult.h"


@implementation S3ListMultipartUploadsResult

@synthesize bucket;
@synthesize keyMarker;
@synthesize uploadIdMarker;
@synthesize nextKeyMarker;
@synthesize nextUploadIdMarker;
@synthesize maxUploads;
@synthesize isTruncated;
@synthesize delimiter;
@synthesize prefix;

-(NSMutableArray *)uploads
{
    if (uploads == nil)
    {
        uploads = [[NSMutableArray alloc] init];
    }
    return uploads;
}

-(NSMutableArray *)commonPrefixes
{
    if (commonPrefixes == nil) {
        commonPrefixes = [[NSMutableArray alloc] init];
    }
    return commonPrefixes;
}

-(void)dealloc
{
    [bucket release];
    [prefix release];
    [uploads release];
    [keyMarker release];
    [delimiter release];
    [nextKeyMarker release];
    [commonPrefixes release];
    [uploadIdMarker release];
    [nextUploadIdMarker release];

    [super dealloc];
}

@end
