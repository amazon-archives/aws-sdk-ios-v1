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

#import "EC2ModifyInstanceAttributeRequestMarshaller.h"

@implementation EC2ModifyInstanceAttributeRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ModifyInstanceAttributeRequest *)modifyInstanceAttributeRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ModifyInstanceAttribute"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[modifyInstanceAttributeRequest delegate]];
    [request setCredentials:[modifyInstanceAttributeRequest credentials]];
    [request setEndpoint:[modifyInstanceAttributeRequest requestEndpoint]];
    [request setRequestTag:[modifyInstanceAttributeRequest requestTag]];

    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.attribute != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.attribute] forKey:[NSString stringWithFormat:@"%@", @"Attribute"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.value != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.value] forKey:[NSString stringWithFormat:@"%@", @"Value"]];
        }
    }

    if (modifyInstanceAttributeRequest != nil) {
        int blockDeviceMappingsListIndex = 1;
        for (EC2InstanceBlockDeviceMappingSpecification *blockDeviceMappingsListValue in modifyInstanceAttributeRequest.blockDeviceMappings) {
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.deviceName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.deviceName] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"DeviceName"]];
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                EC2EbsInstanceBlockDeviceSpecification *ebs = blockDeviceMappingsListValue.ebs;
                if (ebs != nil) {
                    if (ebs.volumeId != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", ebs.volumeId] forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"VolumeId"]];
                    }
                }
                if (ebs != nil) {
                    if (ebs.deleteOnTerminationIsSet) {
                        [request setParameterValue:(ebs.deleteOnTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%d.%@.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"Ebs", @"DeleteOnTermination"]];
                    }
                }
            }
            if (blockDeviceMappingsListValue != nil) {
                if (blockDeviceMappingsListValue.virtualName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", blockDeviceMappingsListValue.virtualName] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"BlockDeviceMapping", blockDeviceMappingsListIndex, @"VirtualName"]];
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
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.sourceDestCheckIsSet) {
            [request setParameterValue:(modifyInstanceAttributeRequest.sourceDestCheck ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"SourceDestCheck.Value"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.disableApiTerminationIsSet) {
            [request setParameterValue:(modifyInstanceAttributeRequest.disableApiTermination ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"DisableApiTermination.Value"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.instanceType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.instanceType] forKey:[NSString stringWithFormat:@"%@", @"InstanceType.Value"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.kernel != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.kernel] forKey:[NSString stringWithFormat:@"%@", @"Kernel.Value"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.ramdisk != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.ramdisk] forKey:[NSString stringWithFormat:@"%@", @"Ramdisk.Value"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.userData != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.userData] forKey:[NSString stringWithFormat:@"%@", @"UserData.Value"]];
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.instanceInitiatedShutdownBehavior != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyInstanceAttributeRequest.instanceInitiatedShutdownBehavior] forKey:[NSString stringWithFormat:@"%@", @"InstanceInitiatedShutdownBehavior.Value"]];
        }
    }

    if (modifyInstanceAttributeRequest != nil) {
        int groupsListIndex = 1;
        for (NSString *groupsListValue in modifyInstanceAttributeRequest.groups) {
            if (groupsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", groupsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"GroupId", groupsListIndex]];
            }

            groupsListIndex++;
        }
    }
    if (modifyInstanceAttributeRequest != nil) {
        if (modifyInstanceAttributeRequest.ebsOptimizedIsSet) {
            [request setParameterValue:(modifyInstanceAttributeRequest.ebsOptimized ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"EbsOptimized.Value"]];
        }
    }


    return [request autorelease];
}

@end

