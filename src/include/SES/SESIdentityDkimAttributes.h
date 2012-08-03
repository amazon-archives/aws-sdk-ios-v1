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
 * Identity Dkim Attributes
 */

@interface SESIdentityDkimAttributes:NSObject

{
    bool           dkimEnabled;
    bool           dkimEnabledIsSet;
    NSString       *dkimVerificationStatus;
    NSMutableArray *dkimTokens;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * True if DKIM signing is enabled for email sent from the identity;
 * false otherwise.
 */
@property (nonatomic) bool           dkimEnabled;

@property (nonatomic, readonly) bool dkimEnabledIsSet;

/**
 * Describes whether Amazon SES has successfully verified the DKIM DNS
 * records (tokens) published in the domain name's DNS. (This only
 * applies to domain identities, not email address identities.)
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>Pending, Success, Failed, TemporaryFailure
 */
@property (nonatomic, retain) NSString *dkimVerificationStatus;

/**
 * A set of DNS records (tokens) that must be published in the domain
 * name's DNS for DKIM verification to complete, and which must remain
 * published in order for DKIM signing to succeed. The tokens are
 * <code>CNAME</code> DNS records that point to DKIM public keys hosted
 * by Amazon SES. (This only applies to domain entities, not email
 * address identities.)
 */
@property (nonatomic, retain) NSMutableArray *dkimTokens;

/**
 * Adds a single object to dkimTokens.
 * This function will alloc and init dkimTokens if not already done.
 */
-(void)addDkimToken:(NSString *)dkimTokenObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
