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

#import "EC2DeleteTagsRequestMarshaller.h"

@implementation EC2DeleteTagsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DeleteTagsRequest *)deleteTagsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DeleteTags"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[deleteTagsRequest delegate]];
    [request setCredentials:[deleteTagsRequest credentials]];
    [request setEndpoint:[deleteTagsRequest requestEndpoint]];
    [request setRequestTag:[deleteTagsRequest requestTag]];


    if (deleteTagsRequest != nil) {
        int resourcesListIndex = 1;
        for (NSString *resourcesListValue in deleteTagsRequest.resources) {
            if (resourcesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", resourcesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ResourceId", resourcesListIndex]];
            }

            resourcesListIndex++;
        }
    }

    if (deleteTagsRequest != nil) {
        int tagsListIndex = 1;
        for (EC2Tag *tagsListValue in deleteTagsRequest.tags) {
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

