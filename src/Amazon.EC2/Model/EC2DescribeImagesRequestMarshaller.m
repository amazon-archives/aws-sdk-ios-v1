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

#import "EC2DescribeImagesRequestMarshaller.h"

@implementation EC2DescribeImagesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeImagesRequest *)describeImagesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeImages"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeImagesRequest delegate]];
    [request setCredentials:[describeImagesRequest credentials]];
    [request setEndpoint:[describeImagesRequest requestEndpoint]];
    [request setRequestTag:[describeImagesRequest requestTag]];


    if (describeImagesRequest != nil) {
        int imageIdsListIndex = 1;
        for (NSString *imageIdsListValue in describeImagesRequest.imageIds) {
            if (imageIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", imageIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ImageId", imageIdsListIndex]];
            }

            imageIdsListIndex++;
        }
    }

    if (describeImagesRequest != nil) {
        int ownersListIndex = 1;
        for (NSString *ownersListValue in describeImagesRequest.owners) {
            if (ownersListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", ownersListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"Owner", ownersListIndex]];
            }

            ownersListIndex++;
        }
    }

    if (describeImagesRequest != nil) {
        int executableUsersListIndex = 1;
        for (NSString *executableUsersListValue in describeImagesRequest.executableUsers) {
            if (executableUsersListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", executableUsersListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ExecutableBy", executableUsersListIndex]];
            }

            executableUsersListIndex++;
        }
    }

    if (describeImagesRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeImagesRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Filter", filtersListIndex, @"Name"]];
                }
            }

            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"Filter", filtersListIndex, @"Value", valuesListIndex]];
                    }

                    valuesListIndex++;
                }
            }

            filtersListIndex++;
        }
    }


    return [request autorelease];
}

@end

