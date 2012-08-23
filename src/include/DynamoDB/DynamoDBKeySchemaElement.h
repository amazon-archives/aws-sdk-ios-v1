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
 */

@interface DynamoDBKeySchemaElement:NSObject

{
    NSString *attributeName;
    NSString *attributeType;
}



/**
 * The <code>AttributeName</code> of the <code>KeySchemaElement</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *attributeName;

/**
 * The <code>AttributeType</code> of the <code>KeySchemaElement</code>
 * which can be a <code>String</code> or a <code>Number</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>S, N, B
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
 * @param theAttributeName The <code>AttributeName</code> of the
 * <code>KeySchemaElement</code>.
 * @param theAttributeType The <code>AttributeType</code> of the
 * <code>KeySchemaElement</code> which can be a <code>String</code> or a
 * <code>Number</code>.
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
