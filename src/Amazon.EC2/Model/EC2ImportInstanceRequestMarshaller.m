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

#import "EC2ImportInstanceRequestMarshaller.h"

@implementation EC2ImportInstanceRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ImportInstanceRequest *)importInstanceRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ImportInstance"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[importInstanceRequest delegate]];
    [request setCredentials:[importInstanceRequest credentials]];
    [request setEndpoint:[importInstanceRequest requestEndpoint]];
    [request setRequestTag:[importInstanceRequest requestTag]];

    if (importInstanceRequest != nil) {
        if (importInstanceRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", importInstanceRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }
    if (importInstanceRequest != nil) {
        EC2ImportInstanceLaunchSpecification *launchSpecification = importInstanceRequest.launchSpecification;
        if (launchSpecification != nil) {
            if (launchSpecification.architecture != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.architecture] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"Architecture"]];
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
            if (launchSpecification.additionalInfo != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.additionalInfo] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"AdditionalInfo"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.userData != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.userData] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"UserData"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.instanceType != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.instanceType] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"InstanceType"]];
            }
        }
        if (launchSpecification != nil) {
            EC2Placement *placement = launchSpecification.placement;
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
            if (placement != nil) {
                if (placement.tenancy != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", placement.tenancy] forKey:[NSString stringWithFormat:@"%@.%@.%@", @"LaunchSpecification", @"Placement", @"Tenancy"]];
                }
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
            if (launchSpecification.monitoringIsSet) {
                [request setParameterValue:(launchSpecification.monitoring ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"Monitoring"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.subnetId != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.subnetId] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"SubnetId"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.disableApiTerminationIsSet) {
                [request setParameterValue:(launchSpecification.disableApiTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"DisableApiTermination"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.instanceInitiatedShutdownBehavior != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.instanceInitiatedShutdownBehavior] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"InstanceInitiatedShutdownBehavior"]];
            }
        }
        if (launchSpecification != nil) {
            if (launchSpecification.privateIpAddress != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchSpecification.privateIpAddress] forKey:[NSString stringWithFormat:@"%@.%@", @"LaunchSpecification", @"PrivateIpAddress"]];
            }
        }
    }

    if (importInstanceRequest != nil) {
        int diskImagesListIndex = 1;
        for (EC2DiskImage *diskImagesListValue in importInstanceRequest.diskImages) {
            if (diskImagesListValue != nil) {
                EC2DiskImageDetail *image = diskImagesListValue.image;
                if (image != nil) {
                    if (image.format != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", image.format] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"DiskImage", diskImagesListIndex, @"Image", @"Format"]];
                    }
                }
                if (image != nil) {
                    if (image.bytes != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", image.bytes] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"DiskImage", diskImagesListIndex, @"Image", @"Bytes"]];
                    }
                }
                if (image != nil) {
                    if (image.importManifestUrl != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", image.importManifestUrl] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"DiskImage", diskImagesListIndex, @"Image", @"ImportManifestUrl"]];
                    }
                }
            }
            if (diskImagesListValue != nil) {
                if (diskImagesListValue.descriptionValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", diskImagesListValue.descriptionValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"DiskImage", diskImagesListIndex, @"Description"]];
                }
            }
            if (diskImagesListValue != nil) {
                EC2VolumeDetail *volume = diskImagesListValue.volume;
                if (volume != nil) {
                    if (volume.size != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", volume.size] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"DiskImage", diskImagesListIndex, @"Volume", @"Size"]];
                    }
                }
            }

            diskImagesListIndex++;
        }
    }
    if (importInstanceRequest != nil) {
        if (importInstanceRequest.platform != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", importInstanceRequest.platform] forKey:[NSString stringWithFormat:@"%@", @"Platform"]];
        }
    }


    return [request autorelease];
}

@end

