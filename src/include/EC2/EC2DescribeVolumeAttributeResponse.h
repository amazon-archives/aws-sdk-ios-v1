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

#import "EC2ProductCode.h"

#import "EC2Response.h"
#import "../AmazonServiceExceptionUnmarshaller.h"



/**
 * Describe Volume Attribute Response
 */

@interface EC2DescribeVolumeAttributeResponse:EC2Response

{
    NSString       *volumeId;
    bool           autoEnableIO;
    bool           autoEnableIOIsSet;
    NSMutableArray *productCodes;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the VolumeId property for this object.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * Boolean value
 */
@property (nonatomic) bool           autoEnableIO;

@property (nonatomic, readonly) bool autoEnableIOIsSet;

/**
 * The value of the ProductCodes property for this object.
 */
@property (nonatomic, retain) NSMutableArray *productCodes;



/**
 * Returns a value from the productCodes array for the specified index
 */
-(EC2ProductCode *)productCodesObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
