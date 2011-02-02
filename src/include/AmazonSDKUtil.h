/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AmazonClientException.h"

#define AWS_SDK_VERSION				@"0.1.0.3"
#define AWS_SDK_USER_AGENT_FORMAT	@"aws-sdk-iOS/%@ %@/%@ %@"
#define kISO8061DateFormat			@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

@interface AmazonSDKUtil : NSObject {

}

+(NSString *)userAgentString;
+(NSString *)MIMETypeForExtension:(NSString *)extension;
+(NSString *)urlEncode:(NSString *)input;
+(NSNumber*)convertStringToNumber:(NSString*)string;
+(NSURL *)URLWithURL:(NSURL *)theURL andProtocol:(NSString *)theProtocol;
+(NSLocale *)timestampLocale;
@end

@interface NSDate (WithISO8061Format)

-(NSString *)stringWithISO8061Format;
+(NSDate *)dateWithISO8061Format:(NSString *)dateString;
+(NSString *)ISO8061FormattedCurrentTimestamp;

@end

