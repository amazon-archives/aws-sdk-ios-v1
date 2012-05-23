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
 * Alarm History Item
 */

@interface CloudWatchAlarmHistoryItem:NSObject

{
    NSString *alarmName;
    NSDate   *timestamp;
    NSString *historyItemType;
    NSString *historySummary;
    NSString *historyData;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The descriptive name for the alarm.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *alarmName;

/**
 * The time stamp for the alarm history item.
 */
@property (nonatomic, retain) NSDate *timestamp;

/**
 * The type of alarm history item.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ConfigurationUpdate, StateUpdate, Action
 */
@property (nonatomic, retain) NSString *historyItemType;

/**
 * A human-readable summary of the alarm history.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *historySummary;

/**
 * Machine-readable data about the alarm in JSON format.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 4095<br/>
 */
@property (nonatomic, retain) NSString *historyData;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
