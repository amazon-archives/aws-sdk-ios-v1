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

/*! @header AIMobileLib.h
 @discussion This header includes the AIMobileLib interface that provides all the Login with Amazon APIs.
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "AIAuthenticationDelegate.h"

/*!
 @class AIMobileLib
 @discussion AIMobileLib is a static class that contains Login with Amazon APIs. This class provides APIs for getting authorization from users, getting profile information, clearing authorization state, and getting authorization tokens to access secure data.
 
 @version 1.1
 */
@interface AIMobileLib : NSObject

/*!
 @constant kForceRefresh
 @abstract Key name for defining whether to force a refresh of the access token.
 @discussion Pass this key with a string value of "YES" to @link getAccessTokenForScopes:withOverrideParams:delegate: @/link to force the method to refresh the access token.
 
 @since 1.0
 */
extern const NSString* kForceRefresh;

/*!
 @method authorizeUserForScopes:delegate:
 @abstract Allows the user to login and, if necessary, authorize the application for the requested scopes.
 
 @param scopes The profile scopes that the application is requesting from the user. The first scope must be "profile".  "postal_code" is an optional second scope.
 @param authenticationDelegate A delegate implementing the @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link protocol to receive success and failure messages.
 
 @discussion Use this method to request authorization from the user for the required scopes.  If the user has not logged in, they will see a login page.  Afterward, if they have not previously approved these scopes for your application, they will see a consent page.
 
 Scopes that can be used with this API are:
 1.  "profile": This scope enables an application to request profile information from the backend server. The porfile information includes cusomter's name, email and user_id.
 
 2.  "postal_code": This scope enables an application to request the postal code registered to the user's account.
 
 @result Pass in a valid instance of @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link to receive success and failure notifications.
 
 If authorization succeeds the @link //apple_ref/doc/anysymbol/requestDidSucceed: @/link method is called on the delegate.  The application can now call @link getProfile: @/link to retrieve the user's profile data, or @link getAccessTokenForScopes:withOverrideParams:delegate: @/link to retrieve the raw access token.
 
 If authorization fails the @link //apple_ref/doc/anysymbol/requestDidFail: @/link method is called on the delegate.  The error code and an error message are passed to the method in an APIError object.  authorizeUserForScopes can produce the following error codes:
 
 1.  @link //apple_ref/doc/anysymbol/kAIUnauthorizedClient @/link - The application is not authorized to make this call.
 
 2.  @link //apple_ref/doc/anysymbol/kAIInternalError @/link - An internal error occured in the SDK.  You can allow the user to login again.
 
 3.  @link //apple_ref/doc/anysymbol/kAIErrorUserInterrupted @/link - The user canceled the login page.  You can allow the user to login again.
 
 4.  @link //apple_ref/doc/anysymbol/kAIInvalidInput @/link - One of the API parameters is invalid.  See the error message for more information.
 
 5.  @link //apple_ref/doc/anysymbol/kAIDeviceError @/link -  The SDK encountered an error on the device.  Currently, the SDK only throws this error when it receives the same error from the keychain service. Calling @link clearAuthorizationState: @/link will help.
 
 6.  @link //apple_ref/doc/anysymbol/kAINetworkError @/link - A network error occurred, possibly due to the user being offline.
 
 7.  @link //apple_ref/doc/anysymbol/kAIServerError @/link - The server encountered an error while completing the request, or the SDK received an unknown response from the server.  You can allow the user to login again.
 
 8.  @link //apple_ref/doc/anysymbol/kAIAccessDenied @/link - The user did not consent to the requested scopes.
 
 @since 1.1
 */
+ (void) authorizeUserForScopes:(NSArray*)scopes delegate:(id<AIAuthenticationDelegate>)authenticationDelegate;

/*!
 @method getAccessTokenForScopes:withOverrideParams:delegate:
 @abstract Once the user has logged in, this method will return a valid access token for the requested scopes.
 
 @param scopes The profile scopes required for the token. The first scope must be "profile".  "postal_code" is an optional second scope.
 @param authenticationDelegate A delegate implementing the @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link protocol to receive success and failure messages.
 @param overrideParams Any additional override parameters, as key:value pairs. The SDK currently supports the following override flags:
 
 kForceRefresh - Forces the SDK to refesh the cached access token. See @link kForceRefresh @/link for more information.
 
 @discussion This method returns a valid access token, if necessary by exchanging the current refresh token for a new access token.  If the method is successful, this access token is valid for the requested scopes.
 
    If the API is called with the @link kForceRefresh @/link override property set to "YES", the SDK discards the existing access token and requests a new access token.
 
 @result
 Pass in a valid instance of @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link to receive success and failure notifications.
 
 If authorization succeeds the @link //apple_ref/doc/anysymbol/requestDidSucceed: @/link method is called on the delegate.  The new access token is passed in the result property of the APIResult parameter.  The application can then use the access token directly with services that support it.
 
 If authorization fails the @link //apple_ref/doc/anysymbol/requestDidFail: @/link method is called on the delegate. The error code and an error message are passed to the method in an APIError object.  getAccessTokenForScopes can produce the following error codes:
 
 1.  @link //apple_ref/doc/anysymbol/kAIApplicationNotAuthorized @/link - The application is not authorized for scopes requested. Call authorizeUserForScopes to allow the user to authorize the application.
 
 2.  @link //apple_ref/doc/anysymbol/kAIUnauthorizedClient @/link - The application is not authorized to make this call.
 
 3.  @link //apple_ref/doc/anysymbol/kAIInternalError @/link - An internal error occured in the SDK.  You can retry the method call.
 
 4.  @link //apple_ref/doc/anysymbol/kAIInvalidInput @/link - One of the API parameters is invalid.  See the error message for more information.
 
 5.  @link //apple_ref/doc/anysymbol/kAIDeviceError @/link - The SDK encountered an error on the device.  Currently, the SDK only throws this error when it receives the same error from the keychain service. Calling @link clearAuthorizationState: @/link will help.
 
 6.  @link //apple_ref/doc/anysymbol/kAINetworkError @/link - A network error occurred, possibly due to the user being offline.
 
 7.  @link //apple_ref/doc/anysymbol/kAIServerError @/link - The server encountered an error while completing the request, or the SDK received an unknown response from the server.  You can retry the method call.
 
 @since 1.0
 */
+ (void) getAccessTokenForScopes:(NSArray*)scopes withOverrideParams:(NSDictionary*)overrideParams delegate:(id<AIAuthenticationDelegate>)authenticationDelegate;

/*!
 @method clearAuthorizationState:
 @abstract Deletes cached user tokens and other data.  Use this method to logout a user.
 
 @param authenticationDelegate A delegate implementing the @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link protocol to receive success and failure messages.
 
 @discussion This method removes the authorization tokens from the key chain. It also clears the cookies from the local cookie storage to clear the authorization state of the users who checked the "Remember me" checkbox.
 
 @result
 Pass in a valid instance of @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link to receive success and failure notifications.
 
 If clearing succeeds the @link //apple_ref/doc/anysymbol/requestDidSucceed: @/link method is called on the delegate.
 
 If clearing fails the @link //apple_ref/doc/anysymbol/requestDidFail: @/link method is called on the delegate. The error code and an error message are passed to the method in an APIError object.  clearAuthorizationState can produce the following error codes:
 
 1.  @link //apple_ref/doc/anysymbol/kAIInvalidInput @/link - One of the API parameters is invalid.  See the error message for more information.
 
 2.  @link //apple_ref/doc/anysymbol/kAIDeviceError @/link - The SDK encountered an error on the device.  Currently, the SDK only throws this error when it receives the same error from the keychain service. Calling @link clearAuthorizationState: @/link will help.
 
 @since 1.0
 */
+ (void)clearAuthorizationState:(id<AIAuthenticationDelegate>)authenticationDelegate;

/*!
 @method getProfile:
 @abstract Use this method to get the profile of the current authorized user.
 @discussion This method gets profile information for the current authorized user. The application should make sure it is authorized for the "profile" scope prior to calling this method.  If the application is authorized for the "postal_code" scope, getProfile will return that information as well.  This profile information is cached for 60 minutes.
 @param authenticationDelegate A delegate implementing the @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link protocol to receive success and failure messages.
 @result
 Pass in a valid instance of @link //apple_ref/occ/intf/AIAuthenticationDelegate @/link to receive success and failure notifications.
 
 If the profile is retrieved successfully the @link //apple_ref/doc/anysymbol/requestDidSucceed: @/link method is called on the delegate. The user profile is passed in the result property of the APIResult parameter as a dictionary.  That dictionary includes key:value pairs with the following keys:
 
 1.  "name" - The name of the user.
 
 2.  "email" - The registered email address of the user.
 
 3.  "user_id" - The used id of the user, in the form of "amzn1.user.VALUE".  The user id is unique to the user.
 
 4.  "postal_code" - The registered postal code of the user.
 
 If authorization fails the @link //apple_ref/doc/anysymbol/requestDidFail: @/link method is called on the delegate. The error code and an error message are passed to the method in an APIError object.  getAccessTokenForScopes can produce the following error codes:
 
 1.  @link //apple_ref/doc/anysymbol/kAIApplicationNotAuthorized @/link - The application is not authorized for the "profile" scope. Call @link authorizeUserForScopes:delegate: @/link to prompt the user to login and authorize the application.
 
 2.  @link //apple_ref/doc/anysymbol/kAIInternalError @/link - An internal error occured in the SDK.  You can retry the method call.
 
 3.  @link //apple_ref/doc/anysymbol/kAIInvalidInput @/link - One of the API parameters is invalid.  See the error message for more information.
 
 4.  @link //apple_ref/doc/anysymbol/kAIDeviceError @/link - The SDK encountered an error on the device.  Currently, the SDK only throws this error when it receives the same error from the keychain service. Calling @link clearAuthorizationState: @/link will help.
 
 5.  @link //apple_ref/doc/anysymbol/kAINetworkError @/link - A network error occurred, possibly due to the user being offline.
 
 6.  @link //apple_ref/doc/anysymbol/kAIServerError @/link - The server encountered an error while completing the request, or the SDK received an unknown response from the server.  You can retry the method call.
 
 @since 1.0
 */
+ (void) getProfile:(id<AIAuthenticationDelegate>)authenticationDelegate;

@end