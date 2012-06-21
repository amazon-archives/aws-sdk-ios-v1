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

#import <Foundation/Foundation.h>

#define TOKEN_VENDING_MACHINE_URL    @"CHANGE ME"
#define USE_SSL                      NO
#define CREDENTIALS_ALERT_MESSAGE    @"Please update the Constants.h file with the Token Vending Machine URL."
#define TEST_TABLE_NAME              @"TestUserPreference"

@interface Constants:NSObject
{
}

+(NSString *)getRandomName;
+(NSArray *)getColors;

@end
