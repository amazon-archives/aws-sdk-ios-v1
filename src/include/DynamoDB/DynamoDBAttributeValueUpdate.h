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

#import "DynamoDBAttributeValue.h"



/**
 * Attribute Value Update
 */

@interface DynamoDBAttributeValueUpdate:NSObject

{
    DynamoDBAttributeValue *value;
    NSString               *action;
}



/**
 * The value of the Value property for this object.
 */
@property (nonatomic, retain) DynamoDBAttributeValue *value;

/**
 * The value of the Action property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ADD, PUT, DELETE
 */
@property (nonatomic, retain) NSString *action;


/**
 * Default constructor for a new AttributeValueUpdate object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AttributeValueUpdate object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theValue
 * @param theAction
 */
-(id)initWithValue:(DynamoDBAttributeValue *)theValue andAction:(NSString *)theAction;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
