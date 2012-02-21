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

#import "S3DeleteObjectsResponse.h"
#import "S3DeleteObjectsResultUnmarshaller.h"

@implementation S3DeleteObjectsResponse

@synthesize deletedObjects, deleteErrors;

-(void)processBody
{
    NSXMLParser                       *parser       = [[NSXMLParser alloc] initWithData:self.body];
    S3DeleteObjectsResultUnmarshaller *unmarshaller = [[S3DeleteObjectsResultUnmarshaller alloc] init];

    [parser setDelegate:unmarshaller];
    [parser parse];

    self.deletedObjects = [NSArray arrayWithArray:unmarshaller.deletedObjects];
    self.deleteErrors   = [NSArray arrayWithArray:unmarshaller.deleteErrors];

    [parser release];
    [unmarshaller release];
}

-(void)dealloc
{
    [deletedObjects release];
    [deleteErrors release];

    [super dealloc];
}

@end
