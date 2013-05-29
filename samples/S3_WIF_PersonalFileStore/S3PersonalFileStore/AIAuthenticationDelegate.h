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


/*!
 @header AIAuthenticationDelegate.h
 @discussion This contains the AIAuthenticationDelegate protocol and supporting classes.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AIError.h"

/*!
 @enum API
 @discussion These constants identify which API succeeded or failed when calling AIAuthenticationDelegate.  The value identifying the API is passed in the @link APIResult @/link and @link APIError @/link objects.
 
 @constant kAPIAuthorizeUser Refers to @link //apple_ref/doc/anysymbol/authorizeUserForScopes:delegate: @/link.
 @constant kAPIGetAccessToken Refers to @link //apple_ref/doc/anysymbol/getAccessTokenForScopes:withOverrideParams:delegate: @/link.
 @constant kAPIClearAuthorizationState Refers to @link //apple_ref/doc/anysymbol/clearAuthorizationState: @/link.
 @constant kAPIGetProfile Refers to @link //apple_ref/doc/anysymbol/getProfile: @/link.
 */
typedef enum {
    kAPIAuthorizeUser = 1,
    kAPIGetAccessToken = 2,
    kAPIClearAuthorizationState = 3,
    kAPIGetProfile = 4
} API;

/*!
 @interface APIResult
 @discussion This interface encapsulates success information from an @link //apple_ref/doc/anysymbol/AIMobileLib @/link API call.
 
 @version 1.0
 */
@interface APIResult : NSObject

/*!
 @property result
 @abstract The result object retuned from the API on success. The API result can be null, a dictionary, or a string depending upon which API created the APIResult.
 
 @discussion SDK passes following result to the application:
 1. @link //apple_ref/doc/anysymbol/authorizeUserForScopes:delegate: @/link : This API passes nil as the result to the delegate.
 2. @link //apple_ref/doc/anysymbol/getAccessTokenForScopes:withOverrideParams:delegate: @/link : This API passes an access token as an NSString object to the delegate.
 3. @link //apple_ref/doc/anysymbol/clearAuthorizationState: @/link : This API passes nil as the result to the delegate.
 4. @link //apple_ref/doc/anysymbol/getProfile: @/link : This API passes profile data in an NSDictionary object to the delegate. See the API description for information on the key:value pairs expected in profile dictionary.
 
 */
@property(retain) id result;

/*!
 @property api
 @abstract The API throwing the error. It takes values from @link API @/link.
 */
@property API api;

- (id)initResultForAPI:(API)anAPI andResult:(id)theResult;

@end

/*!
 @interface APIError
 @discussion This interface encpasulates the failure error result from an @link //apple_ref/doc/anysymbol/AIMobileLib @/link API call.
 
 @version 1.0
 */
@interface APIError: NSObject

/*!
 @property error
 @abstract The error object retuned from the API on failure.
 
 @discussion See @link //apple_ref/doc/anysymbol/AIError @/link for more details
 */
@property(retain) AIError* error;

/*!
 @property api
 @abstract The API which is throwing the error. It takes values from @link API @/link.
 */
@property API api;

- (id)initErrorForAPI:(API)anAPI andError:(id)theErrorObject;

@end

/*!
 @interface AIAuthenticationDelegate
 @discussion Applications calling @link //apple_ref/doc/anysymbol/AIMobileLib @/link APIs must implement the methods of this protocol to receive success and failure information.
 
 @version 1.0
 */
@protocol AIAuthenticationDelegate <NSObject>

@required

/*!
 @method requestDidSucceed:
 @abstract The API calls this delegate when it completes successfully, passing the result.
 @param apiResult A @link APIResult @/link object containing the information about the calling API and the result generated.
 
 @discussion See @link APIResult @/link for more information on the content of the apiResult.
 @since 1.0
 */
- (void) requestDidSucceed:(APIResult*) apiResult;


/*!
 @method requestDidFail:
 @abstract The API calls this delegate when it fails, passing the result.
 
 @param errorResponse A @link APIResult @/link object containing the information about the API and the error that occurred.
 
 @discussion See @link APIError @/link for more information on the content of the result.
 
 @since 1.0
 */
- (void) requestDidFail:(APIError*) errorResponse;

@end