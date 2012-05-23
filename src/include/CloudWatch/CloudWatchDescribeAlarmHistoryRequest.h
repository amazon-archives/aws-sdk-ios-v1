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
 * Describe Alarm History Request
 */

@interface CloudWatchDescribeAlarmHistoryRequest:AmazonServiceRequestConfig

{
    NSString *alarmName;
    NSString *historyItemType;
    NSDate   *startDate;
    NSDate   *endDate;
    NSNumber *maxRecords;
    NSString *nextToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the alarm.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *alarmName;

/**
 * The type of alarm histories to retrieve.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ConfigurationUpdate, StateUpdate, Action
 */
@property (nonatomic, retain) NSString *historyItemType;

/**
 * The starting date to retrieve alarm history.
 */
@property (nonatomic, retain) NSDate *startDate;

/**
 * The ending date to retrieve alarm history.
 */
@property (nonatomic, retain) NSDate *endDate;

/**
 * The maximum number of alarm history records to retrieve.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSNumber *maxRecords;

/**
 * The token returned by a previous call to indicate that there is more
 * data available.
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
