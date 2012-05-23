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
 * Credentials
 */

@interface SecurityTokenServiceCredentials:NSObject

{
    NSString *accessKeyId;
    NSString *secretAccessKey;
    NSString *sessionToken;
    NSDate   *expiration;
}



/**
 * AccessKeyId ID that identifies the temporary credentials.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>16 - 32<br/>
 * <b>Pattern: </b>[\w]*<br/>
 */
@property (nonatomic, retain) NSString *accessKeyId;

/**
 * The Secret Access Key to sign requests.
 */
@property (nonatomic, retain) NSString *secretAccessKey;

/**
 * The security token that users must pass to the service API to use the
 * temporary credentials.
 */
@property (nonatomic, retain) NSString *sessionToken;

/**
 * The date on which these credentials expire.
 */
@property (nonatomic, retain) NSDate *expiration;


/**
 * Default constructor for a new Credentials object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new Credentials object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theAccessKeyId AccessKeyId ID that identifies the temporary
 * credentials.
 * @param theSecretAccessKey The Secret Access Key to sign requests.
 * @param theSessionToken The security token that users must pass to the
 * service API to use the temporary credentials.
 * @param theExpiration The date on which these credentials expire.
 */
-(id)initWithAccessKeyId:(NSString *)theAccessKeyId andSecretAccessKey:(NSString *)theSecretAccessKey andSessionToken:(NSString *)theSessionToken andExpiration:(NSDate *)theExpiration;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
