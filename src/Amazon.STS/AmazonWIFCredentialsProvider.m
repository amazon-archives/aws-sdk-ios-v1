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

#import "AmazonWIFCredentialsProvider.h"

@interface AmazonWIFCredentialsProvider ()

@property (nonatomic, retain) AmazonSecurityTokenServiceClient *sts;
@property (nonatomic, retain) AmazonCredentials                *stsCredentials;
@property (nonatomic, retain) NSDate                           *expiration;
@property (nonatomic, retain) NSString                         *roleArn;
@property (nonatomic, retain) NSString                         *token;
@property (nonatomic, retain) NSString                         *providerId;

@end

@implementation AmazonWIFCredentialsProvider

@synthesize sts=_sts;
@synthesize stsCredentials=_stsCredentials;
@synthesize expiration=_expiration;
@synthesize sessionLength=_sessionLength;
@synthesize subjectFromWIF=_subjectFromWIF;
@synthesize roleArn=_roleArn;
@synthesize token=_token;
@synthesize providerId=_providerId;
@synthesize refreshThreshold=_refreshThreshold;


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
            SecurityTokenServiceAssumeRoleWithWebIdentityRequest *request = [[SecurityTokenServiceAssumeRoleWithWebIdentityRequest alloc] init];
            request.durationSeconds = [NSNumber numberWithInteger:self.sessionLength];
            request.roleArn = self.roleArn;
            request.webIdentityToken = self.token;
            request.providerId = self.providerId;
            request.roleSessionName = @"AmazonWIFCredentialsProvider";
            SecurityTokenServiceAssumeRoleWithWebIdentityResponse *response = [self.sts assumeRoleWithWebIdentity:request];
            
            [request release];
            
            self.stsCredentials = [[[AmazonCredentials alloc] initWithAccessKey:response.credentials.accessKeyId
                                                            withSecretKey:response.credentials.secretAccessKey
                                                        withSecurityToken:response.credentials.sessionToken] autorelease];
            
            _subjectFromWIF = response.subjectFromWebIdentityToken;
            [_subjectFromWIF retain];
            
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
        NSDate *soon = [NSDate dateWithTimeIntervalSinceNow:(self.refreshThreshold)];
        if ( [soon compare:self.expiration] == NSOrderedDescending) {
            return YES;
        }
        else {
            return NO;
        }
    }
}



-(id)initWithRole:(NSString *)roleArn andWebIdentityToken:(NSString *)token fromProvider:(NSString *)providerId
{
    AmazonSecurityTokenServiceClient *stsClient = [[AmazonSecurityTokenServiceClient new] autorelease];
    return [self initWithClient:stsClient andRole:roleArn andWebIdentityToken:token fromProvider:providerId];
}

-(id)initWithClient:(AmazonSecurityTokenServiceClient *)theClient andRole:(NSString *)roleArn andWebIdentityToken:(NSString *)token fromProvider:(NSString *)providerId
{
    self = [super init];
    if (self)
    {
        self.roleArn = roleArn;
        self.token = token;
        self.providerId = providerId;
        self.sessionLength = 3600;
        self.refreshThreshold = 500;
        self.sts = theClient;
        
        // force one call to refresh so our identity will be visible
        [self refresh];
    }
    return self;
}

-(void)dealloc
{
    self.expiration = nil;
    self.sts = nil;
    self.stsCredentials = nil;
    self.roleArn = nil;
    self.providerId = nil;
    self.token = nil;
    [_subjectFromWIF release];
    [super dealloc];
}

@end
