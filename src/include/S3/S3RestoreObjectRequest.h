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

#import <Foundation/Foundation.h>

#import "../AmazonClientException.h"

#import "S3Request.h"
#import "S3Constants.h"

/** contains the parameters used for the to restore object from Amazon Glacier.
 *
 */
@interface S3RestoreObjectRequest:S3Request {
}

-(id)initWithKey:(NSString *)aKey withBucket:(NSString *)aBucket withDays:(NSInteger)theDays;

-(NSString *) toXml;

/** The number of days the restored object should remain active for **/
@property (nonatomic, assign) NSInteger days;

@end
