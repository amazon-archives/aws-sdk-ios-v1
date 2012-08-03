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
 * Address
 */

@interface EC2Address:NSObject

{
    NSString *instanceId;
    NSString *publicIp;
    NSString *allocationId;
    NSString *associationId;
    NSString *domain;
    NSString *networkInterfaceId;
    NSString *networkInterfaceOwnerId;
    NSString *privateIpAddress;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 *
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 *
 */
@property (nonatomic, retain) NSString *publicIp;

/**
 * The value of the AllocationId property for this object.
 */
@property (nonatomic, retain) NSString *allocationId;

/**
 * The value of the AssociationId property for this object.
 */
@property (nonatomic, retain) NSString *associationId;

/**
 * The value of the Domain property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>vpc, standard
 */
@property (nonatomic, retain) NSString *domain;

/**
 * The value of the NetworkInterfaceId property for this object.
 */
@property (nonatomic, retain) NSString *networkInterfaceId;

/**
 * The value of the NetworkInterfaceOwnerId property for this object.
 */
@property (nonatomic, retain) NSString *networkInterfaceOwnerId;

/**
 * The value of the PrivateIpAddress property for this object.
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
