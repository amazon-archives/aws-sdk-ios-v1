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
 * Tag Description
 */

@interface EC2TagDescription:NSObject

{
    NSString *resourceId;
    NSString *resourceType;
    NSString *key;
    NSString *value;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The resource ID for the tag.
 */
@property (nonatomic, retain) NSString *resourceId;

/**
 * The type of resource identified by the associated resource ID (ex:
 * instance, AMI, EBS volume, etc).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>customer-gateway, dhcp-options, image, instance, snapshot, spot-instances-request, subnet, volume, vpc, vpn-connection, vpn-gateway
 */
@property (nonatomic, retain) NSString *resourceType;

/**
 * The tag's key.
 */
@property (nonatomic, retain) NSString *key;

/**
 * The tag's value.
 */
@property (nonatomic, retain) NSString *value;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
