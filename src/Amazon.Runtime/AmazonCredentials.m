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

#import "AmazonCredentials.h"

@implementation AmazonCredentials

@synthesize accessKey = _accessKey;
@synthesize secretKey = _secretKey;
@synthesize securityToken = _securityToken;

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [self init]) {
        self.accessKey = theAccessKey;
        self.secretKey = theSecretKey;
    }
    return self;
}

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey withSecurityToken:(NSString *)theSecurityToken
{
    if (self = [self init]) {
        self.accessKey     = theAccessKey;
        self.secretKey     = theSecretKey;
        self.securityToken = theSecurityToken;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    AmazonCredentials *o = [[[self class] allocWithZone:zone] init];
    o.accessKey = [[self.accessKey copy] autorelease];
    o.secretKey = [[self.secretKey copy] autorelease];
    o.securityToken = [[self.securityToken copy] autorelease];

    return o;
}

-(void)dealloc
{
    [_accessKey release];
    [_secretKey release];
    [_securityToken release];
    
    [super dealloc];
}

@end

