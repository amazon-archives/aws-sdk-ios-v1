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

#import "DynamoDBProjectionUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"

#import "AmazonSDKUtil.h"


@implementation DynamoDBProjectionUnmarshaller


+(DynamoDBProjection *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBProjection *projection = [[[DynamoDBProjection alloc] init] autorelease];



    if ([jsonObject valueForKey:@"ProjectionType"] != nil) {
        projection.projectionType = [jsonObject valueForKey:@"ProjectionType"];
    }


    NSArray *nonKeyAttributesArray = [jsonObject valueForKey:@"NonKeyAttributes"];
    for (NSString *memberObject in nonKeyAttributesArray) {
        [projection.nonKeyAttributes addObject:memberObject];
    }

    return projection;
}

@end
