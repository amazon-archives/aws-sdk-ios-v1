/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

/*
 * Use of this class has been deprecated.  It is recommended that end-users
 * Update their device to iOS6 in order to resolve problems uploading to S3
 * Over 3G
 */
__attribute__ ((deprecated))
@interface S3UploadInputStream : NSInputStream {
	NSInputStream *stream;
    NSInteger packetSize;
    double delay;
}

/**
 * The stream of data to upload.
 */
@property (nonatomic, retain) NSInputStream *stream;

/**
 * The number of K blocks to upload in each packet.
 * This number should be between 1 and 32.
 */
@property (atomic) NSInteger packetSize;

/**
 * Delay (in seconds) between packet uploads.
 * Recommend using a delay between 0.00 and 0.25.
 */
@property (atomic) double delay; 

+(id)inputStreamWithStream:(NSInputStream *)aStream;

@end
