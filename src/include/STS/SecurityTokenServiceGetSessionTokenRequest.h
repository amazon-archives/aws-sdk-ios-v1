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
 * Acceptable durations for IAM user sessions range from 3600s (one hour)
 * to 129600s (36 hours), with 43200s (12 hours) as the default. Sessions
 * for AWS account owners are restricted to a maximum of 3600s (one
 * hour).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>3600 - 129600<br/>
 */
@property (nonatomic, retain) NSNumber *durationSeconds;

/**
 * The identification number of the MFA device for the user. If the IAM
 * user has a policy requiring MFA authentication (or is in a group
 * requiring MFA authentication) to access resources, provide the device
 * value here.<p>The value is in the <b>Security Credentials</b> tab of
 * the user's details pane in the IAM console. If the IAM user has an
 * active MFA device, the details pane displays a <b>Multi-Factor
 * Authentication Device</b> value. The value is either for a virtual
 * device, such as <code>arn:aws:iam::123456789012:mfa/user</code>, or it
 * is the device serial number for a hardware device (usually the number
 * from the back of the device), such as <code>GAHT12345678</code>. For
 * more information, see <a
 * ocs.amazonwebservices.com/IAM/latest/UserGuide/Using_ManagingMFA.html"
 * target="_blank">Using Multi-Factor Authentication (MFA) Devices with
 * AWS</a> in <i>Using IAM</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>9 - 256<br/>
 * <b>Pattern: </b>[\w+=/:,.@-]*<br/>
 */
@property (nonatomic, retain) NSString *serialNumber;

/**
 * The value provided by the MFA device. If the user has an access policy
 * requiring an MFA code (or is in a group requiring an MFA code),
 * provide the value here to get permission to resources as specified in
 * the access policy. If MFA authentication is required, and the user
 * does not provide a code when requesting a set of temporary security
 * credentials, the user will receive an "access denied" response when
 * requesting resources that require MFA authentication. For more
 * information, see <a
 * ocs.amazonwebservices.com/IAM/latest/UserGuide/Using_ManagingMFA.html"
 * target="_blank">Using Multi-Factor Authentication (MFA) Devices with
 * AWS</a> in <i>Using IAM</i>.
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
