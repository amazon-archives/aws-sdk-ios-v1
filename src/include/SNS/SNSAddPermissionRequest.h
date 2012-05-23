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
 * Add Permission Request
 */

@interface SNSAddPermissionRequest:AmazonServiceRequestConfig

{
    NSString       *topicArn;
    NSString       *label;
    NSMutableArray *aWSAccountIds;
    NSMutableArray *actionNames;
}



/**
 * The ARN of the topic whose access control policy you wish to modify.
 */
@property (nonatomic, retain) NSString *topicArn;

/**
 * A unique identifier for the new policy statement.
 */
@property (nonatomic, retain) NSString *label;

/**
 * The AWS account IDs of the users (principals) who will be given access
 * to the specified actions. The users must have AWS accounts, but do not
 * need to be signed up for this service. <!--For information about
 * locating the AWS account identification, see <a
 * eService/latest/SQSDeveloperGuide/index.html?AWSCredentials.html">Your
 * AWS Identifiers</aulink> in the &service; Developer Guide.-->
 */
@property (nonatomic, retain) NSMutableArray *aWSAccountIds;

/**
 * The action you want to allow for the specified principal(s).
 */
@property (nonatomic, retain) NSMutableArray *actionNames;


/**
 * Default constructor for a new AddPermissionRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AddPermissionRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The ARN of the topic whose access control policy
 * you wish to modify.
 * @param theLabel A unique identifier for the new policy statement.
 * @param theAWSAccountIds The AWS account IDs of the users (principals)
 * who will be given access to the specified actions. The users must have
 * AWS accounts, but do not need to be signed up for this service.
 * <!--For information about locating the AWS account identification, see
 * <a
 * eService/latest/SQSDeveloperGuide/index.html?AWSCredentials.html">Your
 * AWS Identifiers</aulink> in the &service; Developer Guide.-->
 * @param theActionNames The action you want to allow for the specified
 * principal(s).
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andLabel:(NSString *)theLabel andAWSAccountIds:(NSMutableArray *)theAWSAccountIds andActionNames:(NSMutableArray *)theActionNames;

/**
 * Adds a single object to aWSAccountIds.
 * This function will alloc and init aWSAccountIds if not already done.
 */
-(void)addAWSAccountId:(NSString *)aWSAccountIdObject;

/**
 * Adds a single object to actionNames.
 * This function will alloc and init actionNames if not already done.
 */
-(void)addActionName:(NSString *)actionNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
