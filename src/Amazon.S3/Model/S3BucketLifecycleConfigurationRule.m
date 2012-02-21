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

#import "S3BucketLifecycleConfigurationRule.h"

@implementation S3BucketLifecycleConfigurationRule

@synthesize ruleId;
@synthesize status;
@synthesize prefix;
@synthesize expirationInDays;

-(NSString *)toXml 
{
    NSMutableString *xml = [[NSMutableString alloc] init];
    
    [xml appendString:@"<Rule>"];
    [xml appendFormat:@"<ID>%@</ID>", ruleId];
    [xml appendFormat:@"<Prefix>%@</Prefix>", prefix];
    [xml appendFormat:@"<Status>%@</Status>", status];
    [xml appendFormat:@"<Expiration><Days>%d</Days></Expiration>", expirationInDays];
    [xml appendString:@"</Rule>"];
    
    
    NSString *retval = [NSString stringWithString:xml];
    [xml release];
    
    return retval;

}

-(id)initWithId:(NSString *)theRuleId andPrefix:(NSString *)thePrefix andExpirationInDays:(NSInteger) theExpiration andStatus:(NSString *)theStatus
{
    self = [super init];
    if (self) {
        self.ruleId           = theRuleId;
        self.prefix           = thePrefix;
        self.status           = theStatus;
        self.expirationInDays = theExpiration;
    }
    
    return self;
}

-(BOOL)isEnabled
{
    return [status isEqualToString:S3_BUCKET_LIFECYCLE_RULE_ENABLED];
}


-(void)dealloc
{
    [ruleId release];
    [prefix release];
    [status release];
    [super dealloc];
}


@end
