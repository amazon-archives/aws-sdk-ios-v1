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

#import "S3AccessControlList.h"
#import "S3Constants.h"


@implementation S3AccessControlList

@synthesize owner;

-(void)addGrant:(S3Grant *)aGrant
{
    if (grantList == nil) {
        grantList = [[NSMutableArray alloc] init];
    }

    [grantList addObject:aGrant];
}

-(id)initWithOwner:(S3Owner *)theOwner
{
    self = [super init];
    if (self) {
        self.owner = theOwner;
    }
    return self;
}

-(NSArray *)grantList
{
    return [NSArray arrayWithArray:grantList];
}

-(NSString *)toXml
{
    NSMutableString *xml = [[NSMutableString alloc] init];

    [xml appendFormat:@"<AccessControlPolicy><Owner><ID>%@</ID><DisplayName>%@</DisplayName></Owner>",
     self.owner.ID, self.owner.displayName];

    [xml appendString:@"<AccessControlList>"];
    for (S3Grant *g in grantList)
    {
        [xml appendString:[g toXml]];
    }

    [xml appendString:@"</AccessControlList></AccessControlPolicy>"];

    NSString *retval = [NSString stringWithString:xml];

    [xml release];

    return retval;
}

-(NSDictionary *)toHeaders
{
    NSMutableString *rPerm    = nil;
    NSMutableString *wPerm    = nil;
    NSMutableString *racpPerm = nil;
    NSMutableString *wacpPerm = nil;
    NSMutableString *fPerm    = nil;
    
    for (S3Grant *g in grantList)
    {
        NSString *grantee = @"";
        if (!((g.grantee.ID == nil) || [g.grantee.ID isEqualToString:@""])) {
            grantee = [NSString stringWithFormat:@"id=%@", g.grantee.ID];
        }
        else if (!((g.grantee.URI == nil) || [g.grantee.URI isEqualToString:@""])) {
            grantee = [NSString stringWithFormat:@"uri=%@", g.grantee.URI];
        }
        else if (!((g.grantee.emailAddress == nil) || [g.grantee.emailAddress isEqualToString:@""])) {
            grantee = [NSString stringWithFormat:@"emailaddress=%@", g.grantee.emailAddress];
        }
        
        if ( g.permission == [S3Permission readPermission] ) {
            if ( rPerm == nil ) {
                rPerm = [NSMutableString stringWithString:grantee];
            }
            else {
                [rPerm appendFormat:@", %@", grantee];
            }
        }
        else if (g.permission == [S3Permission writePermission] ) {
            if ( wPerm == nil ) {
                wPerm = [NSMutableString stringWithString:grantee];
            }
            else {
                [wPerm appendFormat:@", %@", grantee];
            }
        }
        else if (g.permission == [S3Permission readAcpPermission] ) {
            if ( racpPerm == nil ) {
                racpPerm = [NSMutableString stringWithString:grantee];
            }
            else {
                [racpPerm appendFormat:@", %@", grantee];
            }
        }
        else if (g.permission == [S3Permission writeAcpPermission] ) {
            if ( rPerm == nil ) {
                rPerm = [NSMutableString stringWithString:grantee];
            }
            else {
                [racpPerm appendFormat:@", %@", grantee];
            }
        }
        else if (g.permission == [S3Permission fullControlPermission] ) {
            if ( fPerm == nil ) {
                fPerm = [NSMutableString stringWithString:grantee];
            }
            else {
                [fPerm appendFormat:@", %@", grantee];
            }
        }
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:5];
    if (rPerm != nil) {
        [dict setValue:rPerm forKey:kHttpHdrAmzGrantRead];
    }
    if (wPerm != nil) {
        [dict setValue:wPerm forKey:kHttpHdrAmzGrantWrite];
    }
    if (racpPerm != nil) {
        [dict setValue:racpPerm forKey:kHttpHdrAmzGrantReadAcp];
    }
    if (wacpPerm != nil) {
        [dict setValue:wacpPerm forKey:kHttpHdrAmzGrantWriteAcp];
    }
    if (fPerm != nil) {
        [dict setValue:fPerm forKey:kHttpHdrAmzGrantFullControl];
    }
    
    return dict;
}

-(void)dealloc
{
    [owner release];
    [grantList release];

    [super dealloc];
}

@end
