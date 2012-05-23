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
 * Describe Alarms Request
 */

@interface CloudWatchDescribeAlarmsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *alarmNames;
    NSString       *alarmNamePrefix;
    NSString       *stateValue;
    NSString       *actionPrefix;
    NSNumber       *maxRecords;
    NSString       *nextToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A list of alarm names to retrieve information for.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 100<br/>
 */
@property (nonatomic, retain) NSMutableArray *alarmNames;

/**
 * The alarm name prefix. <code>AlarmNames</code> cannot be specified if
 * this parameter is specified.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *alarmNamePrefix;

/**
 * The state value to be used in matching alarms.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>OK, ALARM, INSUFFICIENT_DATA
 */
@property (nonatomic, retain) NSString *stateValue;

/**
 * The action name prefix.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1024<br/>
 */
@property (nonatomic, retain) NSString *actionPrefix;

/**
 * The maximum number of alarm descriptions to retrieve.
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
 * Adds a single object to alarmNames.
 * This function will alloc and init alarmNames if not already done.
 */
-(void)addAlarmName:(NSString *)alarmNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
