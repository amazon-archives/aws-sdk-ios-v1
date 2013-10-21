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

#import "EC2ReservedInstancesModification.h"


@implementation EC2ReservedInstancesModification

@synthesize reservedInstancesModificationId;
@synthesize reservedInstancesIds;
@synthesize modificationResults;
@synthesize createDate;
@synthesize updateDate;
@synthesize effectiveDate;
@synthesize status;
@synthesize statusMessage;
@synthesize clientToken;


-(id)init
{
    if (self = [super init]) {
        reservedInstancesModificationId = nil;
        reservedInstancesIds            = [[NSMutableArray alloc] initWithCapacity:1];
        modificationResults             = [[NSMutableArray alloc] initWithCapacity:1];
        createDate                      = nil;
        updateDate                      = nil;
        effectiveDate                   = nil;
        status                          = nil;
        statusMessage                   = nil;
        clientToken                     = nil;
    }

    return self;
}


-(void)addReservedInstancesId:(EC2ReservedInstancesId *)reservedInstancesIdObject
{
    if (reservedInstancesIds == nil) {
        reservedInstancesIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [reservedInstancesIds addObject:reservedInstancesIdObject];
}

-(void)addModificationResult:(EC2ReservedInstancesModificationResult *)modificationResultObject
{
    if (modificationResults == nil) {
        modificationResults = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [modificationResults addObject:modificationResultObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesModificationId: %@,", reservedInstancesModificationId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesIds: %@,", reservedInstancesIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ModificationResults: %@,", modificationResults] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreateDate: %@,", createDate] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UpdateDate: %@,", updateDate] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"EffectiveDate: %@,", effectiveDate] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Status: %@,", status] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StatusMessage: %@,", statusMessage] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ClientToken: %@,", clientToken] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservedInstancesModificationId release];
    [reservedInstancesIds release];
    [modificationResults release];
    [createDate release];
    [updateDate release];
    [effectiveDate release];
    [status release];
    [statusMessage release];
    [clientToken release];

    [super dealloc];
}


@end
