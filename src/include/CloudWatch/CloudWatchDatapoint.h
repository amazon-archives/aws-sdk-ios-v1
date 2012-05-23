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
 * Datapoint
 */

@interface CloudWatchDatapoint:NSObject

{
    NSDate   *timestamp;
    NSNumber *sampleCount;
    NSNumber *average;
    NSNumber *sum;
    NSNumber *minimum;
    NSNumber *maximum;
    NSString *unit;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The time stamp used for the datapoint.
 */
@property (nonatomic, retain) NSDate *timestamp;

/**
 * The number of metric values that contributed to the aggregate value of
 * this datapoint.
 */
@property (nonatomic, retain) NSNumber *sampleCount;

/**
 * The average of metric values that correspond to the datapoint.
 */
@property (nonatomic, retain) NSNumber *average;

/**
 * The sum of metric values used for the datapoint.
 */
@property (nonatomic, retain) NSNumber *sum;

/**
 * The minimum metric value used for the datapoint.
 */
@property (nonatomic, retain) NSNumber *minimum;

/**
 * The maximum of the metric value used for the datapoint.
 */
@property (nonatomic, retain) NSNumber *maximum;

/**
 * The standard unit used for the datapoint.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>Seconds, Microseconds, Milliseconds, Bytes, Kilobytes, Megabytes, Gigabytes, Terabytes, Bits, Kilobits, Megabits, Gigabits, Terabits, Percent, Count, Bytes/Second, Kilobytes/Second, Megabytes/Second, Gigabytes/Second, Terabytes/Second, Bits/Second, Kilobits/Second, Megabits/Second, Gigabits/Second, Terabits/Second, Count/Second, None
 */
@property (nonatomic, retain) NSString *unit;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
