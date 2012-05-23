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
 * Instance Network Interface Attachment
 */

@interface EC2InstanceNetworkInterfaceAttachment:NSObject

{
    NSString *attachmentId;
    NSNumber *deviceIndex;
    NSString *status;
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
 * The value of the AttachmentId property for this object.
 */
@property (nonatomic, retain) NSString *attachmentId;

/**
 * The value of the DeviceIndex property for this object.
 */
@property (nonatomic, retain) NSNumber *deviceIndex;

/**
 * The value of the Status property for this object.
 */
@property (nonatomic, retain) NSString *status;

/**
 * The value of the AttachTime property for this object.
 */
@property (nonatomic, retain) NSDate *attachTime;

/**
 * The value of the DeleteOnTermination property for this object.
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
