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

#import "EC2InstanceNetworkInterfaceAssociation.h"



/**
 * Instance Private Ip Address
 */

@interface EC2InstancePrivateIpAddress:NSObject

{
    NSString                               *privateIpAddress;
    NSString                               *privateDnsName;
    bool                                   primary;
    bool                                   primaryIsSet;
    EC2InstanceNetworkInterfaceAssociation *association;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the PrivateIpAddress property for this object.
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * The value of the PrivateDnsName property for this object.
 */
@property (nonatomic, retain) NSString *privateDnsName;

/**
 * The value of the Primary property for this object.
 */
@property (nonatomic) bool           primary;

@property (nonatomic, readonly) bool primaryIsSet;

/**
 * The value of the Association property for this object.
 */
@property (nonatomic, retain) EC2InstanceNetworkInterfaceAssociation *association;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
