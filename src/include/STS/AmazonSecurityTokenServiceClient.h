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
#import "SecurityTokenServiceGetSessionTokenResponse.h"
#import "SecurityTokenServiceGetSessionTokenRequest.h"
#import "SecurityTokenServiceDecodeAuthorizationMessageResponse.h"
#import "SecurityTokenServiceDecodeAuthorizationMessageRequest.h"
#import "SecurityTokenServiceAssumeRoleWithWebIdentityResponse.h"
#import "SecurityTokenServiceAssumeRoleWithWebIdentityRequest.h"
#import "SecurityTokenServiceGetFederationTokenResponse.h"
#import "SecurityTokenServiceGetFederationTokenRequest.h"
#import "SecurityTokenServiceAssumeRoleResponse.h"
#import "SecurityTokenServiceAssumeRoleRequest.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonWebServiceClient.h>
#else
#import "../AmazonWebServiceClient.h"
#endif

/** \defgroup SecurityTokenService AWS Security Token Service */

/** <summary>
 * Interface for accessing AmazonSecurityTokenService.
 *
 *  AWS Security Token Service <p>
 * The AWS Security Token Service is a web service that enables you to request temporary, limited-privilege credentials for AWS Identity and Access Management (IAM) users or for users that you
 * authenticate (federated users). This guide provides descriptions of the AWS Security Token Service API.
 * </p>
 * <p>
 * For more detailed information about using this service, go to <a href="http://docs.aws.amazon.com/IAM/latest/UsingSTS/Welcome.html"> Using Temporary Security Credentials </a> .
 * </p>
 * <p>
 * For information about setting up signatures and authorization through the API, go to <a href="http://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html"> Signing AWS API Requests
 * </a> in the <i>AWS General Reference</i> . For general information about the Query API, go to <a href="http://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html"> Making Query Requests
 * </a> in <i>Using IAM</i> . For information about using security tokens with other AWS products, go to <a href="http://docs.aws.amazon.com/IAM/latest/UsingSTS/UsingTokens.html"> Using Temporary
 * Security Credentials to Access AWS </a> in <i>Using Temporary Security Credentials</i> .
 *
 * </p>
 * <p>
 * If you're new to AWS and need additional technical information about a specific AWS product, you can find the product's technical documentation at <a href="http://aws.amazon.com/documentation/">
 * http://aws.amazon.com/documentation/ </a> .
 * </p>
 * <p>
 * We will refer to Amazon Identity and Access Management using the abbreviated form IAM. All copyrights and legal protections still apply.
 * </p>
 * </summary>
 *
 * See our blog to learn more about Managing Credentials in Mobile Applications.
 * @see http://mobile.awsblog.com/post/Tx31X75XISXHRH8/Managing-Credentials-in-Mobile-Applications
 */
@interface AmazonSecurityTokenServiceClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Returns a set of temporary credentials for an AWS account or IAM user. The credentials consist of an access key ID, a
 * secret access key, and a security token. Typically, you use GetSessionToken if you want use MFA to protect programmatic
 * calls to specific AWS APIs like Amazon EC2 StopInstances . MFA-enabled IAM users would need to call GetSessionToken and
 * submit an MFA code that is associated with their MFA device. Using the temporary security credentials that are returned
 * from the call, IAM users can then make programmatic calls to APIs that require MFA authentication.
 * </p>
 * <p>
 * The GetSessionToken action must be called by using the long-term AWS security credentials of the AWS account or an IAM
 * user. Credentials that are created by IAM users are valid for the duration that you specify, between 900 seconds (15
 * minutes) and 129600 seconds (36 hours); credentials that are created by using account credentials have a maximum
 * duration of 3600 seconds (1 hour).
 * </p>
 * <p>
 * The permissions that are granted to the federated user are the intersection of the policy that is passed with the
 * GetSessionToken request and policies that are associated with of the entity making the GetSessionToken call.
 * </p>
 * <p>
 * For more information about using GetSessionToken to create temporary credentials, go to <a
 * href="http://docs.aws.amazon.com/IAM/latest/UserGuide/CreatingSessionTokens.html"> Creating Temporary Credentials to
 * Enable Access for IAM Users </a> in <i>Using IAM</i> .
 *
 * </p>
 *
 * @param getSessionTokenRequest Container for the necessary parameters to execute the GetSessionToken service method on
 *           AmazonSecurityTokenService.
 *
 * @return The response from the GetSessionToken service method, as returned by AmazonSecurityTokenService.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSecurityTokenService indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SecurityTokenServiceGetSessionTokenRequest
 * @see SecurityTokenServiceGetSessionTokenResponse
 */
-(SecurityTokenServiceGetSessionTokenResponse *)getSessionToken:(SecurityTokenServiceGetSessionTokenRequest *)getSessionTokenRequest;


/**
 * <p>
 * Decodes additional information about the authorization status of a request from an encoded message returned in response
 * to an AWS request.
 * </p>
 * <p>
 * For example, if a user is not authorized to perform an action that he or she has requested, the request returns a
 * Client.UnauthorizedOperation response (an HTTP 403 response). Some AWS actions additionally return an encoded message
 * that can provide details about this authorization failure.
 * </p>
 * <p>
 * <b>NOTE:</b> Only certain AWS actions return an encoded authorization message. The documentation for an individual
 * action indicates whether that action returns an encoded message in addition to returning an HTTP code.
 * </p>
 * <p>
 * The message is encoded because the details of the authorization status can constitute privileged information that the
 * user who requested the action should not see. To decode an authorization status message, a user must be granted
 * permissions via an IAM policy to request the DecodeAuthorizationMessage (
 * sts:DecodeAuthorizationMessage ) action.
 * </p>
 * <p>
 * The decoded message includes the following type of information:
 * </p>
 *
 * <ul>
 * <li>Whether the request was denied due to an explicit deny or due to the absence of an explicit allow. For more
 * information, see <a
 * href="http://docs.aws.amazon.com/IAM/latest/UserGuide/AccessPolicyLanguage_EvaluationLogic.html#policy-eval-denyallow">
 * Determining Whether a Request is Allowed or Denied </a> in <i>Using IAM</i> .
 * </li>
 * <li>The principal who made the request.</li>
 * <li>The requested action.</li>
 * <li>The requested resource.</li>
 * <li>The values of condition keys in the context of the user's request.</li>
 *
 * </ul>
 *
 * @param decodeAuthorizationMessageRequest Container for the necessary parameters to execute the
 *           DecodeAuthorizationMessage service method on AmazonSecurityTokenService.
 *
 * @return The response from the DecodeAuthorizationMessage service method, as returned by AmazonSecurityTokenService.
 *
 * @exception SecurityTokenServiceInvalidAuthorizationMessageException For more information see <SecurityTokenServiceInvalidAuthorizationMessageException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSecurityTokenService indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SecurityTokenServiceDecodeAuthorizationMessageRequest
 * @see SecurityTokenServiceDecodeAuthorizationMessageResponse
 */
-(SecurityTokenServiceDecodeAuthorizationMessageResponse *)decodeAuthorizationMessage:(SecurityTokenServiceDecodeAuthorizationMessageRequest *)decodeAuthorizationMessageRequest;


/**
 * <p>
 * Returns a set of temporary security credentials for users who have been authenticated in a mobile or web application
 * with a web identity provider, such as Login with Amazon, Facebook, or Google. AssumeRoleWithWebIdentity is an API call
 * that does not require the use of AWS security credentials. Therefore, you can distribute an application (for example, on
 * mobile devices) that requests temporary security credentials without including long-term AWS credentials in the
 * application or by deploying server-based proxy services that use long-term AWS credentials. For more information, see <a
 * href="http://docs.aws.amazon.com/STS/latest/UsingSTS/STSUseCases.html#MobileApplication-KnownProvider"> Creating a
 * Mobile Application with Third-Party Sign-In </a> in <i>AWS Security Token Service</i> .
 *
 * </p>
 * <p>
 * The temporary security credentials consist of an access key ID, a secret access key, and a security token. Applications
 * can use these temporary security credentials to sign calls to AWS service APIs. The credentials are valid for the
 * duration that you specified when calling AssumeRoleWithWebIdentity , which can be from 900 seconds (15 minutes) to 3600
 * seconds (1 hour). By default, the temporary security credentials are valid for 1 hour.
 * </p>
 * <p>
 * The temporary security credentials that are returned from the AssumeRoleWithWebIdentity response have the permissions
 * that are associated with the access policy of the role being assumed. You can further restrict the permissions of the
 * temporary security credentials by passing a policy in the request. The resulting permissions are an intersection of the
 * role's access policy and the policy that you passed. These policies and any applicable resource-based policies are
 * evaluated when calls to AWS service APIs are made using the temporary security credentials.
 * </p>
 * <p>
 * Before your application can call AssumeRoleWithWebIdentity , you must have an identity token from a supported identity
 * provider and create a role that the application can assume. The role that your application assumes must trust the
 * identity provider that is associated with the identity token. In other words, the identity provider must be specified in
 * the role's trust policy. For more information, see <a
 * href="http://docs.aws.amazon.com/STS/latest/UsingSTS/CreatingWIF.html"> Creating Temporary Security Credentials for
 * Mobile Apps Using Third-Party Identity Providers </a> .
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 *
 * @param assumeRoleWithWebIdentityRequest Container for the necessary parameters to execute the AssumeRoleWithWebIdentity
 *           service method on AmazonSecurityTokenService.
 *
 * @return The response from the AssumeRoleWithWebIdentity service method, as returned by AmazonSecurityTokenService.
 *
 * @exception SecurityTokenServicePackedPolicyTooLargeException For more information see <SecurityTokenServicePackedPolicyTooLargeException>
 * @exception SecurityTokenServiceIDPRejectedClaimException For more information see <SecurityTokenServiceIDPRejectedClaimException>
 * @exception SecurityTokenServiceMalformedPolicyDocumentException For more information see <SecurityTokenServiceMalformedPolicyDocumentException>
 * @exception SecurityTokenServiceInvalidIdentityTokenException For more information see <SecurityTokenServiceInvalidIdentityTokenException>
 * @exception SecurityTokenServiceExpiredTokenException For more information see <SecurityTokenServiceExpiredTokenException>
 * @exception SecurityTokenServiceIDPCommunicationErrorException For more information see <SecurityTokenServiceIDPCommunicationErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSecurityTokenService indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SecurityTokenServiceAssumeRoleWithWebIdentityRequest
 * @see SecurityTokenServiceAssumeRoleWithWebIdentityResponse
 */
-(SecurityTokenServiceAssumeRoleWithWebIdentityResponse *)assumeRoleWithWebIdentity:(SecurityTokenServiceAssumeRoleWithWebIdentityRequest *)assumeRoleWithWebIdentityRequest;


/**
 * <p>
 * Returns a set of temporary security credentials (consisting of an access key ID, a secret access key, and a security
 * token) for a federated user. A typical use is in a proxy application that is getting temporary security credentials on
 * behalf of distributed applications inside a corporate network. Because you must call the GetFederationToken action using
 * the long-term security credentials of an IAM user, this call is appropriate in contexts where those credentials can be
 * safely stored, usually in a server-based application.
 * </p>
 * <p>
 * <b>Note:</b> Do not use this call in mobile applications or client-based web applications that directly get temporary
 * security credentials. For those types of applications, use AssumeRoleWithWebIdentity .
 *
 * </p>
 * <p>
 * The GetFederationToken action must be called by using the long-term AWS security credentials of the AWS account or an
 * IAM user. Credentials that are created by IAM users are valid for the specified duration, between 900 seconds (15
 * minutes) and 129600 seconds (36 hours); credentials that are created by using account credentials have a maximum
 * duration of 3600 seconds (1 hour).
 * </p>
 * <p>
 * The permissions that are granted to the federated user are the intersection of the policy that is passed with the
 * GetFederationToken request and policies that are associated with of the entity making the GetFederationToken call.
 * </p>
 * <p>
 * For more information about how permissions work, see <a
 * href="http://docs.aws.amazon.com/IAM/latest/UserGuide/TokenPermissions.html"> Controlling Permissions in Temporary
 * Credentials </a> in <i>Using Temporary Security Credentials</i> . For information about using GetFederationToken to
 * create temporary security credentials, see <a
 * href="http://docs.aws.amazon.com/IAM/latest/UserGuide/CreatingFedTokens.html"> Creating Temporary Credentials to Enable
 * Access for Federated Users </a> in <i>Using Temporary Security Credentials</i> .
 *
 * </p>
 *
 * @param getFederationTokenRequest Container for the necessary parameters to execute the GetFederationToken service method
 *           on AmazonSecurityTokenService.
 *
 * @return The response from the GetFederationToken service method, as returned by AmazonSecurityTokenService.
 *
 * @exception SecurityTokenServicePackedPolicyTooLargeException For more information see <SecurityTokenServicePackedPolicyTooLargeException>
 * @exception SecurityTokenServiceMalformedPolicyDocumentException For more information see <SecurityTokenServiceMalformedPolicyDocumentException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSecurityTokenService indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SecurityTokenServiceGetFederationTokenRequest
 * @see SecurityTokenServiceGetFederationTokenResponse
 */
-(SecurityTokenServiceGetFederationTokenResponse *)getFederationToken:(SecurityTokenServiceGetFederationTokenRequest *)getFederationTokenRequest;


/**
 * <p>
 * Returns a set of temporary security credentials (consisting of an access key ID, a secret access key, and a security
 * token) that you can use to access AWS resources that you might not normally have access to. Typically, you use
 * AssumeRole for cross-account access or federation.
 * </p>
 * <p>
 * For cross-account access, imagine that you own multiple accounts and need to access resources in each account. You
 * could create long-term credentials in each account to access those resources. However, managing all those credentials
 * and remembering which one can access which account can be time consuming. Instead, you can create one set of long-term
 * credentials in one account and then use temporary security credentials to access all the other accounts by assuming
 * roles in those accounts. For more information about roles, see <a
 * href="http://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html"> Roles </a> in <i>Using IAM</i> .
 *
 * </p>
 * <p>
 * For federation, you can, for example, grant single sign-on access to the AWS Management Console. If you already have an
 * identity and authentication system in your corporate network, you don't have to recreate user identities in AWS in order
 * to grant those user identities access to AWS. Instead, after a user has been authenticated, you call AssumeRole (and
 * specify the role with the appropriate permissions) to get temporary security credentials for that user. With those
 * temporary security credentials, you construct a sign-in URL that users can use to access the console. For more
 * information, see <a href="http://docs.aws.amazon.com/STS/latest/UsingSTS/STSUseCases.html"> Scenarios for Granting
 * Temporary Access </a> in <i>AWS Security Token Service</i> .
 *
 * </p>
 * <p>
 * The temporary security credentials are valid for the duration that you specified when calling AssumeRole , which can be
 * from 900 seconds (15 minutes) to 3600 seconds (1 hour). The default is 1 hour.
 * </p>
 * <p>
 * The temporary security credentials that are returned from the AssumeRoleWithWebIdentity response have the permissions
 * that are associated with the access policy of the role being assumed and any policies that are associated with the AWS
 * resource being accessed. You can further restrict the permissions of the temporary security credentials by passing a
 * policy in the request. The resulting permissions are an intersection of the role's access policy and the policy that you
 * passed. These policies and any applicable resource-based policies are evaluated when calls to AWS service APIs are made
 * using the temporary security credentials.
 * </p>
 * <p>
 * To assume a role, your AWS account must be trusted by the role. The trust relationship is defined in the role's trust
 * policy when the IAM role is created. You must also have a policy that allows you to call sts:AssumeRole .
 *
 * </p>
 * <p>
 * <b>Important:</b> You cannot call Assumerole by using AWS account credentials; access will be denied. You must use IAM
 * user credentials or temporary security credentials to call AssumeRole .
 *
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 * <p>
 * </p>
 *
 * @param assumeRoleRequest Container for the necessary parameters to execute the AssumeRole service method on
 *           AmazonSecurityTokenService.
 *
 * @return The response from the AssumeRole service method, as returned by AmazonSecurityTokenService.
 *
 * @exception SecurityTokenServicePackedPolicyTooLargeException For more information see <SecurityTokenServicePackedPolicyTooLargeException>
 * @exception SecurityTokenServiceMalformedPolicyDocumentException For more information see <SecurityTokenServiceMalformedPolicyDocumentException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSecurityTokenService indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SecurityTokenServiceAssumeRoleRequest
 * @see SecurityTokenServiceAssumeRoleResponse
 */
-(SecurityTokenServiceAssumeRoleResponse *)assumeRole:(SecurityTokenServiceAssumeRoleRequest *)assumeRoleRequest;



@end

