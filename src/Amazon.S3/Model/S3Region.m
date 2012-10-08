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

#import "S3Region.h"


@implementation S3Region

@synthesize stringValue;


-(id)initWithStringValue:(NSString *)value
{
    self = [super init];
    if (self) {
        stringValue = [value retain];
    }
    return self;
}

+(S3Region *)USStandard
{
    static S3Region *std = nil;
    
    if (std == nil) {
        std = [[S3Region alloc] initWithStringValue:@""];
    }
    return std;
}

+(S3Region *)USWest
{
    static S3Region *west = nil;
    
    if (west == nil) {
        west = [[S3Region alloc] initWithStringValue:kS3RegionUSWest1];
    }
    return west;
}

+(S3Region *)USWest2
{
    static S3Region *west2 = nil;
    
    if (west2 == nil) {
        west2 = [[S3Region alloc] initWithStringValue:kS3RegionUSWest2];
    }
    return west2;
}

+(S3Region *)EUIreland
{
    static S3Region *eu = nil;
    
    if (eu == nil) {
        eu = [[S3Region alloc] initWithStringValue:kS3RegionEU];
    }
    return eu;
}

+(S3Region *)EUWest1
{
    static S3Region *euwest1 = nil;
    
    if (euwest1 == nil) {
        euwest1 = [[S3Region alloc] initWithStringValue:kS3RegionEUWest1];
    }
    return euwest1;
}

+(S3Region *)APSingapore
{
    static S3Region *ap = nil;
    
    if (ap == nil) {
        ap = [[S3Region alloc] initWithStringValue:kS3RegionAPSoutheast1];
    }
    return ap;
}

+(S3Region *)APJapan
{
    static S3Region *ap = nil;
    
    if (ap == nil) {
        ap = [[S3Region alloc] initWithStringValue:kS3RegionAPNortheast1];
    }
    return ap;
}

+(S3Region *)SASaoPaulo
{
    static S3Region *ap = nil;
    
    if (ap == nil) {
        ap = [[S3Region alloc] initWithStringValue:kS3RegionSAEast1];
    }
    return ap;
}

+(S3Region *)regionWithString:(NSString *)regionName
{
    if ([regionName isEqual:@""]) {
        return [S3Region USStandard];
    }
    else if ([regionName isEqual:kS3RegionUSWest1]) {
        return [S3Region USWest];
    }
    else if ([regionName isEqual:kS3RegionUSWest2]) {
        return [S3Region USWest2];
    }
    else if ([regionName isEqual:kS3RegionEUWest1]) {
        return [S3Region EUWest1];
    }
    else if ([regionName isEqual:kS3RegionEU]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        return [S3Region EUIreland];
#pragma clang diagnostic pop
    }
    else if ([regionName isEqual:kS3RegionAPSoutheast1]) {
        return [S3Region APSingapore];
    }
    else if ([regionName isEqual:kS3RegionAPNortheast1]) {
        return [S3Region APJapan];
    }
    else if ([regionName isEqual:kS3RegionSAEast1]) {
        return [S3Region SASaoPaulo];
    }
    
    AMZLog(@"Unknown S3 region name: '%@'.", regionName);
    return [[[S3Region alloc] initWithStringValue:regionName] autorelease];
}

-(BOOL)isEqual:(id)object
{
    if (![object respondsToSelector:@selector(stringValue)]) {
        return NO;
    }
    return ([self.stringValue isEqual:[object stringValue]] ||
            ([self.stringValue isEqual:kS3RegionEU] && [[object stringValue] isEqual:kS3RegionEUWest1]) ||
            ([self.stringValue isEqual:kS3RegionEUWest1] && [[object stringValue] isEqual:kS3RegionEU]));
}

-(NSString *)description
{
    return stringValue;
}

-(void)dealloc
{
    [stringValue release];
    [super dealloc];
}
@end
