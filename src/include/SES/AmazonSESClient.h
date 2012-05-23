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
#import "SESGetSendQuotaResponse.h"
#import "SESGetSendQuotaResponseUnmarshaller.h"
#import "SESGetSendQuotaRequest.h"
#import "SESGetSendQuotaRequestMarshaller.h"
#import "SESDeleteIdentityResponse.h"
#import "SESDeleteIdentityResponseUnmarshaller.h"
#import "SESDeleteIdentityRequest.h"
#import "SESDeleteIdentityRequestMarshaller.h"
#import "SESListVerifiedEmailAddressesResponse.h"
#import "SESListVerifiedEmailAddressesResponseUnmarshaller.h"
#import "SESListVerifiedEmailAddressesRequest.h"
#import "SESListVerifiedEmailAddressesRequestMarshaller.h"
#import "SESGetSendStatisticsResponse.h"
#import "SESGetSendStatisticsResponseUnmarshaller.h"
#import "SESGetSendStatisticsRequest.h"
#import "SESGetSendStatisticsRequestMarshaller.h"
#import "SESVerifyEmailIdentityResponse.h"
#import "SESVerifyEmailIdentityResponseUnmarshaller.h"
#import "SESVerifyEmailIdentityRequest.h"
#import "SESVerifyEmailIdentityRequestMarshaller.h"
#import "SESSendEmailResponse.h"
#import "SESSendEmailResponseUnmarshaller.h"
#import "SESSendEmailRequest.h"
#import "SESSendEmailRequestMarshaller.h"
#import "SESVerifyDomainIdentityResponse.h"
#import "SESVerifyDomainIdentityResponseUnmarshaller.h"
#import "SESVerifyDomainIdentityRequest.h"
#import "SESVerifyDomainIdentityRequestMarshaller.h"
#import "SESDeleteVerifiedEmailAddressResponse.h"
#import "SESDeleteVerifiedEmailAddressResponseUnmarshaller.h"
#import "SESDeleteVerifiedEmailAddressRequest.h"
#import "SESDeleteVerifiedEmailAddressRequestMarshaller.h"
#import "SESVerifyEmailAddressResponse.h"
#import "SESVerifyEmailAddressResponseUnmarshaller.h"
#import "SESVerifyEmailAddressRequest.h"
#import "SESVerifyEmailAddressRequestMarshaller.h"
#import "SESSendRawEmailResponse.h"
#import "SESSendRawEmailResponseUnmarshaller.h"
#import "SESSendRawEmailRequest.h"
#import "SESSendRawEmailRequestMarshaller.h"
#import "SESListIdentitiesResponse.h"
#import "SESListIdentitiesResponseUnmarshaller.h"
#import "SESListIdentitiesRequest.h"
#import "SESListIdentitiesRequestMarshaller.h"
#import "SESGetIdentityVerificationAttributesResponse.h"
#import "SESGetIdentityVerificationAttributesResponseUnmarshaller.h"
#import "SESGetIdentityVerificationAttributesRequest.h"
#import "SESGetIdentityVerificationAttributesRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup SES Amazon SES */

/** <summary>
 * Interface for accessing AmazonSES.
 *
 *  Amazon SES
 * </summary>
 *
 */
@interface AmazonSESClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Returns the user's current sending limits.
 * </p>
 *
 * @param getSendQuotaRequest Container for the necessary parameters to execute the GetSendQuota service method on
 *           AmazonSES.
 *
 * @return The response from the GetSendQuota service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESGetSendQuotaRequest
 * @see SESGetSendQuotaResponse
 */
-(SESGetSendQuotaResponse *)getSendQuota:(SESGetSendQuotaRequest *)getSendQuotaRequest;


/**
 * <p>
 * Deletes the specified identity (email address or domain) from the list of verified identities.
 * </p>
 *
 * @param deleteIdentityRequest Container for the necessary parameters to execute the DeleteIdentity service method on
 *           AmazonSES.
 *
 * @return The response from the DeleteIdentity service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESDeleteIdentityRequest
 * @see SESDeleteIdentityResponse
 */
-(SESDeleteIdentityResponse *)deleteIdentity:(SESDeleteIdentityRequest *)deleteIdentityRequest;


/**
 * <p>
 * Returns a list containing all of the email addresses that have been verified.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>The ListVerifiedEmailAddresses action is deprecated as of the May 15, 2012 release of Domain
 * Verification. The ListIdentities action is now preferred.
 * </p>
 *
 * @param listVerifiedEmailAddressesRequest Container for the necessary parameters to execute the
 *           ListVerifiedEmailAddresses service method on AmazonSES.
 *
 * @return The response from the ListVerifiedEmailAddresses service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESListVerifiedEmailAddressesRequest
 * @see SESListVerifiedEmailAddressesResponse
 */
-(SESListVerifiedEmailAddressesResponse *)listVerifiedEmailAddresses:(SESListVerifiedEmailAddressesRequest *)listVerifiedEmailAddressesRequest;


/**
 * <p>
 * Returns the user's sending statistics. The result is a list of data points, representing the last two weeks of sending
 * activity.
 * </p>
 * <p>
 * Each data point in the list contains statistics for a 15-minute interval.
 * </p>
 *
 * @param getSendStatisticsRequest Container for the necessary parameters to execute the GetSendStatistics service method
 *           on AmazonSES.
 *
 * @return The response from the GetSendStatistics service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESGetSendStatisticsRequest
 * @see SESGetSendStatisticsResponse
 */
-(SESGetSendStatisticsResponse *)getSendStatistics:(SESGetSendStatisticsRequest *)getSendStatisticsRequest;


/**
 * <p>
 * Verifies an email address. This action causes a confirmation email message to be sent to the specified address.
 * </p>
 *
 * @param verifyEmailIdentityRequest Container for the necessary parameters to execute the VerifyEmailIdentity service
 *           method on AmazonSES.
 *
 * @return The response from the VerifyEmailIdentity service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESVerifyEmailIdentityRequest
 * @see SESVerifyEmailIdentityResponse
 */
-(SESVerifyEmailIdentityResponse *)verifyEmailIdentity:(SESVerifyEmailIdentityRequest *)verifyEmailIdentityRequest;


/**
 * <p>
 * Composes an email message based on input data, and then immediately queues the message for sending.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>If you have not yet requested production access to Amazon SES, then you will only be able to send email
 * to and from verified email addresses and domains. For more information, go to the Amazon SES Developer Guide.
 * </p>
 * <p>
 * The total size of the message cannot exceed 10 MB.
 * </p>
 * <p>
 * Amazon SES has a limit on the total number of recipients per message: The combined number of To:, CC: and BCC: email
 * addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient
 * list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group.
 * </p>
 * <p>
 * For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your <i>sending
 * quota</i> - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go
 * to the "Managing Your Sending Activity" section of the<a
 * href="http://docs.amazonwebservices.com/ses/latest/DeveloperGuide"> Amazon SES Developer Guide </a> .
 * </p>
 *
 * @param sendEmailRequest Container for the necessary parameters to execute the SendEmail service method on AmazonSES.
 *
 * @return The response from the SendEmail service method, as returned by AmazonSES.
 *
 * @exception SESMessageRejectedException For more information see <SESMessageRejectedException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESSendEmailRequest
 * @see SESSendEmailResponse
 */
-(SESSendEmailResponse *)sendEmail:(SESSendEmailRequest *)sendEmailRequest;


/**
 * <p>
 * Verifies a domain.
 * </p>
 *
 * @param verifyDomainIdentityRequest Container for the necessary parameters to execute the VerifyDomainIdentity service
 *           method on AmazonSES.
 *
 * @return The response from the VerifyDomainIdentity service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESVerifyDomainIdentityRequest
 * @see SESVerifyDomainIdentityResponse
 */
-(SESVerifyDomainIdentityResponse *)verifyDomainIdentity:(SESVerifyDomainIdentityRequest *)verifyDomainIdentityRequest;


/**
 * <p>
 * Deletes the specified email address from the list of verified addresses.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>The DeleteVerifiedEmailAddress action is deprecated as of the May 15, 2012 release of Domain
 * Verification. The DeleteIdentity action is now preferred.
 * </p>
 *
 * @param deleteVerifiedEmailAddressRequest Container for the necessary parameters to execute the
 *           DeleteVerifiedEmailAddress service method on AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESDeleteVerifiedEmailAddressRequest
 * @see SESDeleteVerifiedEmailAddressResponse
 */
-(SESDeleteVerifiedEmailAddressResponse *)deleteVerifiedEmailAddress:(SESDeleteVerifiedEmailAddressRequest *)deleteVerifiedEmailAddressRequest;


/**
 * <p>
 * Verifies an email address. This action causes a confirmation email message to be sent to the specified address.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>The VerifyEmailAddress action is deprecated as of the May 15, 2012 release of Domain Verification. The
 * VerifyEmailIdentity action is now preferred.
 * </p>
 *
 * @param verifyEmailAddressRequest Container for the necessary parameters to execute the VerifyEmailAddress service method
 *           on AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESVerifyEmailAddressRequest
 * @see SESVerifyEmailAddressResponse
 */
-(SESVerifyEmailAddressResponse *)verifyEmailAddress:(SESVerifyEmailAddressRequest *)verifyEmailAddressRequest;


/**
 * <p>
 * Sends an email message, with header and content specified by the client. The SendRawEmail action is useful for sending
 * multipart MIME emails. The raw text of the message must comply with Internet email standards; otherwise, the message
 * cannot be sent.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>If you have not yet requested production access to Amazon SES, then you will only be able to send email
 * to and from verified email addresses and domains. For more information, go to the Amazon SES Developer Guide.
 * </p>
 * <p>
 * The total size of the message cannot exceed 10 MB. This includes any attachments that are part of the message.
 * </p>
 * <p>
 * Amazon SES has a limit on the total number of recipients per message: The combined number of To:, CC: and BCC: email
 * addresses cannot exceed 50. If you need to send an email message to a larger audience, you can divide your recipient
 * list into groups of 50 or fewer, and then call Amazon SES repeatedly to send the message to each group.
 * </p>
 * <p>
 * For every message that you send, the total number of recipients (To:, CC: and BCC:) is counted against your <i>sending
 * quota</i> - the maximum number of emails you can send in a 24-hour period. For information about your sending quota, go
 * to the "Managing Your Sending Activity" section of the<a
 * href="http://docs.amazonwebservices.com/ses/latest/DeveloperGuide"> Amazon SES Developer Guide </a> .
 * </p>
 *
 * @param sendRawEmailRequest Container for the necessary parameters to execute the SendRawEmail service method on
 *           AmazonSES.
 *
 * @return The response from the SendRawEmail service method, as returned by AmazonSES.
 *
 * @exception SESMessageRejectedException For more information see <SESMessageRejectedException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESSendRawEmailRequest
 * @see SESSendRawEmailResponse
 */
-(SESSendRawEmailResponse *)sendRawEmail:(SESSendRawEmailRequest *)sendRawEmailRequest;


/**
 * <p>
 * Returns a list containing all of the identities (email addresses and domains) for a specific AWS Account, regardless of
 * verification status.
 * </p>
 *
 * @param listIdentitiesRequest Container for the necessary parameters to execute the ListIdentities service method on
 *           AmazonSES.
 *
 * @return The response from the ListIdentities service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESListIdentitiesRequest
 * @see SESListIdentitiesResponse
 */
-(SESListIdentitiesResponse *)listIdentities:(SESListIdentitiesRequest *)listIdentitiesRequest;


/**
 * <p>
 * Given a list of identities (email addresses and/or domains), returns the verification status and (for domain identities)
 * the verification token for each identity.
 * </p>
 *
 * @param getIdentityVerificationAttributesRequest Container for the necessary parameters to execute the
 *           GetIdentityVerificationAttributes service method on AmazonSES.
 *
 * @return The response from the GetIdentityVerificationAttributes service method, as returned by AmazonSES.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSES indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SESGetIdentityVerificationAttributesRequest
 * @see SESGetIdentityVerificationAttributesResponse
 */
-(SESGetIdentityVerificationAttributesResponse *)getIdentityVerificationAttributes:(SESGetIdentityVerificationAttributesRequest *)getIdentityVerificationAttributesRequest;



@end

