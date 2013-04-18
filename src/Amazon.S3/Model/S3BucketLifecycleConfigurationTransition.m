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

#import "S3BucketLifecycleConfigurationTransition.h"

#import "AmazonSDKUtil.h"


@implementation S3BucketLifecycleConfigurationTransition


@synthesize storageClass=_storageClass;
@synthesize transitionDays=_transitionDays;
@synthesize transitionDate=_transitionDate;

-(NSString *)toXml 
{
    NSMutableString *xml = [[NSMutableString alloc] init];
    
    [xml appendString:@"<Transition>"];
    [xml appendFormat:@"<StorageClass>%@</StorageClass>", self.storageClass];
    if (self.transitionDays > 0) {
        [xml appendFormat:@"<Days>%d</Days>", self.transitionDays];
    }
    else if (self.transitionDate != nil) {
        [xml appendFormat:@"<Date>%@</Date>", [self.transitionDate stringWithISO8061Format]];
    }
    [xml appendString:@"</Transition>"];
    
    
    NSString *retval = [NSString stringWithString:xml];
    [xml release];
    
    return retval;

}


-(id)initWithStorageClass:(NSString *)theStorageClass andTimeInDays:(NSInteger)theDays
{
    self = [super init];
    if (self) {
        self.storageClass = theStorageClass;
        self.transitionDays = theDays;
    }
    return self;
}

-(id)initWithStorageClass:(NSString *)theStorageClass andDate:(NSDate *)theDate
{
    self = [super init];
    if (self) {
        self.storageClass = theStorageClass;
        self.transitionDate = theDate;
    }
    return self;
}

-(id)initWithTimeInDays:(NSInteger)theDays
{
    return [self initWithStorageClass:@"GLACIER" andTimeInDays:theDays];
}

-(id)initWithDate:(NSDate *)theDate
{
    return [self initWithStorageClass:@"GLACIER" andDate:theDate];
}
    

-(void)dealloc
{
    self.storageClass = nil;
    self.transitionDate = nil;
    [super dealloc];
}


@end
