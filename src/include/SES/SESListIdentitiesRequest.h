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
 * List Identities Request
 */

@interface SESListIdentitiesRequest:AmazonServiceRequestConfig

{
    NSString *identityType;
    NSString *nextToken;
    NSNumber *maxItems;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The type of the identities to list. Possible values are "EmailAddress"
 * and "Domain". If this parameter is omitted, then all identities will
 * be listed.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>EmailAddress, Domain
 */
@property (nonatomic, retain) NSString *identityType;

/**
 * The token to use for pagination.
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * The maximum number of identities per page. Possible values are 1-100
 * inclusive.
 */
@property (nonatomic, retain) NSNumber *maxItems;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
