/**
 * Copyright 2012-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy
 * of the License is located at
 *
 * http://aws.amazon.com/apache2.0/
 *
 * or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "AIAuthenticationDelegate.h"

/*!
 @typedef AISignInViewMode
 @abstract Reserved.
 
 @since 1.0
 */
typedef enum {
    kSignInModeWebView = 1,
    kSignInModeSafari = 2
} AISignInViewMode;

/*!
 @header AIMobileLibInternal
 @discussion AIMobileLibInternal is a static class that contains Browser related Login with Amazon APIs. This class provides APIs for Login with Amazon, browser specific flow. Other APIs are contained in AIMobileLib
 
 @version 1.1
 */
@interface AIMobileLibInternal : NSObject

/*!
 @method handleOpenURL:sourceApplication:
 @abstract Reserved.
 
 @since 1.0
 */
+ (BOOL) handleOpenURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication;

/*!
 @method setDefaultSignInViewMode:
 @abstract Reserved.
 
 @since 1.0
 */
+ (void)setDefaultSignInViewMode:(AISignInViewMode)signInViewMode;

@end