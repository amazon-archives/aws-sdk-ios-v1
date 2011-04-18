/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "ElasticLoadBalancingPolicies.h"


@implementation ElasticLoadBalancingPolicies

@synthesize appCookieStickinessPolicies;
@synthesize lBCookieStickinessPolicies;


-(id)init
{
    if (self = [super init]) {
        appCookieStickinessPolicies = [[NSMutableArray alloc] initWithCapacity:1];
        lBCookieStickinessPolicies  = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addAppCookieStickinessPolicy:(ElasticLoadBalancingAppCookieStickinessPolicy *)appCookieStickinessPolicy
{
    if (appCookieStickinessPolicies == nil) {
        appCookieStickinessPolicies = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [appCookieStickinessPolicies addObject:appCookieStickinessPolicy];
}

-(void)addLBCookieStickinessPolicy:(ElasticLoadBalancingLBCookieStickinessPolicy *)lBCookieStickinessPolicy
{
    if (lBCookieStickinessPolicies == nil) {
        lBCookieStickinessPolicies = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [lBCookieStickinessPolicies addObject:lBCookieStickinessPolicy];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AppCookieStickinessPolicies: %@,", appCookieStickinessPolicies] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LBCookieStickinessPolicies: %@,", lBCookieStickinessPolicies] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [appCookieStickinessPolicies release];
    [lBCookieStickinessPolicies release];

    [super dealloc];
}


@end
