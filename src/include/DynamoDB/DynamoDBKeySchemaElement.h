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




/**
 * Key Schema Element
 */

@interface DynamoDBKeySchemaElement:NSObject

{
    NSString *attributeName;
    NSString *keyType;
}



/**
 * Represents the name of a key attribute.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *attributeName;

/**
 * Represents the attribute data, consisting of the data type and the
 * attribute value itself.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>HASH, RANGE
 */
@property (nonatomic, retain) NSString *keyType;


/**
 * Default constructor for a new KeySchemaElement object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new KeySchemaElement object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theAttributeName Represents the name of a key attribute.
 * @param theKeyType Represents the attribute data, consisting of the
 * data type and the attribute value itself.
 */
-(id)initWithAttributeName:(NSString *)theAttributeName andKeyType:(NSString *)theKeyType;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
