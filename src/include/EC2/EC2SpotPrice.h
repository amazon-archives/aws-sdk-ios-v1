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
 * Spot Price
 */

@interface EC2SpotPrice:NSObject

{
    NSString *instanceType;
    NSString *productDescription;
    NSString *spotPrice;
    NSDate   *timestamp;
    NSString *availabilityZone;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the InstanceType property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>t1.micro, m1.small, m1.medium, m1.large, m1.xlarge, m2.xlarge, m2.2xlarge, m2.4xlarge, c1.medium, c1.xlarge, hi1.4xlarge, cc1.4xlarge, cc2.8xlarge, cg1.4xlarge
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * The value of the ProductDescription property for this object.
 */
@property (nonatomic, retain) NSString *productDescription;

/**
 * The value of the SpotPrice property for this object.
 */
@property (nonatomic, retain) NSString *spotPrice;

/**
 * The value of the Timestamp property for this object.
 */
@property (nonatomic, retain) NSDate *timestamp;

/**
 * The value of the AvailabilityZone property for this object.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
