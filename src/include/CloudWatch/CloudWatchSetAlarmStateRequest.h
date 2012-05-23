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
 * Set Alarm State Request
 */

@interface CloudWatchSetAlarmStateRequest:AmazonServiceRequestConfig

{
    NSString *alarmName;
    NSString *stateValue;
    NSString *stateReason;
    NSString *stateReasonData;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The descriptive name for the alarm. This name must be unique within
 * the user's AWS account. The maximum length is 255 characters.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *alarmName;

/**
 * The value of the state.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>OK, ALARM, INSUFFICIENT_DATA
 */
@property (nonatomic, retain) NSString *stateValue;

/**
 * The reason that this alarm is set to this specific state (in
 * human-readable text format)
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 1023<br/>
 */
@property (nonatomic, retain) NSString *stateReason;

/**
 * The reason that this alarm is set to this specific state (in
 * machine-readable JSON format)
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 4000<br/>
 */
@property (nonatomic, retain) NSString *stateReasonData;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
