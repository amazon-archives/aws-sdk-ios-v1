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




/**
 * Identity Dkim Attributes
 */

@interface SESIdentityDkimAttributes:NSObject

{
    BOOL           dkimEnabled;
    BOOL           dkimEnabledIsSet;
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
@property (nonatomic) BOOL           dkimEnabled;

@property (nonatomic, readonly) BOOL dkimEnabledIsSet;

/**
 * Describes whether Amazon SES has successfully verified the DKIM DNS
 * records (tokens) published in the domain name's DNS. (This only
 * applies to domain identities, not email address identities.)
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>Pending, Success, Failed, TemporaryFailure, NotStarted
 */
@property (nonatomic, retain) NSString *dkimVerificationStatus;

/**
 * A set of character strings that represent the domain's identity. Using
 * these tokens, you will need to create DNS CNAME records that point to
 * DKIM public keys hosted by Amazon SES. Amazon Web Services will
 * eventually detect that you have updated your DNS records; this
 * detection process may take up to 72 hours. Upon successful detection,
 * Amazon SES will be able to DKIM-sign email originating from that
 * domain. (This only applies to domain identities, not email address
 * identities.) <p>For more information about creating DNS records using
 * DKIM tokens, go to the <a
 * mazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon
 * SES Developer Guide</a>.
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
