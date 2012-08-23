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


#import "AmazonServiceRequest.h"
#import "AmazonAuthUtils.h"

@implementation AmazonServiceRequest

@synthesize httpMethod;
@synthesize parameters;
@synthesize endpoint;
@synthesize userAgent;
@synthesize credentials;
@synthesize urlConnection;
@synthesize requestTag;
@synthesize serviceName;
@synthesize regionName;
@synthesize hostName;


-(void)sign
{
    [self setParameterValue:credentials.accessKey forKey:@"AWSAccessKeyId"];
    [self setParameterValue:@"2"                                        forKey:@"SignatureVersion"];
    [self setParameterValue:[NSDate ISO8061FormattedCurrentTimestamp]   forKey:@"Timestamp"];
    [self setParameterValue:@"HmacSHA256"                               forKey:@"SignatureMethod"];

    NSData   *dataToSign = [[AmazonAuthUtils getV2StringToSign:[NSURL URLWithString:self.endpoint] request:self] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *signature  = [AmazonAuthUtils HMACSign:dataToSign withKey:credentials.secretKey usingAlgorithm:kCCHmacAlgSHA256];

    [self setParameterValue:signature forKey:@"Signature"];
}

-(NSMutableURLRequest *)configureURLRequest
{
    if (self.credentials != nil && self.credentials.securityToken != nil) {
        [self setParameterValue:self.credentials.securityToken forKey:@"SecurityToken"];
    }

    [self.urlRequest setHTTPMethod:@"POST"];
    [self.urlRequest setHTTPBody:[[self queryString] dataUsingEncoding:NSUTF8StringEncoding]];
    [self.urlRequest setValue:self.userAgent forHTTPHeaderField:@"User-Agent"];

    NSURL *url = [NSURL URLWithString:self.endpoint];
    [urlRequest setURL:url];
    [urlRequest setValue:[url host] forHTTPHeaderField:@"Host"];


    return self.urlRequest;
}

-(NSString *)queryString
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    NSArray         *keys       = [[self parameters] allKeys];
    NSArray         *sortedKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
    for (NSInteger index = 0; index < [sortedKeys count]; index++) {
        NSString *key   = [sortedKeys objectAtIndex:index];
        NSString *value = (NSString *)[[self parameters] valueForKey:key];

        [buffer appendString:[AmazonSDKUtil urlEncode:key]];
        [buffer appendString:@"="];
        [buffer appendString:[AmazonSDKUtil urlEncode:value]];

        if (index < [sortedKeys count] - 1) {
            [buffer appendString:@"&"];
        }
    }

    return [buffer autorelease];
}

-(void)setHostName:(NSString *)theHostName 
{
    [hostName release];
    hostName = theHostName;
    [hostName retain];
}

-(NSString *)hostName
{
    // hostName was explicitly set
    if (hostName != nil) {
        return hostName;
    }
    
    NSRange startOfHost = [self.endpoint rangeOfString:@"://"];
    
    NSString *trimmed = [self.endpoint substringFromIndex:(startOfHost.location + 3)];
    NSRange endOfHost = [trimmed rangeOfString:@"/"];
    if (endOfHost.location == NSNotFound) {
        return trimmed;
    }

    return [trimmed substringToIndex:(endOfHost.location)];
}

-(void)setRegionName:(NSString *)theRegionName 
{
    [regionName release];
    regionName = theRegionName;
    [regionName retain];
}

-(NSString *)regionName
{
    // regionName was explicitly set
    if (regionName != nil) {
        return regionName;
    }
    // If we don't recognize the domain, just return the default
    if (![self.hostName hasSuffix:@".amazonaws.com"]) {
        return @"us-east-1";
    }
    else {
        NSRange  range             = [self.hostName rangeOfString:@".amazonaws.com"];
        NSString *serviceAndRegion = [self.hostName substringToIndex:range.location];
        
        NSString *separator = @".";
        if ( [serviceAndRegion hasPrefix:@"s3"]) {
            separator = @"-";
        }
        
        if ( [serviceAndRegion rangeOfString:separator].location == NSNotFound) {
            return @"us-east-1";
        }
        
        NSRange  index   = [serviceAndRegion rangeOfString:separator];
        NSString *region = [serviceAndRegion substringFromIndex:(index.location + 1)];
        if ( [region isEqualToString:@"us-gov"]) {
            return @"us-gov-west-1";
        }
        else {
            return region;
        }
    }
}

-(void)setServiceName:(NSString *)theServiceName
{
    [serviceName release];
    serviceName = theServiceName;
    [serviceName retain];
}

//TODO: this needs to be fleshed out to handle all cases
-(NSString *)serviceName
{
    // serviceName was explicitly set
    if (serviceName != nil) {
        return serviceName;
    }
    
    // If we don't recognize the domain, just return nil
    if (![self.hostName hasSuffix:@".amazonaws.com"]) {
        return nil;
    }
    else {
        NSRange  range             = [self.hostName rangeOfString:@".amazonaws.com"];
        NSString *serviceAndRegion = [self.hostName substringToIndex:range.location];
        
        NSString *separator = @".";
        if ( [serviceAndRegion hasPrefix:@"s3"]) {
            return @"s3";
        }
        
        if ( [serviceAndRegion rangeOfString:separator].location == NSNotFound) {
            return serviceAndRegion;
        }
        
        NSRange index = [serviceAndRegion rangeOfString:separator];
        return [serviceAndRegion substringToIndex:index.location];
    }
}

-(AmazonURLRequest *)urlRequest
{
    if (nil == urlRequest) {
        urlRequest = [[AmazonURLRequest alloc] init];
    }

    return urlRequest;
}

-(void)setUrlRequest:(AmazonURLRequest *)request
{
    if (nil != urlRequest)
    {
        [urlRequest release];
        urlRequest = nil;
    }
    urlRequest = [request retain];
}

-(void)setParameterValue:(NSString *)theValue forKey:(NSString *)theKey
{
    if (nil == parameters) {
        parameters = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    [parameters setValue:theValue forKey:theKey];
}

-(NSURL *)url
{
    return nil;
}

-(void)setDelegate:(id<AmazonServiceRequestDelegate> )aDelegate
{
    delegate = aDelegate;
}

-(id<AmazonServiceRequestDelegate> )delegate
{
    return delegate;
}

- (AmazonClientException *)validate
{
    return nil;
}

-(void)dealloc
{
    delegate = nil;
    [credentials release];
    [endpoint release];
    [urlRequest release];
    [parameters release];
    [userAgent release];
    [urlConnection release];
    [requestTag release];
    [serviceName release];
    [regionName release];
    [hostName release];

    [super dealloc];
}

@end
