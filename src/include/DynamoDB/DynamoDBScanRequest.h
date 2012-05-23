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

#import "DynamoDBCondition.h"
#import "DynamoDBKey.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Scan Request
 */

@interface DynamoDBScanRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSMutableArray      *attributesToGet;
    NSNumber            *limit;
    bool                count;
    bool                countIsSet;
    NSMutableDictionary *scanFilter;
    DynamoDBKey         *exclusiveStartKey;
}



/**
 * The name of the table in which you want to scan. Allowed characters
 * are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>,
 * <code>_</code> (underscore), <code>-</code> (hyphen) and
 * <code>.</code> (period).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * List of <code>Attribute</code> names. If attribute names are not
 * specified then all attributes will be returned. If some attributes are
 * not found, they will not appear in the result.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * The maximum number of items to return. If Amazon DynamoDB hits this
 * limit while scanning the table, it stops the scan and returns the
 * matching values up to the limit, and a <code>LastEvaluatedKey</code>
 * to apply in a subsequent operation to continue the scan. Also, if the
 * scanned data set size exceeds 1 MB before Amazon DynamoDB hits this
 * limit, it stops the scan and returns the matching values up to the
 * limit, and a <code>LastEvaluatedKey</code> to apply in a subsequent
 * operation to continue the scan.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, retain) NSNumber *limit;

/**
 * If set to <code>true</code>, Amazon DynamoDB returns a total number of
 * items for the <code>Scan</code> operation, even if the operation has
 * no matching items for the assigned filter. Do not set
 * <code>Count</code> to <code>true</code> while providing a list of
 * <code>AttributesToGet</code>, otherwise Amazon DynamoDB returns a
 * validation error.
 */
@property (nonatomic) bool           count;

@property (nonatomic, readonly) bool countIsSet;

/**
 * Evaluates the scan results and returns only the desired values.
 */
@property (nonatomic, retain) NSMutableDictionary *scanFilter;

/**
 * Primary key of the item from which to continue an earlier scan. An
 * earlier scan might provide this value if that scan operation was
 * interrupted before scanning the entire table; either because of the
 * result set size or the <code>Limit</code> parameter. The
 * <code>LastEvaluatedKey</code> can be passed back in a new scan request
 * to continue the operation from that point.
 */
@property (nonatomic, retain) DynamoDBKey *exclusiveStartKey;


/**
 * Default constructor for a new ScanRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ScanRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table in which you want to scan.
 * Allowed characters are <code>a-z</code>, <code>A-Z</code>,
 * <code>0-9</code>, <code>_</code> (underscore), <code>-</code> (hyphen)
 * and <code>.</code> (period).
 */
-(id)initWithTableName:(NSString *)theTableName;

/**
 * Adds a single object to attributesToGet.
 * This function will alloc and init attributesToGet if not already done.
 */
-(void)addAttributesToGet:(NSString *)attributesToGetObject;


/**
 * Set a value in the dictionary scanFilter for the specified key.
 * This function will alloc and init scanFilter if not already done.
 */
-(void)setScanFilterValue:(DynamoDBCondition *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
