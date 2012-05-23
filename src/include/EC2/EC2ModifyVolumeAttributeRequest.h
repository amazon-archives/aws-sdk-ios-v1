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


#import "../AmazonServiceRequestConfig.h"



/**
 * Modify Volume Attribute Request
 */

@interface EC2ModifyVolumeAttributeRequest:AmazonServiceRequestConfig

{
    NSString *volumeId;
    bool     autoEnableIO;
    bool     autoEnableIOIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the VolumeId property for this object.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * The value of the AutoEnableIO property for this object.
 */
@property (nonatomic) bool           autoEnableIO;

@property (nonatomic, readonly) bool autoEnableIOIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
