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

#import "EC2CreateTagsRequestMarshaller.h"

@implementation EC2CreateTagsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CreateTagsRequest *)createTagsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CreateTags"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[createTagsRequest delegate]];
    [request setCredentials:[createTagsRequest credentials]];
    [request setEndpoint:[createTagsRequest requestEndpoint]];
    [request setRequestTag:[createTagsRequest requestTag]];


    if (createTagsRequest != nil) {
        int resourcesListIndex = 1;
        for (NSString *resourcesListValue in createTagsRequest.resources) {
            if (resourcesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", resourcesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ResourceId", resourcesListIndex]];
            }

            resourcesListIndex++;
        }
    }

    if (createTagsRequest != nil) {
        int tagsListIndex = 1;
        for (EC2Tag *tagsListValue in createTagsRequest.tags) {
            if (tagsListValue != nil) {
                if (tagsListValue.key != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.key] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Tag", tagsListIndex, @"Key"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.value != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.value] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Tag", tagsListIndex, @"Value"]];
                }
            }

            tagsListIndex++;
        }
    }


    return [request autorelease];
}

@end

