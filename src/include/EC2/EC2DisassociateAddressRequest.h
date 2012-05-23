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
 * Disassociate Address Request
 */

@interface EC2DisassociateAddressRequest:AmazonServiceRequestConfig

{
    NSString *publicIp;
    NSString *associationId;
}



/**
 * The elastic IP address that you are disassociating from the instance.
 */
@property (nonatomic, retain) NSString *publicIp;

/**
 * Association ID corresponding to the VPC elastic IP address you want to
 * disassociate.
 */
@property (nonatomic, retain) NSString *associationId;


/**
 * Default constructor for a new DisassociateAddressRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DisassociateAddressRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param thePublicIp The elastic IP address that you are disassociating
 * from the instance.
 */
-(id)initWithPublicIp:(NSString *)thePublicIp;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
