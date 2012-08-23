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

#import "S3ListObjectsResponse.h"

@implementation S3ListObjectsResponse

@synthesize listObjectsResult;

-(void)processBody
{
    NSString *errDescription = nil;

    NSString *xmlString = [[NSString alloc] initWithData:self.body encoding:NSUTF8StringEncoding];
    NSData   *xmlData   = [[xmlString stringByReplacingOccurrencesOfString:@"&#x13;" withString:@""]
                           dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];

    [xmlString release];

    NSXMLParser                    *parser       = [[NSXMLParser alloc] initWithData:xmlData];
    S3ListBucketResultUnmarshaller *unmarshaller = [[S3ListBucketResultUnmarshaller alloc] init];
    [parser setDelegate:unmarshaller];
    [parser parse];

    if (parser.parserError != nil) {
        errDescription = [parser.parserError description];
    }

    self.listObjectsResult = unmarshaller.objectListing;

    [parser release];
    [unmarshaller release];

    if (errDescription != nil) {
        if(exception == nil) {
            exception = [AmazonClientException exceptionWithMessage :[NSString stringWithFormat:@"Error parsing XML response: %@", errDescription]];
        }
    }
}

-(void)dealloc
{
    [listObjectsResult release];
    [super dealloc];
}

@end
