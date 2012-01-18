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


@interface AmazonMD5Util:NSObject {
}

/**
 * Returns a Base 64 encoded MD5 of the given data.
 **/
+(NSString *)base64md5FromData:(NSData *)data;

/**
 * Returns a Base 64 encoded MD5 of the data read from the given input stream.
 *
 * The stream is expected to already have been opened.
 * The caller is expected to close the stream.
 * Nil will be returned if the MD5 could not be properly computed.
 *
 * @exception NSException thrown if unable to read stream.
 **/
+(NSString *)base64md5FromStream:(NSInputStream *)inputStream;

@end
