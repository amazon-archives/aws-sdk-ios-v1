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

#import "EC2Storage.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Bundle Instance Request
 */

@interface EC2BundleInstanceRequest:AmazonServiceRequestConfig

{
    NSString   *instanceId;
    EC2Storage *storage;
}



/**
 * The ID of the instance to bundle.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 *
 */
@property (nonatomic, retain) EC2Storage *storage;


/**
 * Default constructor for a new BundleInstanceRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new BundleInstanceRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theInstanceId The ID of the instance to bundle.
 * @param theStorage
 */
-(id)initWithInstanceId:(NSString *)theInstanceId andStorage:(EC2Storage *)theStorage;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
