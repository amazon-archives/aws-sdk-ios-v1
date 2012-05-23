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
 * Reset Snapshot Attribute Request
 */

@interface EC2ResetSnapshotAttributeRequest:AmazonServiceRequestConfig

{
    NSString *snapshotId;
    NSString *attribute;
}



/**
 * The ID of the snapshot whose attribute is being reset.
 */
@property (nonatomic, retain) NSString *snapshotId;

/**
 * The name of the attribute being reset. <p> Available attribute names:
 * <code>createVolumePermission</code>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>productCodes, createVolumePermission
 */
@property (nonatomic, retain) NSString *attribute;


/**
 * Default constructor for a new ResetSnapshotAttributeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ResetSnapshotAttributeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSnapshotId The ID of the snapshot whose attribute is being
 * reset.
 * @param theAttribute The name of the attribute being reset. <p>
 * Available attribute names: <code>createVolumePermission</code>
 */
-(id)initWithSnapshotId:(NSString *)theSnapshotId andAttribute:(NSString *)theAttribute;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
