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
 * Key Schema Element
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBKeySchemaElement:NSObject

{
    NSString *attributeName;
    NSString *attributeType;
}



/**
 * The value of the AttributeName property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *attributeName;

/**
 * The value of the AttributeType property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>S, N
 */
@property (nonatomic, retain) NSString *attributeType;


/**
 * Default constructor for a new KeySchemaElement object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new KeySchemaElement object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theAttributeName
 * @param theAttributeType
 */
-(id)initWithAttributeName:(NSString *)theAttributeName andAttributeType:(NSString *)theAttributeType;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
