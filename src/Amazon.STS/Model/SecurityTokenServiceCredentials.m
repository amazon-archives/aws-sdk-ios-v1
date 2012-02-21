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

#import "SecurityTokenServiceCredentials.h"


@implementation SecurityTokenServiceCredentials

@synthesize accessKeyId;
@synthesize secretAccessKey;
@synthesize sessionToken;
@synthesize expiration;


-(id)init
{
    if (self = [super init]) {
        accessKeyId     = nil;
        secretAccessKey = nil;
        sessionToken    = nil;
        expiration      = nil;
    }

    return self;
}

-(id)initWithAccessKeyId:(NSString *)theAccessKeyId andSecretAccessKey:(NSString *)theSecretAccessKey andSessionToken:(NSString *)theSessionToken andExpiration:(NSDate *)theExpiration
{
    if (self = [self init]) {
        self.accessKeyId     = theAccessKeyId;
        self.secretAccessKey = theSecretAccessKey;
        self.sessionToken    = theSessionToken;
        self.expiration      = theExpiration;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AccessKeyId: %@,", accessKeyId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SecretAccessKey: %@,", secretAccessKey] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SessionToken: %@,", sessionToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Expiration: %@,", expiration] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [accessKeyId release];
    [secretAccessKey release];
    [sessionToken release];
    [expiration release];

    [super dealloc];
}


@end
