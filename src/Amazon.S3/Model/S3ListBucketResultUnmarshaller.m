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

#import "S3ListBucketResultUnmarshaller.h"
#import "S3ObjectSummaryUnmarshaller.h"
#import "S3ListObjectsResult.h"
#import "S3CommonPrefixesUnmarshaller.h"

@implementation S3ListBucketResultUnmarshaller

#pragma mark NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];

    if ([elementName isEqualToString:@"Contents"]) {
        [parser setDelegate:[[[S3ObjectSummaryUnmarshaller alloc] initWithCaller:self withParentObject:self.objectListing.objectSummaries withSetter:@selector(addObject:)] autorelease]];
    }

    if ([elementName isEqualToString:@"CommonPrefixes"]) {
        [parser setDelegate:[[[S3CommonPrefixesUnmarshaller alloc] initWithCaller:self withParentObject:self.objectListing.commonPrefixes withSetter:@selector(addObjectsFromArray:)] autorelease]];
    }
}

-(void) parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];

    if ([elementName isEqualToString:@"Name"]) {
        self.objectListing.bucketName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Prefix"]) {
        self.objectListing.prefix = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Marker"]) {
        self.objectListing.marker = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Delimiter"]) {
        self.objectListing.delimiter = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"IsTruncated"]) {
        if ( [self.currentText isEqualToString:@"false"]) {
            self.objectListing.isTruncated = NO;
        }
        else {
            self.objectListing.isTruncated = YES;
        }
        return;
    }

    if ([elementName isEqualToString:@"MaxKeys"]) {
        self.objectListing.maxKeys = [self.currentText integerValue];
        return;
    }

    if ([elementName isEqualToString:@"ListBucketResult"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.objectListing];
        }

        return;
    }
}


#pragma mark Unmarshalled object property

-(S3ListObjectsResult *)objectListing
{
    if (nil == objectListing)
    {
        objectListing = [[S3ListObjectsResult alloc] init];
    }
    return objectListing;
}

-(void)dealloc
{
    [objectListing release];
    [super dealloc];
}

@end



