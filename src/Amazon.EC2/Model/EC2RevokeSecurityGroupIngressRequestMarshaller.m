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

#import "EC2RevokeSecurityGroupIngressRequestMarshaller.h"

@implementation EC2RevokeSecurityGroupIngressRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2RevokeSecurityGroupIngressRequest *)revokeSecurityGroupIngressRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"RevokeSecurityGroupIngress"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[revokeSecurityGroupIngressRequest delegate]];
    [request setCredentials:[revokeSecurityGroupIngressRequest credentials]];
    [request setEndpoint:[revokeSecurityGroupIngressRequest requestEndpoint]];
    [request setRequestTag:[revokeSecurityGroupIngressRequest requestTag]];

    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.groupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.groupName] forKey:[NSString stringWithFormat:@"%@", @"GroupName"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.groupId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.groupId] forKey:[NSString stringWithFormat:@"%@", @"GroupId"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.sourceSecurityGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.sourceSecurityGroupName] forKey:[NSString stringWithFormat:@"%@", @"SourceSecurityGroupName"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.sourceSecurityGroupOwnerId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.sourceSecurityGroupOwnerId] forKey:[NSString stringWithFormat:@"%@", @"SourceSecurityGroupOwnerId"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.ipProtocol != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.ipProtocol] forKey:[NSString stringWithFormat:@"%@", @"IpProtocol"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.fromPort != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.fromPort] forKey:[NSString stringWithFormat:@"%@", @"FromPort"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.toPort != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.toPort] forKey:[NSString stringWithFormat:@"%@", @"ToPort"]];
        }
    }
    if (revokeSecurityGroupIngressRequest != nil) {
        if (revokeSecurityGroupIngressRequest.cidrIp != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", revokeSecurityGroupIngressRequest.cidrIp] forKey:[NSString stringWithFormat:@"%@", @"CidrIp"]];
        }
    }

    if (revokeSecurityGroupIngressRequest != nil) {
        int ipPermissionsListIndex = 1;
        for (EC2IpPermission *ipPermissionsListValue in revokeSecurityGroupIngressRequest.ipPermissions) {
            if (ipPermissionsListValue != nil) {
                if (ipPermissionsListValue.ipProtocol != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", ipPermissionsListValue.ipProtocol] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"IpPermissions", ipPermissionsListIndex, @"IpProtocol"]];
                }
            }
            if (ipPermissionsListValue != nil) {
                if (ipPermissionsListValue.fromPort != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", ipPermissionsListValue.fromPort] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"IpPermissions", ipPermissionsListIndex, @"FromPort"]];
                }
            }
            if (ipPermissionsListValue != nil) {
                if (ipPermissionsListValue.toPort != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", ipPermissionsListValue.toPort] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"IpPermissions", ipPermissionsListIndex, @"ToPort"]];
                }
            }

            if (ipPermissionsListValue != nil) {
                int userIdGroupPairsListIndex = 1;
                for (EC2UserIdGroupPair *userIdGroupPairsListValue in ipPermissionsListValue.userIdGroupPairs) {
                    if (userIdGroupPairsListValue != nil) {
                        if (userIdGroupPairsListValue.userId != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", userIdGroupPairsListValue.userId] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d.%@", @"IpPermissions", ipPermissionsListIndex, @"Groups", userIdGroupPairsListIndex, @"UserId"]];
                        }
                    }
                    if (userIdGroupPairsListValue != nil) {
                        if (userIdGroupPairsListValue.groupName != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", userIdGroupPairsListValue.groupName] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d.%@", @"IpPermissions", ipPermissionsListIndex, @"Groups", userIdGroupPairsListIndex, @"GroupName"]];
                        }
                    }
                    if (userIdGroupPairsListValue != nil) {
                        if (userIdGroupPairsListValue.groupId != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", userIdGroupPairsListValue.groupId] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d.%@", @"IpPermissions", ipPermissionsListIndex, @"Groups", userIdGroupPairsListIndex, @"GroupId"]];
                        }
                    }

                    userIdGroupPairsListIndex++;
                }
            }
            if (ipPermissionsListValue != nil) {
                int ipRangesListIndex = 1;
                for (NSString *ipRangesListValue in ipPermissionsListValue.ipRanges) {
                    if (ipRangesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ipRangesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d.CidrIp", @"IpPermissions", ipPermissionsListIndex, @"IpRanges", ipRangesListIndex]];
                    }
                    ipRangesListIndex++;
                }
            }

            ipPermissionsListIndex++;
        }
    }


    return [request autorelease];
}

@end

