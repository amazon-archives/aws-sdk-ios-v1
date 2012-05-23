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

#import "EC2DescribeSnapshotAttributeResponse.h"


@implementation EC2DescribeSnapshotAttributeResponse

@synthesize snapshotId;
@synthesize createVolumePermissions;
@synthesize productCodes;


-(id)init
{
    if (self = [super init]) {
        snapshotId              = nil;
        createVolumePermissions = [[NSMutableArray alloc] initWithCapacity:1];
        productCodes            = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}



-(EC2CreateVolumePermission *)createVolumePermissionsObjectAtIndex:(int)index
{
    return (EC2CreateVolumePermission *)[createVolumePermissions objectAtIndex:index];
}


-(EC2ProductCode *)productCodesObjectAtIndex:(int)index
{
    return (EC2ProductCode *)[productCodes objectAtIndex:index];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SnapshotId: %@,", snapshotId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreateVolumePermissions: %@,", createVolumePermissions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductCodes: %@,", productCodes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [snapshotId release];
    [createVolumePermissions release];
    [productCodes release];

    [super dealloc];
}


@end
