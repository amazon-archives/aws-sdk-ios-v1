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

#import "S3BucketLifecycleConfigurationRule.h"

#import "AmazonSDKUtil.h"

@implementation S3BucketLifecycleConfigurationRule

@synthesize ruleId=_ruleId;
@synthesize status=_status;
@synthesize prefix=_prefix;
@synthesize expirationInDays;
@synthesize expirationDate=_expirationDate;
@synthesize transitions=_transitions;

-(NSString *)toXml 
{
    NSMutableString *xml = [[NSMutableString alloc] init];
    
    [xml appendString:@"<Rule>"];
    [xml appendFormat:@"<ID>%@</ID>", self.ruleId];
    [xml appendFormat:@"<Prefix>%@</Prefix>", self.prefix];
    [xml appendFormat:@"<Status>%@</Status>", self.status];
    if (self.expirationInDays > 0) {
        [xml appendFormat:@"<Expiration><Days>%d</Days></Expiration>", self.expirationInDays];
    }
    else if (self.expirationDate != nil) {
        [xml appendFormat:@"<Expiration><Date>%@</Date></Expiration>", [self.expirationDate stringWithISO8061Format]];
    }
    for (S3BucketLifecycleConfigurationTransition *transition in self.transitions) {
        [xml appendString:[transition toXml]];
    }
    [xml appendString:@"</Rule>"];
    
    
    NSString *retval = [NSString stringWithString:xml];
    [xml release];
    
    return retval;

}


-(id)initWithId:(NSString *)theRuleId andPrefix:(NSString *)thePrefix andStatus:(NSString *)theStatus
{
    return [self initWithId:theRuleId andPrefix:thePrefix andExpirationDate:nil andStatus:theStatus];
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

-(id)initWithId:(NSString *)theRuleId andPrefix:(NSString *)thePrefix andExpirationDate:(NSDate *) theExpirationDate andStatus:(NSString *)theStatus
{
    self = [super init];
    if (self) {
        self.ruleId           = theRuleId;
        self.prefix           = thePrefix;
        self.status           = theStatus;
        self.expirationDate   = theExpirationDate;
    }
    
    return self;
}

-(BOOL)isEnabled
{
    return [status isEqualToString:S3_BUCKET_LIFECYCLE_RULE_ENABLED];
}


-(void)dealloc
{
    self.ruleId = nil;
    self.status = nil;
    self.prefix = nil;
    self.expirationDate = nil;
    [super dealloc];
}


@end
