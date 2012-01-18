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

#import "S3ListMultipartUploadsResponse.h"


@implementation S3ListMultipartUploadsResponse

@synthesize listMultipartUploadsResult;

-(void)processBody
{
    NSXMLParser                              *parser       = [[NSXMLParser alloc] initWithData:self.body];
    S3ListMultipartUploadsResultUnmarshaller *unmarshaller = [[S3ListMultipartUploadsResultUnmarshaller alloc] init];

    [parser setDelegate:unmarshaller];
    [parser parse];

    self.listMultipartUploadsResult = unmarshaller.listMultipartUploadsResult;

    [parser release];
    [unmarshaller release];
}

-(void)dealloc
{
    [listMultipartUploadsResult release];

    [super dealloc];
}

@end
