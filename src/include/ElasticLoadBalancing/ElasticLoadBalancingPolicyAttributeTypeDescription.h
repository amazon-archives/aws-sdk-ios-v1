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
 * Policy Attribute Type Description
 */

@interface ElasticLoadBalancingPolicyAttributeTypeDescription:NSObject

{
    NSString *attributeName;
    NSString *attributeType;
    NSString *descriptionValue;
    NSString *defaultValue;
    NSString *cardinality;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the attribute associated with the policy type.
 */
@property (nonatomic, retain) NSString *attributeName;

/**
 * The type of attribute. For example, Boolean, Integer, etc.
 */
@property (nonatomic, retain) NSString *attributeType;

/**
 * A human-readable description of the attribute.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The default value of the attribute, if applicable.
 */
@property (nonatomic, retain) NSString *defaultValue;

/**
 * The cardinality of the attribute. Valid Values: <ul> <li>ONE(1) :
 * Single value required</li> <li>ZERO_OR_ONE(0..1) : Up to one value can
 * be supplied</li> <li>ZERO_OR_MORE(0..*) : Optional. Multiple values
 * are allowed</li> <li>ONE_OR_MORE(1..*0) : Required. Multiple values
 * are allowed</li> </ul>
 */
@property (nonatomic, retain) NSString *cardinality;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
