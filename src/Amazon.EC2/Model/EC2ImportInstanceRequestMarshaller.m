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

#import "EC2ImportInstanceRequestMarshaller.h"

@implementation EC2ImportInstanceRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ImportInstanceRequest *)importInstanceRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ImportInstance"           forKey:@"Action"];
    [request setParameterValue:@"2013-02-01"   forKey:@"Version"];

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
            int groupNamesListIndex = 1;
            for (NSString *groupNamesListValue in launchSpecification.groupNames) {
                if (groupNamesListValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", groupNamesListValue] forKey:[NSString stringWithFormat:@"%@.%@.%d", @"LaunchSpecification", @"GroupName", groupNamesListIndex]];
                }

                groupNamesListIndex++;
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

