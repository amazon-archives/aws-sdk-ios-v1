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
 * Health Check
 */

@interface ElasticLoadBalancingHealthCheck:NSObject

{
    NSString *target;
    NSNumber *interval;
    NSNumber *timeout;
    NSNumber *unhealthyThreshold;
    NSNumber *healthyThreshold;
}



/**
 * Specifies the instance being checked. The protocol is either TCP,
 * HTTP, HTTPS, or SSL. The range of valid ports is one (1) through
 * 65535. <note> <p> TCP is the default, specified as a TCP: port pair,
 * for example "TCP:5000". In this case a healthcheck simply attempts to
 * open a TCP connection to the instance on the specified port. Failure
 * to connect within the configured timeout is considered unhealthy.
 * <p>SSL is also specified as SSL: port pair, for example, SSL:5000. <p>
 * For HTTP or HTTPS protocol, the situation is different. You have to
 * include a ping path in the string. HTTP is specified as a
 * HTTP:port;/;PathToPing; grouping, for example
 * "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is
 * issued to the instance on the given port and path. Any answer other
 * than "200 OK" within the timeout period is considered unhealthy. <p>
 * The total length of the HTTP ping target needs to be 1024 16-bit
 * Unicode characters or less. </note>
 */
@property (nonatomic, retain) NSString *target;

/**
 * Specifies the approximate interval, in seconds, between health checks
 * of an individual instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 300<br/>
 */
@property (nonatomic, retain) NSNumber *interval;

/**
 * Specifies the amount of time, in seconds, during which no response
 * means a failed health probe. <note> This value must be less than the
 * <i>Interval</i> value. </note>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 300<br/>
 */
@property (nonatomic, retain) NSNumber *timeout;

/**
 * Specifies the number of consecutive health probe failures required
 * before moving the instance to the <i>Unhealthy</i> state.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>2 - 10<br/>
 */
@property (nonatomic, retain) NSNumber *unhealthyThreshold;

/**
 * Specifies the number of consecutive health probe successes required
 * before moving the instance to the <i>Healthy</i> state.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>2 - 10<br/>
 */
@property (nonatomic, retain) NSNumber *healthyThreshold;


/**
 * Default constructor for a new HealthCheck object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new HealthCheck object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTarget Specifies the instance being checked. The protocol is
 * either TCP, HTTP, HTTPS, or SSL. The range of valid ports is one (1)
 * through 65535. <note> <p> TCP is the default, specified as a TCP: port
 * pair, for example "TCP:5000". In this case a healthcheck simply
 * attempts to open a TCP connection to the instance on the specified
 * port. Failure to connect within the configured timeout is considered
 * unhealthy. <p>SSL is also specified as SSL: port pair, for example,
 * SSL:5000. <p> For HTTP or HTTPS protocol, the situation is different.
 * You have to include a ping path in the string. HTTP is specified as a
 * HTTP:port;/;PathToPing; grouping, for example
 * "HTTP:80/weather/us/wa/seattle". In this case, a HTTP GET request is
 * issued to the instance on the given port and path. Any answer other
 * than "200 OK" within the timeout period is considered unhealthy. <p>
 * The total length of the HTTP ping target needs to be 1024 16-bit
 * Unicode characters or less. </note>
 * @param theInterval Specifies the approximate interval, in seconds,
 * between health checks of an individual instance.
 * @param theTimeout Specifies the amount of time, in seconds, during
 * which no response means a failed health probe. <note> This value must
 * be less than the <i>Interval</i> value. </note>
 * @param theUnhealthyThreshold Specifies the number of consecutive
 * health probe failures required before moving the instance to the
 * <i>Unhealthy</i> state.
 * @param theHealthyThreshold Specifies the number of consecutive health
 * probe successes required before moving the instance to the
 * <i>Healthy</i> state.
 */
-(id)initWithTarget:(NSString *)theTarget andInterval:(NSNumber *)theInterval andTimeout:(NSNumber *)theTimeout andUnhealthyThreshold:(NSNumber *)theUnhealthyThreshold andHealthyThreshold:(NSNumber *)theHealthyThreshold;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
