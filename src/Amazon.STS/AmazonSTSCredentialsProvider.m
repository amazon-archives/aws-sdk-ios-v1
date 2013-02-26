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

#import "AmazonSTSCredentialsProvider.h"

@interface AmazonSTSCredentialsProvider ()

@property (nonatomic, retain) AmazonSecurityTokenServiceClient *sts;
@property (nonatomic, retain) AmazonCredentials                *stsCredentials;
@property (nonatomic, retain) NSDate                           *expiration;

@end

@implementation AmazonSTSCredentialsProvider

@synthesize sts=_sts;
@synthesize stsCredentials=_stsCredentials;
@synthesize expiration=_expiration;
@synthesize sessionLength=_sessionLength;


-(AmazonCredentials *)credentials
{
    if ((self.stsCredentials == nil) || ([self isExpired])) {
        [self refresh];
    }
    return self.stsCredentials;
}

-(void)refresh {
    @synchronized(self) {
        AMZLogDebug(@"Refreshing credentials from STS.");
        self.stsCredentials = nil;
        self.expiration = nil;
        
        @try {
            SecurityTokenServiceGetSessionTokenRequest *request = [[SecurityTokenServiceGetSessionTokenRequest alloc] init];
            request.durationSeconds = [NSNumber numberWithInteger:self.sessionLength];
            SecurityTokenServiceGetSessionTokenResponse *response = [self.sts getSessionToken:request];
            
            [request release];
            
            self.stsCredentials = [[[AmazonCredentials alloc] initWithAccessKey:response.credentials.accessKeyId
                                                            withSecretKey:response.credentials.secretAccessKey
                                                        withSecurityToken:response.credentials.sessionToken] autorelease];
            
            self.expiration = response.credentials.expiration;
        }
        @catch (AmazonServiceException *exception) {
            AMZLog(@"Error refreshing credentials: %@", exception);
        }
    }
}

-(BOOL)isExpired
{
    @synchronized(self) {
        NSDate *soon = [NSDate dateWithTimeIntervalSinceNow:(15 * 60)];
        if ( [soon compare:self.expiration] == NSOrderedDescending) {
            return YES;
        }
        else {
            return NO;
        }
    }
}

-(id)initWithAccessKey:(NSString *)accessKey withSecretKey:(NSString *)secretKey
{
    self = [super init];
    if (self)
    {
        AmazonCredentials *credentials = [[[AmazonCredentials alloc] initWithAccessKey:accessKey withSecretKey:secretKey] autorelease];
        [self initWithCredentials:credentials];
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    self = [super init];
    if (self)
    {
        AmazonSecurityTokenServiceClient *client = [[AmazonSecurityTokenServiceClient alloc] initWithCredentials:theCredentials];
        [self initWithClient:client];
        [client release];
    }
    return self;
}

-(id)initWithClient:(AmazonSecurityTokenServiceClient *)theClient
{
    self = [super init];
    if (self)
    {
        self.sts = theClient;
        self.sessionLength = 3600;
    }
    
    return self;
}

-(void)dealloc
{
    self.expiration = nil;
    self.sts = nil;
    self.stsCredentials = nil;
    [super dealloc];
}

@end
