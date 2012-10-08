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

#import "EC2RunInstancesRequestMarshaller.h"

@implementation EC2RunInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2RunInstancesRequest *)runInstancesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"RunInstances"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[runInstancesRequest delegate]];
    [request setCredentials:[runInstancesRequest credentials]];
    [request setEndpoint:[runInstancesRequest requestEndpoint]];
    [request setRequestTag:[runInstancesRequest requestTag]];

    if (runInstancesRequest != nil) {
        if (runInstancesRequest.imageId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.imageId] forKey:[NSString stringWithFormat:@"%@", @"ImageId"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.minCount != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.minCount] forKey:[NSString stringWithFormat:@"%@", @"MinCount"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.maxCount != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.maxCount] forKey:[NSString stringWithFormat:@"%@", @"MaxCount"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.keyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.keyName] forKey:[NSString stringWithFormat:@"%@", @"KeyName"]];
        }
    }

    if (runInstancesRequest != nil) {
        int securityGroupsListIndex = 1;
        for (NSString *securityGroupsListValue in runInstancesRequest.securityGroups) {
            if (securityGroupsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", securityGroupsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"SecurityGroup", securityGroupsListIndex]];
            }

            securityGroupsListIndex++;
        }
    }

    if (runInstancesRequest != nil) {
        int securityGroupIdsListIndex = 1;
        for (NSString *securityGroupIdsListValue in runInstancesRequest.securityGroupIds) {
            if (securityGroupIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", securityGroupIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"SecurityGroupId", securityGroupIdsListIndex]];
            }

            securityGroupIdsListIndex++;
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.userData != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.userData] forKey:[NSString stringWithFormat:@"%@", @"UserData"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.addressingType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.addressingType] forKey:[NSString stringWithFormat:@"%@", @"AddressingType"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.instanceType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.instanceType] forKey:[NSString stringWithFormat:@"%@", @"InstanceType"]];
        }
    }
    if (runInstancesRequest != nil) {
        EC2Placement *placement = runInstancesRequest.placement;
        if (placement != nil) {
            if (placement.availabilityZone != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", placement.availabilityZone] forKey:[NSString stringWithFormat:@"%@.%@", @"Placement", @"AvailabilityZone"]];
            }
        }
        if (placement != nil) {
            if (placement.groupName != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", placement.groupName] forKey:[NSString stringWithFormat:@"%@.%@", @"Placement", @"GroupName"]];
            }
        }
        if (placement != nil) {
            if (placement.tenancy != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", placement.tenancy] forKey:[NSString stringWithFormat:@"%@.%@", @"Placement", @"Tenancy"]];
            }
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.kernelId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.kernelId] forKey:[NSString stringWithFormat:@"%@", @"KernelId"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.ramdiskId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.ramdiskId] forKey:[NSString stringWithFormat:@"%@", @"RamdiskId"]];
        }
    }

    if (runInstancesRequest != nil) {
        int blockDeviceMappingsListIndex = 1;
        for (EC2BlockDeviceMapping *blockDeviceMappingsListValue in runInstancesRequest.blockDeviceMappings) {
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.virtualName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.virtualName] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"VirtualName"]];
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.deviceName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.deviceName] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"DeviceName"]];
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                EC2EbsBlockDevice *ebs = blockDeviceMappingsListValue.ebs;
                if (ebs != nil) {
                    if (ebs.snapshotId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.snapshotId] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"SnapshotId"]];
                    }
                }
                if (ebs != nil) {
                    if (ebs.volumeSize != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.volumeSize] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"VolumeSize"]];
                    }
                }
                if (ebs != nil) {
                    if (ebs.deleteOnTerminationIsSet) {
                        [request setParameterValue:(ebs.deleteOnTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"DeleteOnTermination"]];
                    }
                }
                if (ebs != nil) {
                    if (ebs.volumeType != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.volumeType] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"VolumeType"]];
                    }
                }
                if (ebs != nil) {
                    if (ebs.iops != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.iops] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"Iops"]];
                    }
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.noDevice != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.noDevice] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"NoDevice"]];
                }
            }

            blockDeviceMappingsListIndex++;
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.monitoringIsSet) {
            [request setParameterValue:(runInstancesRequest.monitoring ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"Monitoring.Enabled"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.subnetId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.subnetId] forKey:[NSString stringWithFormat:@"%@", @"SubnetId"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.disableApiTerminationIsSet) {
            [request setParameterValue:(runInstancesRequest.disableApiTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"DisableApiTermination"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.instanceInitiatedShutdownBehavior != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.instanceInitiatedShutdownBehavior] forKey:[NSString stringWithFormat:@"%@", @"InstanceInitiatedShutdownBehavior"]];
        }
    }
    if (runInstancesRequest != nil) {
        EC2InstanceLicenseSpecification *license = runInstancesRequest.license;
        if (license != nil) {
            if (license.pool != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", license.pool] forKey:[NSString stringWithFormat:@"%@.%@", @"License", @"Pool"]];
            }
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.privateIpAddress != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.privateIpAddress] forKey:[NSString stringWithFormat:@"%@", @"PrivateIpAddress"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.clientToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.clientToken] forKey:[NSString stringWithFormat:@"%@", @"ClientToken"]];
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.additionalInfo != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", runInstancesRequest.additionalInfo] forKey:[NSString stringWithFormat:@"%@", @"AdditionalInfo"]];
        }
    }

    if (runInstancesRequest != nil) {
        int networkInterfacesListIndex = 1;
        for (EC2InstanceNetworkInterfaceSpecification *networkInterfacesListValue in runInstancesRequest.networkInterfaces) {
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.networkInterfaceId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.networkInterfaceId] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"NetworkInterfaceId"]];
                }
            }
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.deviceIndex != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.deviceIndex] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"DeviceIndex"]];
                }
            }
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.subnetId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.subnetId] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"SubnetId"]];
                }
            }
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.descriptionValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.descriptionValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"Description"]];
                }
            }
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.privateIpAddress != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.privateIpAddress] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"PrivateIpAddress"]];
                }
            }

            if (networkInterfacesListValue != nil) {
                int groupsListIndex = 1;
                for (NSString *groupsListValue in networkInterfacesListValue.groups) {
                    if (groupsListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", groupsListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"NetworkInterface", networkInterfacesListIndex, @"SecurityGroupId", groupsListIndex]];
                    }

                    groupsListIndex++;
                }
            }
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.deleteOnTerminationIsSet) {
                    [request setParameterValue:(networkInterfacesListValue.deleteOnTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"DeleteOnTermination"]];
                }
            }

            if (networkInterfacesListValue != nil) {
                int privateIpAddressesListIndex = 1;
                for (EC2PrivateIpAddressSpecification *privateIpAddressesListValue in networkInterfacesListValue.privateIpAddresses) {
                    if (privateIpAddressesListValue != nil) {
                        if (privateIpAddressesListValue.privateIpAddress != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", privateIpAddressesListValue.privateIpAddress] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"PrivateIpAddresses", privateIpAddressesListIndex, @"PrivateIpAddress"]];
                        }
                    }
                    if (privateIpAddressesListValue != nil) {
                        if (privateIpAddressesListValue.primaryIsSet) {
                            [request setParameterValue:(privateIpAddressesListValue.primary ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%d.%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"PrivateIpAddresses", privateIpAddressesListIndex, @"Primary"]];
                        }
                    }

                    privateIpAddressesListIndex++;
                }
            }
            if (networkInterfacesListValue != nil) {
                if (networkInterfacesListValue.secondaryPrivateIpAddressCount != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", networkInterfacesListValue.secondaryPrivateIpAddressCount] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"NetworkInterface", networkInterfacesListIndex, @"SecondaryPrivateIpAddressCount"]];
                }
            }

            networkInterfacesListIndex++;
        }
    }
    if (runInstancesRequest != nil) {
        EC2IamInstanceProfileSpecification *iamInstanceProfile = runInstancesRequest.iamInstanceProfile;
        if (iamInstanceProfile != nil) {
            if (iamInstanceProfile.arn != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", iamInstanceProfile.arn] forKey:[NSString stringWithFormat:@"%@.%@", @"IamInstanceProfile", @"Arn"]];
            }
        }
        if (iamInstanceProfile != nil) {
            if (iamInstanceProfile.name != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", iamInstanceProfile.name] forKey:[NSString stringWithFormat:@"%@.%@", @"IamInstanceProfile", @"Name"]];
            }
        }
    }
    if (runInstancesRequest != nil) {
        if (runInstancesRequest.ebsOptimizedIsSet) {
            [request setParameterValue:(runInstancesRequest.ebsOptimized ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"EbsOptimized"]];
        }
    }


    return [request autorelease];
}

@end

