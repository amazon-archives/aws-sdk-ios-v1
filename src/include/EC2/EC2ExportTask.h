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

#import "EC2InstanceExportDetails.h"
#import "EC2ExportToS3Task.h"



/**
 * Export Task
 */

@interface EC2ExportTask:NSObject

{
    NSString                 *exportTaskId;
    NSString                 *descriptionValue;
    NSString                 *state;
    NSString                 *statusMessage;
    EC2InstanceExportDetails *instanceExportDetails;
    EC2ExportToS3Task        *exportToS3Task;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the ExportTaskId property for this object.
 */
@property (nonatomic, retain) NSString *exportTaskId;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The value of the State property for this object.
 */
@property (nonatomic, retain) NSString *state;

/**
 * The value of the StatusMessage property for this object.
 */
@property (nonatomic, retain) NSString *statusMessage;

/**
 * The value of the InstanceExportDetails property for this object.
 */
@property (nonatomic, retain) EC2InstanceExportDetails *instanceExportDetails;

/**
 * The value of the ExportToS3Task property for this object.
 */
@property (nonatomic, retain) EC2ExportToS3Task *exportToS3Task;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
