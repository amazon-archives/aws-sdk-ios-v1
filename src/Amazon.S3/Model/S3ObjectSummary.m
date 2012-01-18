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

#import "S3ObjectSummary.h"


@implementation S3ObjectSummary

@synthesize key;
@synthesize etag;
@synthesize size;
@synthesize lastModified;
@synthesize storageClass;
@synthesize owner;


-(NSString *)description
{
    return self.key;
}

-(void)dealloc
{
    [key release];
    [etag release];
    [lastModified release];
    [storageClass release];
    [owner release];

    [super dealloc];
}

@end
