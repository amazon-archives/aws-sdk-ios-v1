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
 * Create Domain Request
 */

@interface SimpleDBCreateDomainRequest:AmazonServiceRequestConfig

{
    NSString *domainName;
}



/**
 * The name of the domain to create. The name can range between 3 and 255
 * characters and can contain the following characters: a-z, A-Z, 0-9,
 * '_', '-', and '.'.
 */
@property (nonatomic, retain) NSString *domainName;


/**
 * Default constructor for a new CreateDomainRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateDomainRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain to create. The name can
 * range between 3 and 255 characters and can contain the following
 * characters: a-z, A-Z, 0-9, '_', '-', and '.'.
 */
-(id)initWithDomainName:(NSString *)theDomainName;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
