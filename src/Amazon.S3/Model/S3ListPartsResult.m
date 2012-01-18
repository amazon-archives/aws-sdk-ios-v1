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

#import "S3ListPartsResult.h"


@implementation S3ListPartsResult

@synthesize bucket;
@synthesize key;
@synthesize uploadId;
@synthesize storageClass;
@synthesize owner;
@synthesize initiator;
@synthesize partNumberMarker;
@synthesize nextPartNumberMarker;
@synthesize maxParts;
@synthesize isTruncated;

-(NSMutableArray *)parts
{
    if (parts == nil)
    {
        parts = [[NSMutableArray alloc] init];
    }
    return parts;
}

-(void)dealloc
{
    [bucket release];
    [key release];
    [uploadId release];
    [storageClass release];
    [owner release];
    [initiator release];
    [parts release];

    [super dealloc];
}


@end
