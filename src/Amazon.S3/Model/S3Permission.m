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

#import "S3Permission.h"

@implementation S3Permission

-(id)initWithXmlCode:(NSString *)code
{
    self = [super init];
    if (self) {
        xmlValue = [code retain];
    }
    return self;
}

+(S3Permission *)permissionWithString:(NSString *)code
{
    if ([code isEqualToString:kS3AclPermissionRead]) {
        return [S3Permission readPermission];
    }
    if ([code isEqualToString:kS3AclPermissionWrite]) {
        return [S3Permission writePermission];
    }
    if ([code isEqualToString:kS3AclPermissionFullControl]) {
        return [S3Permission fullControlPermission];
    }
    if ([code isEqualToString:kS3AclPermissionReadAcp]) {
        return [S3Permission readAcpPermission];
    }
    if ([code isEqualToString:kS3AclPermissionWriteAcp]) {
        return [S3Permission writeAcpPermission];
    }
    return nil;
}

+(S3Permission *)readPermission
{
    static S3Permission *thisPermission = nil;

    if (!thisPermission) {
        thisPermission = [[S3Permission alloc] initWithXmlCode:kS3AclPermissionRead];
    }
    return thisPermission;
}

+(S3Permission *)writePermission
{
    static S3Permission *thisPermission = nil;

    if (!thisPermission) {
        thisPermission = [[S3Permission alloc] initWithXmlCode:kS3AclPermissionWrite];
    }
    return thisPermission;
}

+(S3Permission *)fullControlPermission
{
    static S3Permission *thisPermission = nil;

    if (!thisPermission) {
        thisPermission = [[S3Permission alloc] initWithXmlCode:kS3AclPermissionFullControl];
    }
    return thisPermission;
}

+(S3Permission *)readAcpPermission
{
    static S3Permission *thisPermission = nil;

    if (!thisPermission) {
        thisPermission = [[S3Permission alloc] initWithXmlCode:kS3AclPermissionReadAcp];
    }
    return thisPermission;
}

+(S3Permission *)writeAcpPermission
{
    static S3Permission *thisPermission = nil;

    if (!thisPermission) {
        thisPermission = [[S3Permission alloc] initWithXmlCode:kS3AclPermissionWriteAcp];
    }
    return thisPermission;
}

-(NSString *)description
{
    return xmlValue;
}

-(void)dealloc
{
    [xmlValue release];
    [super dealloc];
}



@end
