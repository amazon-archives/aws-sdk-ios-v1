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
 * Send Data Point
 */

@interface SESSendDataPoint:NSObject

{
    NSDate   *timestamp;
    NSNumber *deliveryAttempts;
    NSNumber *bounces;
    NSNumber *complaints;
    NSNumber *rejects;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Time of the data point.
 */
@property (nonatomic, retain) NSDate *timestamp;

/**
 * Number of emails that have been enqueued for sending.
 */
@property (nonatomic, retain) NSNumber *deliveryAttempts;

/**
 * Number of emails that have bounced.
 */
@property (nonatomic, retain) NSNumber *bounces;

/**
 * Number of unwanted emails that were rejected by recipients.
 */
@property (nonatomic, retain) NSNumber *complaints;

/**
 * Number of emails rejected by Amazon SES.
 */
@property (nonatomic, retain) NSNumber *rejects;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
