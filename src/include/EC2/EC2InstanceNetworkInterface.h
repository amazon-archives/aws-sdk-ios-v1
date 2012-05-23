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

#import "EC2GroupIdentifier.h"
#import "EC2InstanceNetworkInterfaceAttachment.h"
#import "EC2InstanceNetworkInterfaceAssociation.h"



/**
 * Instance Network Interface
 */

@interface EC2InstanceNetworkInterface:NSObject

{
    NSString                               *networkInterfaceId;
    NSString                               *subnetId;
    NSString                               *vpcId;
    NSString                               *descriptionValue;
    NSString                               *ownerId;
    NSString                               *status;
    NSString                               *privateIpAddress;
    NSString                               *privateDnsName;
    bool                                   sourceDestCheck;
    bool                                   sourceDestCheckIsSet;
    NSMutableArray                         *groups;
    EC2InstanceNetworkInterfaceAttachment  *attachment;
    EC2InstanceNetworkInterfaceAssociation *association;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the NetworkInterfaceId property for this object.
 */
@property (nonatomic, retain) NSString *networkInterfaceId;

/**
 * The value of the SubnetId property for this object.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * The value of the VpcId property for this object.
 */
@property (nonatomic, retain) NSString *vpcId;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The value of the OwnerId property for this object.
 */
@property (nonatomic, retain) NSString *ownerId;

/**
 * The value of the Status property for this object.
 */
@property (nonatomic, retain) NSString *status;

/**
 * The value of the PrivateIpAddress property for this object.
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * The value of the PrivateDnsName property for this object.
 */
@property (nonatomic, retain) NSString *privateDnsName;

/**
 * The value of the SourceDestCheck property for this object.
 */
@property (nonatomic) bool           sourceDestCheck;

@property (nonatomic, readonly) bool sourceDestCheckIsSet;

/**
 * The value of the Groups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *groups;

/**
 * The value of the Attachment property for this object.
 */
@property (nonatomic, retain) EC2InstanceNetworkInterfaceAttachment *attachment;

/**
 * The value of the Association property for this object.
 */
@property (nonatomic, retain) EC2InstanceNetworkInterfaceAssociation *association;

/**
 * Adds a single object to groups.
 * This function will alloc and init groups if not already done.
 */
-(void)addGroup:(EC2GroupIdentifier *)groupObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
