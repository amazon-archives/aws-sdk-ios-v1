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

#import "S3BucketVersioningConfiguration.h"


@implementation S3BucketVersioningConfiguration

@synthesize status;
@synthesize isMfaDeleteEnabled;


-(id)initWithStatus:(NSString *)theStatus
{
    self = [super init];
    if (self) {
        self.status             = theStatus;
        self.isMfaDeleteEnabled = NO;
    }
    return self;
}

-(NSString *)toXml
{
    NSMutableString *xml = [[NSMutableString alloc] init];

    [xml appendString:@"<VersioningConfiguration xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">"];
    [xml appendFormat:@"<Status>%@</Status>", self.status];

    if (self.isMfaDeleteEnabled) {
        [xml appendFormat:@"<MfaDelete>Enabled</MfaDelete>"];
    }
    else {
        [xml appendFormat:@"<MfaDelete>Disabled</MfaDelete>"];
    }

    [xml appendString:@"</VersioningConfiguration>"];


    NSString *retval = [NSString stringWithString:xml];
    [xml release];

    return retval;
}

-(void)dealloc
{
    [status release];
    [super dealloc];
}

@end
