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

#import "EC2UserIdGroupPair.h"



/**
 * Ip Permission
 */

@interface EC2IpPermission:NSObject

{
    NSString       *ipProtocol;
    NSNumber       *fromPort;
    NSNumber       *toPort;
    NSMutableArray *userIdGroupPairs;
    NSMutableArray *ipRanges;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The IP protocol of this permission. <p> Valid protocol values:
 * <code>tcp</code>, <code>udp</code>, <code>icmp</code>
 */
@property (nonatomic, retain) NSString *ipProtocol;

/**
 * Start of port range for the TCP and UDP protocols, or an ICMP type
 * number. An ICMP type number of <code>-1</code> indicates a wildcard
 * (i.e., any ICMP type number).
 */
@property (nonatomic, retain) NSNumber *fromPort;

/**
 * End of port range for the TCP and UDP protocols, or an ICMP code. An
 * ICMP code of <code>-1</code> indicates a wildcard (i.e., any ICMP
 * code).
 */
@property (nonatomic, retain) NSNumber *toPort;

/**
 * The list of AWS user IDs and groups included in this permission.
 */
@property (nonatomic, retain) NSMutableArray *userIdGroupPairs;

/**
 * The list of CIDR IP ranges included in this permission.
 */
@property (nonatomic, retain) NSMutableArray *ipRanges;

/**
 * Adds a single object to userIdGroupPairs.
 * This function will alloc and init userIdGroupPairs if not already done.
 */
-(void)addUserIdGroupPair:(EC2UserIdGroupPair *)userIdGroupPairObject;

/**
 * Adds a single object to ipRanges.
 * This function will alloc and init ipRanges if not already done.
 */
-(void)addIpRange:(NSString *)ipRangeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
