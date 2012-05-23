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
 * List Domains Request
 */

@interface SimpleDBListDomainsRequest:AmazonServiceRequestConfig

{
    NSNumber *maxNumberOfDomains;
    NSString *nextToken;
}



/**
 * The maximum number of domain names you want returned. The range is 1
 * to 100. The default setting is 100.
 */
@property (nonatomic, retain) NSNumber *maxNumberOfDomains;

/**
 * A string informing Amazon SimpleDB where to start the next list of
 * domain names.
 */
@property (nonatomic, retain) NSString *nextToken;


/**
 * Default constructor for a new ListDomainsRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
