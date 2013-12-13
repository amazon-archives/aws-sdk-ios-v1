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


#import "SESResponse.h"



/**
 * Verify Domain Dkim Result
 */

@interface SESVerifyDomainDkimResponse:SESResponse

{
    NSMutableArray *dkimTokens;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A set of character strings that represent the domain's identity. If
 * the identity is an email address, the tokens represent the domain of
 * that address. <p>Using these tokens, you will need to create DNS CNAME
 * records that point to DKIM public keys hosted by Amazon SES. Amazon
 * Web Services will eventually detect that you have updated your DNS
 * records; this detection process may take up to 72 hours. Upon
 * successful detection, Amazon SES will be able to DKIM-sign emails
 * originating from that domain. <p>For more information about creating
 * DNS records using DKIM tokens, go to the <a
 * mazon.com/ses/latest/DeveloperGuide/easy-dkim-dns-records.html">Amazon
 * SES Developer Guide</a>.
 */
@property (nonatomic, retain) NSMutableArray *dkimTokens;



/**
 * Returns a value from the dkimTokens array for the specified index
 */
-(NSString *)dkimTokensObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
