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

#import "EC2ExportToS3TaskSpecification.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Instance Export Task Request
 */

@interface EC2CreateInstanceExportTaskRequest:AmazonServiceRequestConfig

{
    NSString                       *descriptionValue;
    NSString                       *instanceId;
    NSString                       *targetEnvironment;
    EC2ExportToS3TaskSpecification *exportToS3Task;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The value of the InstanceId property for this object.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The value of the TargetEnvironment property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>citrix, vmware
 */
@property (nonatomic, retain) NSString *targetEnvironment;

/**
 * The value of the ExportToS3Task property for this object.
 */
@property (nonatomic, retain) EC2ExportToS3TaskSpecification *exportToS3Task;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
