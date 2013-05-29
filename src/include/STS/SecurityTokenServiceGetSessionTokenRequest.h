/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Get Session Token Request
 */

@interface SecurityTokenServiceGetSessionTokenRequest:AmazonServiceRequestConfig

{
    NSNumber *durationSeconds;
    NSString *serialNumber;
    NSString *tokenCode;
}



/**
 * The duration, in seconds, that the credentials should remain valid.
 * Acceptable durations for IAM user sessions range from 900 seconds (15
 * minutes) to 129600 seconds (36 hours), with 43200 seconds (12 hours)
 * as the default. Sessions for AWS account owners are restricted to a
 * maximum of 3600 seconds (one hour). If the duration is longer than one
 * hour, the session for AWS account owners defaults to one hour.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>900 - 129600<br/>
 */
@property (nonatomic, retain) NSNumber *durationSeconds;

/**
 * The identification number of the MFA device that is associated with
 * the IAM user who is making the <code>GetSessionToken</code> call.
 * Specify this value if the IAM user has a policy that requires MFA
 * authentication. The value is either the serial number for a hardware
 * device (such as <code>GAHT12345678</code>) or an Amazon Resource Name
 * (ARN) for a virtual device (such as
 * <code>arn:aws:iam::123456789012:mfa/user</code>). You can find the
 * device for an IAM user by going to the AWS Management Console and
 * viewing the user's security credentials.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>9 - 256<br/>
 * <b>Pattern: </b>[\w+=/:,.@-]*<br/>
 */
@property (nonatomic, retain) NSString *serialNumber;

/**
 * The value provided by the MFA device, if MFA is required. If any
 * policy requires the IAM user to submit an MFA code, specify this
 * value. If MFA authentication is required, and the user does not
 * provide a code when requesting a set of temporary security
 * credentials, the user will receive an "access denied" response when
 * requesting resources that require MFA authentication.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>6 - 6<br/>
 * <b>Pattern: </b>[\d]*<br/>
 */
@property (nonatomic, retain) NSString *tokenCode;


/**
 * Default constructor for a new GetSessionTokenRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
