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

#import "EC2RequestSpotInstancesRequestMarshaller.h"

@implementation EC2RequestSpotInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2RequestSpotInstancesRequest *)requestSpotInstancesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"RequestSpotInstances"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[requestSpotInstancesRequest delegate]];
    [request setCredentials:[requestSpotInstancesRequest credentials]];
    [request setEndpoint:[requestSpotInstancesRequest requestEndpoint]];
    [request setRequestTag:[requestSpotInstancesRequest requestTag]];

    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.spotPrice != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", requestSpotInstancesRequest.spotPrice] forKey:[NSString stringWithFormat:@"%@", @"SpotPrice"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.instanceCount != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", requestSpotInstancesRequest.instanceCount] forKey:[NSString stringWithFormat:@"%@", @"InstanceCount"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.type != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", requestSpotInstancesRequest.type] forKey:[NSString stringWithFormat:@"%@", @"Type"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.validFrom != nil) {
            [request setParameterValue:[requestSpotInstancesRequest.validFrom stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"ValidFrom"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.validUntil != nil) {
            [request setParameterValue:[requestSpotInstancesRequest.validUntil stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"ValidUntil"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.launchGroup != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", requestSpotInstancesRequest.launchGroup] forKey:[NSString stringWithFormat:@"%@", @"LaunchGroup"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        if (requestSpotInstancesRequest.availabilityZoneGroup != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", requestSpotInstancesRequest.availabilityZoneGroup] forKey:[NSString stringWithFormat:@"%@", @"AvailabilityZoneGroup"]];
        }
    }
    if (requestSpotInstancesRequest != nil) {
        EC2LaunchSpecification *launchSpecification = requestSpotInstancesRequest.launchSpecification;
        if (launchSpecification != nil) {
            if (launchSpecification.imageId != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.imageId] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"ImageId"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.keyName != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.keyName] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"KeyName"]];
            }
        }

        if (launchSpecification != nil) {
            int allSecurityGroupsListIndex = 1;
            for (EC2GroupIdentifier *allSecurityGroupsListValue in launchSpecification.allSecurityGroups) {
                if (allSecurityGroupsListValue != nil) {
                    if (allSecurityGroupsListValue.groupName != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", allSecurityGroupsListValue.groupName] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"GroupSet", allSecurityGroupsListIndex, @"GroupName"]];
                    }
                }
                if (allSecurityGroupsListValue != nil) {
                    if (allSecurityGroupsListValue.groupId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", allSecurityGroupsListValue.groupId] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"GroupSet", allSecurityGroupsListIndex, @"GroupId"]];
                    }
                }

                allSecurityGroupsListIndex++;
            }
        }
        if (launchSpecification != nil) {
            int securityGroupsListIndex = 1;
            for (NSString *securityGroupsListValue in launchSpecification.securityGroups) {
                if (securityGroupsListValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", securityGroupsListValue] forKey:[NSString stringWithFormat:@"%@.%@.%d", @"LaunchSpecification", @"SecurityGroup", securityGroupsListIndex]];
                }
                securityGroupsListIndex++;
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.userData != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.userData] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"UserData"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.addressingType != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.addressingType] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"AddressingType"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.instanceType != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.instanceType] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"InstanceType"]];
            }
        }
        if (launchSpecification != nil) {
            EC2SpotPlacement *placement = launchSpecification.placement;
            if (placement != nil) {
                if (placement.availabilityZone != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", placement.availabilityZone] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"LaunchSpecification", @"Placement", @"AvailabilityZone"]];
                }
            }
            if (placement != nil) {
                if (placement.groupName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", placement.groupName] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"LaunchSpecification", @"Placement", @"GroupName"]];
                }
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.kernelId != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.kernelId] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"KernelId"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.ramdiskId != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.ramdiskId] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"RamdiskId"]];
            }
        }

        if (launchSpecification != nil) {
            int blockDeviceMappingsListIndex = 1;
            for (EC2BlockDeviceMapping *blockDeviceMappingsListValue in launchSpecification.blockDeviceMappings) {
                if (blockDeviceMappingsListValue != nil) {
                    if (blockDeviceMappingsListValue.virtualName != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.virtualName] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"VirtualName"]];
                    }
                }
                if (blockDeviceMappingsListValue != nil) {
                    if (blockDeviceMappingsListValue.deviceName != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.deviceName] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"DeviceName"]];
                    }
                }
                if (blockDeviceMappingsListValue != nil) {
                    EC2EbsBlockDevice *ebs = blockDeviceMappingsListValue.ebs;
                    if (ebs != nil) {
                        if (ebs.snapshotId != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.snapshotId] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"SnapshotId"]];
                        }
                    }
                    if (ebs != nil) {
                        if (ebs.volumeSize != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.volumeSize] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"VolumeSize"]];
                        }
                    }
                    if (ebs != nil) {
                        if (ebs.deleteOnTerminationIsSet) {
                            [request setParameterValue:(ebs.deleteOnTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"DeleteOnTermination"]];
                        }
                    }
                    if (ebs != nil) {
                        if (ebs.volumeType != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.volumeType] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"VolumeType"]];
                        }
                    }
                    if (ebs != nil) {
                        if (ebs.iops != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.iops] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"Iops"]];
                        }
                    }
                }
                if (blockDeviceMappingsListValue != nil) {
                    if (blockDeviceMappingsListValue.noDevice != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.noDevice] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"NoDevice"]];
                    }
                }

                blockDeviceMappingsListIndex++;
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.monitoringEnabledIsSet) {
                [request setParameterValue:(launchSpecification.monitoringEnabled ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"Monitoring.Enabled"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.subnetId != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.subnetId] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"SubnetId"]];
            }
        }

        if (launchSpecification != nil) {
            int networkInterfacesListIndex = 1;
            for (EC2InstanceNetworkInterfaceSpecification *networkInterfacesListValue in launchSpecification.networkInterfaces) {
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.networkInterfaceId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.networkInterfaceId] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"NetworkInterfaceId"]];
                    }
                }
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.deviceIndex != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.deviceIndex] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"DeviceIndex"]];
                    }
                }
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.subnetId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.subnetId] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"SubnetId"]];
                    }
                }
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.descriptionValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.descriptionValue] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"Description"]];
                    }
                }
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.privateIpAddress != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.privateIpAddress] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"PrivateIpAddress"]];
                    }
                }

                if (networkInterfacesListValue != nil) {
                    int groupsListIndex = 1;
                    for (NSString *groupsListValue in networkInterfacesListValue.groups) {
                        if (groupsListValue != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", groupsListValue] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%d", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"SecurityGroupId", groupsListIndex]];
                        }

                        groupsListIndex++;
                    }
                }
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.deleteOnTerminationIsSet) {
                        [request setParameterValue:(networkInterfacesListValue.deleteOnTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"DeleteOnTermination"]];
                    }
                }

                if (networkInterfacesListValue != nil) {
                    int privateIpAddressesListIndex = 1;
                    for (EC2PrivateIpAddressSpecification *privateIpAddressesListValue in networkInterfacesListValue.privateIpAddresses) {
                        if (privateIpAddressesListValue != nil) {
                            if (privateIpAddressesListValue.privateIpAddress != nil) {
                                [request setParameterValue:[NSString stringWithFormat:@"%@", privateIpAddressesListValue.privateIpAddress] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"PrivateIpAddresses", privateIpAddressesListIndex, @"PrivateIpAddress"]];
                            }
                        }
                        if (privateIpAddressesListValue != nil) {
                            if (privateIpAddressesListValue.primaryIsSet) {
                                [request setParameterValue:(privateIpAddressesListValue.primary ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@.%d.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"PrivateIpAddresses", privateIpAddressesListIndex, @"Primary"]];
                            }
                        }

                        privateIpAddressesListIndex++;
                    }
                }
                if (networkInterfacesListValue != nil) {
                    if (networkInterfacesListValue.secondaryPrivateIpAddressCount != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.secondaryPrivateIpAddressCount] forKey:[NSString stringWithFormat:@"%@.%@.%d.%@", @"LaunchSpecification", @"NetworkInterfaceSet", networkInterfacesListIndex, @"SecondaryPrivateIpAddressCount"]];
                    }
                }

                networkInterfacesListIndex++;
            }
        }
        if (launchSpecification != nil) {
            EC2IamInstanceProfileSpecification *iamInstanceProfile = launchSpecification.iamInstanceProfile;
            if (iamInstanceProfile != nil) {
                if (iamInstanceProfile.arn != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", iamInstanceProfile.arn] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"LaunchSpecification", @"IamInstanceProfile", @"Arn"]];
                }
            }
            if (iamInstanceProfile != nil) {
                if (iamInstanceProfile.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", iamInstanceProfile.name] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"LaunchSpecification", @"IamInstanceProfile", @"Name"]];
                }
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.ebsOptimizedIsSet) {
                [request setParameterValue:(launchSpecification.ebsOptimized ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"EbsOptimized"]];
            }
        }
    }


    return [request autorelease];
}

@end

