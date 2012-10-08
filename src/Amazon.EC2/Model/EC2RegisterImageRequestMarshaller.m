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

#import "EC2RegisterImageRequestMarshaller.h"

@implementation EC2RegisterImageRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2RegisterImageRequest *)registerImageRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"RegisterImage"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[registerImageRequest delegate]];
    [request setCredentials:[registerImageRequest credentials]];
    [request setEndpoint:[registerImageRequest requestEndpoint]];
    [request setRequestTag:[registerImageRequest requestTag]];

    if (registerImageRequest != nil) {
        if (registerImageRequest.imageLocation != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.imageLocation] forKey:[NSString stringWithFormat:@"%@", @"ImageLocation"]];
        }
    }
    if (registerImageRequest != nil) {
        if (registerImageRequest.name != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.name] forKey:[NSString stringWithFormat:@"%@", @"Name"]];
        }
    }
    if (registerImageRequest != nil) {
        if (registerImageRequest.descriptionValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.descriptionValue] forKey:[NSString stringWithFormat:@"%@", @"Description"]];
        }
    }
    if (registerImageRequest != nil) {
        if (registerImageRequest.architecture != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.architecture] forKey:[NSString stringWithFormat:@"%@", @"Architecture"]];
        }
    }
    if (registerImageRequest != nil) {
        if (registerImageRequest.kernelId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.kernelId] forKey:[NSString stringWithFormat:@"%@", @"KernelId"]];
        }
    }
    if (registerImageRequest != nil) {
        if (registerImageRequest.ramdiskId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.ramdiskId] forKey:[NSString stringWithFormat:@"%@", @"RamdiskId"]];
        }
    }
    if (registerImageRequest != nil) {
        if (registerImageRequest.rootDeviceName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", registerImageRequest.rootDeviceName] forKey:[NSString stringWithFormat:@"%@", @"RootDeviceName"]];
        }
    }

    if (registerImageRequest != nil) {
        int blockDeviceMappingsListIndex = 1;
        for (EC2BlockDeviceMapping *blockDeviceMappingsListValue in registerImageRequest.blockDeviceMappings) {
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


    return [request autorelease];
}

@end

