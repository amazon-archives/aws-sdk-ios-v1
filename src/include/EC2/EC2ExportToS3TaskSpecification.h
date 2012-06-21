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




/**
 * Export To S3 Task Specification
 */

@interface EC2ExportToS3TaskSpecification:NSObject

{
    NSString *diskImageFormat;
    NSString *containerFormat;
    NSString *s3Bucket;
    NSString *s3Prefix;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the DiskImageFormat property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>vmdk, vhd
 */
@property (nonatomic, retain) NSString *diskImageFormat;

/**
 * The value of the ContainerFormat property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ova
 */
@property (nonatomic, retain) NSString *containerFormat;

/**
 * The value of the S3Bucket property for this object.
 */
@property (nonatomic, retain) NSString *s3Bucket;

/**
 * The value of the S3Prefix property for this object.
 */
@property (nonatomic, retain) NSString *s3Prefix;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
