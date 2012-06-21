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

#import "AutoScalingCreateLaunchConfigurationRequestMarshaller.h"

@implementation AutoScalingCreateLaunchConfigurationRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingCreateLaunchConfigurationRequest *)createLaunchConfigurationRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"CreateLaunchConfiguration"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[createLaunchConfigurationRequest delegate]];
    [request setCredentials:[createLaunchConfigurationRequest credentials]];
    [request setEndpoint:[createLaunchConfigurationRequest requestEndpoint]];
    [request setRequestTag:[createLaunchConfigurationRequest requestTag]];

    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.launchConfigurationName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.launchConfigurationName] forKey:[NSString stringWithFormat:@"%@", @"LaunchConfigurationName"]];
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.imageId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.imageId] forKey:[NSString stringWithFormat:@"%@", @"ImageId"]];
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.keyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.keyName] forKey:[NSString stringWithFormat:@"%@", @"KeyName"]];
        }
    }

    if (createLaunchConfigurationRequest != nil) {
        int securityGroupsListIndex = 1;
        for (NSString *securityGroupsListValue in createLaunchConfigurationRequest.securityGroups) {
            if (securityGroupsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", securityGroupsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"SecurityGroups", securityGroupsListIndex]];
            }

            securityGroupsListIndex++;
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.userData != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.userData] forKey:[NSString stringWithFormat:@"%@", @"UserData"]];
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.instanceType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.instanceType] forKey:[NSString stringWithFormat:@"%@", @"InstanceType"]];
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.kernelId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.kernelId] forKey:[NSString stringWithFormat:@"%@", @"KernelId"]];
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.ramdiskId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.ramdiskId] forKey:[NSString stringWithFormat:@"%@", @"RamdiskId"]];
        }
    }

    if (createLaunchConfigurationRequest != nil) {
        int blockDeviceMappingsListIndex = 1;
        for (AutoScalingBlockDeviceMapping *blockDeviceMappingsListValue in createLaunchConfigurationRequest.blockDeviceMappings) {
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.virtualName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.virtualName] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"BlockDeviceMappings", blockDeviceMappingsListIndex, @"VirtualName"]];
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.deviceName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.deviceName] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"BlockDeviceMappings", blockDeviceMappingsListIndex, @"DeviceName"]];
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                AutoScalingEbs *ebs = blockDeviceMappingsListValue.ebs;
                if (ebs != nil) {
                    if (ebs.snapshotId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.snapshotId] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.%@", @"BlockDeviceMappings", blockDeviceMappingsListIndex, @"Ebs", @"SnapshotId"]];
                    }
                }
                if (ebs != nil) {
                    if (ebs.volumeSize != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.volumeSize] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.%@", @"BlockDeviceMappings", blockDeviceMappingsListIndex, @"Ebs", @"VolumeSize"]];
                    }
                }
            }

            blockDeviceMappingsListIndex++;
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        AutoScalingInstanceMonitoring *instanceMonitoring = createLaunchConfigurationRequest.instanceMonitoring;
        if (instanceMonitoring != nil) {
            if (instanceMonitoring.enabledIsSet) {
                [request setParameterValue:(instanceMonitoring.enabled ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@", @"InstanceMonitoring", @"Enabled"]];
            }
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.spotPrice != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.spotPrice] forKey:[NSString stringWithFormat:@"%@", @"SpotPrice"]];
        }
    }
    if (createLaunchConfigurationRequest != nil) {
        if (createLaunchConfigurationRequest.iamInstanceProfile != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLaunchConfigurationRequest.iamInstanceProfile] forKey:[NSString stringWithFormat:@"%@", @"IamInstanceProfile"]];
        }
    }


    return [request autorelease];
}

@end

