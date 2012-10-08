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

#import "EC2ModifyImageAttributeRequestMarshaller.h"

@implementation EC2ModifyImageAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ModifyImageAttributeRequest *)modifyImageAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ModifyImageAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[modifyImageAttributeRequest delegate]];
    [request setCredentials:[modifyImageAttributeRequest credentials]];
    [request setEndpoint:[modifyImageAttributeRequest requestEndpoint]];
    [request setRequestTag:[modifyImageAttributeRequest requestTag]];

    if (modifyImageAttributeRequest != nil) {
        if (modifyImageAttributeRequest.imageId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyImageAttributeRequest.imageId] forKey:[NSString stringWithFormat:@"%@", @"ImageId"]];
        }
    }
    if (modifyImageAttributeRequest != nil) {
        if (modifyImageAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyImageAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }
    if (modifyImageAttributeRequest != nil) {
        if (modifyImageAttributeRequest.operationType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyImageAttributeRequest.operationType] forKey:[NSString stringWithFormat:@"%@", @"OperationType"]];
        }
    }

    if (modifyImageAttributeRequest != nil) {
        int userIdsListIndex = 1;
        for (NSString *userIdsListValue in modifyImageAttributeRequest.userIds) {
            if (userIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", userIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"UserId", userIdsListIndex]];
            }

            userIdsListIndex++;
        }
    }

    if (modifyImageAttributeRequest != nil) {
        int userGroupsListIndex = 1;
        for (NSString *userGroupsListValue in modifyImageAttributeRequest.userGroups) {
            if (userGroupsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", userGroupsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"UserGroup", userGroupsListIndex]];
            }

            userGroupsListIndex++;
        }
    }

    if (modifyImageAttributeRequest != nil) {
        int productCodesListIndex = 1;
        for (NSString *productCodesListValue in modifyImageAttributeRequest.productCodes) {
            if (productCodesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", productCodesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ProductCode", productCodesListIndex]];
            }

            productCodesListIndex++;
        }
    }
    if (modifyImageAttributeRequest != nil) {
        if (modifyImageAttributeRequest.value != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyImageAttributeRequest.value] forKey:[NSString stringWithFormat:@"%@", @"Value"]];
        }
    }
    if (modifyImageAttributeRequest != nil) {
        EC2LaunchPermissionModifications *launchPermission = modifyImageAttributeRequest.launchPermission;

        if (launchPermission != nil) {
            int addListIndex = 1;
            for (EC2LaunchPermission *addListValue in launchPermission.add) {
                if (addListValue != nil) {
                    if (addListValue.userId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", addListValue.userId] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchPermission", @"Add", addListIndex, @"UserId"]];
                    }
                }
                if (addListValue != nil) {
                    if (addListValue.group != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", addListValue.group] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchPermission", @"Add", addListIndex, @"Group"]];
                    }
                }

                addListIndex++;
            }
        }

        if (launchPermission != nil) {
            int removeListIndex = 1;
            for (EC2LaunchPermission *removeListValue in launchPermission.remove) {
                if (removeListValue != nil) {
                    if (removeListValue.userId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", removeListValue.userId] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchPermission", @"Remove", removeListIndex, @"UserId"]];
                    }
                }
                if (removeListValue != nil) {
                    if (removeListValue.group != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", removeListValue.group] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchPermission", @"Remove", removeListIndex, @"Group"]];
                    }
                }

                removeListIndex++;
            }
        }
    }
    if (modifyImageAttributeRequest != nil) {
        if (modifyImageAttributeRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyImageAttributeRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description.Value"]];
        }
    }


    return [request autorelease];
}

@end

