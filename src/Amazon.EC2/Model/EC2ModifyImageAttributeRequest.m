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

#import "EC2ModifyImageAttributeRequest.h"


@implementation EC2ModifyImageAttributeRequest

@synthesize imageId;
@synthesize attribute;
@synthesize operationType;
@synthesize userIds;
@synthesize userGroups;
@synthesize productCodes;
@synthesize value;
@synthesize launchPermission;
@synthesize descriptionValue;


-(id)init
{
    if (self = [super init]) {
        imageId          = nil;
        attribute        = nil;
        operationType    = nil;
        userIds          = [[NSMutableArray alloc] initWithCapacity:1];
        userGroups       = [[NSMutableArray alloc] initWithCapacity:1];
        productCodes     = [[NSMutableArray alloc] initWithCapacity:1];
        value            = nil;
        launchPermission = nil;
        descriptionValue = nil;
    }

    return self;
}

-(id)initWithImageId:(NSString *)theImageId andAttribute:(NSString *)theAttribute
{
    if (self = [self init]) {
        self.imageId   = theImageId;
        self.attribute = theAttribute;
    }

    return self;
}


-(void)addUserId:(NSString *)userIdObject
{
    if (userIds == nil) {
        userIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [userIds addObject:userIdObject];
}

-(void)addUserGroup:(NSString *)userGroupObject
{
    if (userGroups == nil) {
        userGroups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [userGroups addObject:userGroupObject];
}

-(void)addProductCode:(NSString *)productCodeObject
{
    if (productCodes == nil) {
        productCodes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [productCodes addObject:productCodeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImageId: %@,", imageId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attribute: %@,", attribute] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OperationType: %@,", operationType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UserIds: %@,", userIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UserGroups: %@,", userGroups] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductCodes: %@,", productCodes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Value: %@,", value] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchPermission: %@,", launchPermission] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [imageId release];
    [attribute release];
    [operationType release];
    [userIds release];
    [userGroups release];
    [productCodes release];
    [value release];
    [launchPermission release];
    [descriptionValue release];

    [super dealloc];
}


@end
