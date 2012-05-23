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
 * List Tables Request
 */

@interface DynamoDBListTablesRequest:AmazonServiceRequestConfig

{
    NSString *exclusiveStartTableName;
    NSNumber *limit;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the table that starts the list. If you already ran a
 * <code>ListTables</code> operation and received a
 * <code>LastEvaluatedTableName</code> value in the response, use that
 * value here to continue the list.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *exclusiveStartTableName;

/**
 * A number of maximum table names to return.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSNumber *limit;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
