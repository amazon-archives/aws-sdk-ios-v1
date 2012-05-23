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




/**
 * Volume Attachment
 */

@interface EC2VolumeAttachment:NSObject

{
    NSString *volumeId;
    NSString *instanceId;
    NSString *device;
    NSString *state;
    NSDate   *attachTime;
    bool     deleteOnTermination;
    bool     deleteOnTerminationIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 *
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 *
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * How the device is exposed to the instance (e.g.,
 * <code>/dev/sdh</code>).
 */
@property (nonatomic, retain) NSString *device;

/**
 *
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>attaching, attached, detaching, detached
 */
@property (nonatomic, retain) NSString *state;

/**
 * Timestamp when this attachment initiated.
 */
@property (nonatomic, retain) NSDate *attachTime;

/**
 * ` <p> Whether this volume will be deleted or not when the associated
 * instance is terminated.
 */
@property (nonatomic) bool           deleteOnTermination;

@property (nonatomic, readonly) bool deleteOnTerminationIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
