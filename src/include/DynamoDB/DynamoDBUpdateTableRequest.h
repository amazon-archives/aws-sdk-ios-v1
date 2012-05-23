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

#import "DynamoDBProvisionedThroughput.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Update Table Request
 */

@interface DynamoDBUpdateTableRequest:AmazonServiceRequestConfig

{
    NSString                      *tableName;
    DynamoDBProvisionedThroughput *provisionedThroughput;
}



/**
 * The name of the table you want to update. Allowed characters are
 * <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, <code>_</code>
 * (underscore), <code>-</code> (hyphen) and <code>.</code> (period).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * Provisioned throughput reserves the required read and write resources
 * for your table in terms of <code>ReadCapacityUnits</code> and
 * <code>WriteCapacityUnits</code>. Values for provisioned throughput
 * depend upon your expected read/write rates, item size, and
 * consistency. Provide the expected number of read and write operations,
 * assuming an item size of 1k and strictly consistent reads. For 2k item
 * size, double the value. For 3k, triple the value, etc.
 * Eventually-consistent reads consume half the resources of strictly
 * consistent reads.
 */
@property (nonatomic, retain) DynamoDBProvisionedThroughput *provisionedThroughput;


/**
 * Default constructor for a new UpdateTableRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new UpdateTableRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table you want to update. Allowed
 * characters are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>,
 * <code>_</code> (underscore), <code>-</code> (hyphen) and
 * <code>.</code> (period).
 * @param theProvisionedThroughput Provisioned throughput reserves the
 * required read and write resources for your table in terms of
 * <code>ReadCapacityUnits</code> and <code>WriteCapacityUnits</code>.
 * Values for provisioned throughput depend upon your expected read/write
 * rates, item size, and consistency. Provide the expected number of read
 * and write operations, assuming an item size of 1k and strictly
 * consistent reads. For 2k item size, double the value. For 3k, triple
 * the value, etc. Eventually-consistent reads consume half the resources
 * of strictly consistent reads.
 */
-(id)initWithTableName:(NSString *)theTableName andProvisionedThroughput:(DynamoDBProvisionedThroughput *)theProvisionedThroughput;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
