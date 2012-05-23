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
 * Destination
 */

@interface SESDestination:NSObject

{
    NSMutableArray *toAddresses;
    NSMutableArray *ccAddresses;
    NSMutableArray *bccAddresses;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The To: field(s) of the message.
 */
@property (nonatomic, retain) NSMutableArray *toAddresses;

/**
 * The CC: field(s) of the message.
 */
@property (nonatomic, retain) NSMutableArray *ccAddresses;

/**
 * The BCC: field(s) of the message.
 */
@property (nonatomic, retain) NSMutableArray *bccAddresses;

/**
 * Adds a single object to toAddresses.
 * This function will alloc and init toAddresses if not already done.
 */
-(void)addToAddresse:(NSString *)toAddresseObject;

/**
 * Adds a single object to ccAddresses.
 * This function will alloc and init ccAddresses if not already done.
 */
-(void)addCcAddresse:(NSString *)ccAddresseObject;

/**
 * Adds a single object to bccAddresses.
 * This function will alloc and init bccAddresses if not already done.
 */
-(void)addBccAddresse:(NSString *)bccAddresseObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
