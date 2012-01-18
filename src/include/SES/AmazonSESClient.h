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
#import "SESListVerifiedEmailAddressesResponse.h"
#import "SESListVerifiedEmailAddressesResponseUnmarshaller.h"
#import "SESListVerifiedEmailAddressesRequest.h"
#import "SESListVerifiedEmailAddressesRequestMarshaller.h"
#import "SESGetSendStatisticsResponse.h"
#import "SESGetSendStatisticsResponseUnmarshaller.h"
#import "SESGetSendStatisticsRequest.h"
#import "SESGetSendStatisticsRequestMarshaller.h"
#import "SESSendEmailResponse.h"
#import "SESSendEmailResponseUnmarshaller.h"
#import "SESSendEmailRequest.h"
#import "SESSendEmailRequestMarshaller.h"
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

#import "../AmazonWebServiceClient.h"

/** \defgroup SES Amazon SES */

/** <summary>
 * Interface for accessing AmazonSES.
 *
 *  Amazon SES
 * </summary>
 *
 * \ingroup SES
 */
@interface AmazonSESClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Returns the user's current activity limits.
 * </p>
 *
 * @param getSendQuotaRequest Container for the necessary parameters to
 *           execute the GetSendQuota service method on AmazonSES.
 *
 * @return The response from the GetSendQuota service method, as returned
 *         by AmazonSES.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESGetSendQuotaResponse *)getSendQuota:(SESGetSendQuotaRequest *)getSendQuotaRequest;


/**
 * <p>
 * Returns a list containing all of the email addresses that have been
 * verified.
 * </p>
 *
 * @param listVerifiedEmailAddressesRequest Container for the necessary
 *           parameters to execute the ListVerifiedEmailAddresses service method on
 *           AmazonSES.
 *
 * @return The response from the ListVerifiedEmailAddresses service
 *         method, as returned by AmazonSES.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESListVerifiedEmailAddressesResponse *)listVerifiedEmailAddresses:(SESListVerifiedEmailAddressesRequest *)listVerifiedEmailAddressesRequest;


/**
 * <p>
 * Returns the user's sending statistics. The result is a list of data
 * points, representing the last two weeks of sending activity.
 * </p>
 * <p>
 * Each data point in the list contains statistics for a 15-minute
 * interval.
 * </p>
 *
 * @param getSendStatisticsRequest Container for the necessary parameters
 *           to execute the GetSendStatistics service method on AmazonSES.
 *
 * @return The response from the GetSendStatistics service method, as
 *         returned by AmazonSES.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESGetSendStatisticsResponse *)getSendStatistics:(SESGetSendStatisticsRequest *)getSendStatisticsRequest;


/**
 * <p>
 * Composes an email message based on input data, and then immediately
 * queues the message for sending.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>If you have not yet requested production access to
 * Amazon SES, then you will only be able to send email to and from
 * verified email addresses. For more information, go to the Amazon SES
 * Developer Guide.
 * </p>
 *
 * @param sendEmailRequest Container for the necessary parameters to
 *           execute the SendEmail service method on AmazonSES.
 *
 * @return The response from the SendEmail service method, as returned by
 *         AmazonSES.
 *
 * @throws SESMessageRejectedException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESSendEmailResponse *)sendEmail:(SESSendEmailRequest *)sendEmailRequest;


/**
 * <p>
 * Deletes the specified email address from the list of verified
 * addresses.
 * </p>
 *
 * @param deleteVerifiedEmailAddressRequest Container for the necessary
 *           parameters to execute the DeleteVerifiedEmailAddress service method on
 *           AmazonSES.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESDeleteVerifiedEmailAddressResponse *)deleteVerifiedEmailAddress:(SESDeleteVerifiedEmailAddressRequest *)deleteVerifiedEmailAddressRequest;


/**
 * <p>
 * Verifies an email address. This action causes a confirmation email
 * message to be sent to the specified address.
 * </p>
 *
 * @param verifyEmailAddressRequest Container for the necessary
 *           parameters to execute the VerifyEmailAddress service method on
 *           AmazonSES.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESVerifyEmailAddressResponse *)verifyEmailAddress:(SESVerifyEmailAddressRequest *)verifyEmailAddressRequest;


/**
 * <p>
 * Sends an email message, with header and content specified by the
 * client. The <code>SendRawEmail</code> action is useful for sending
 * multipart MIME emails, with attachments or inline content. The raw
 * text of the message must comply with Internet email standards;
 * otherwise, the message cannot be sent.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>If you have not yet requested production access to
 * Amazon SES, then you will only be able to send email to and from
 * verified email addresses. For more information, go to the Amazon SES
 * Developer Guide.
 * </p>
 *
 * @param sendRawEmailRequest Container for the necessary parameters to
 *           execute the SendRawEmail service method on AmazonSES.
 *
 * @return The response from the SendRawEmail service method, as returned
 *         by AmazonSES.
 *
 * @throws SESMessageRejectedException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSES indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SESSendRawEmailResponse *)sendRawEmail:(SESSendRawEmailRequest *)sendRawEmailRequest;



@end

