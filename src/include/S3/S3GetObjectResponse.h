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
#import "S3Response.h"

/** Contains the response from a getObject operation */
@interface S3GetObjectResponse : S3Response {
	NSString *contentType;
	NSMutableDictionary *metadata;
	NSOutputStream *outputStream;
}

/** The content type of the data in the response */
@property(nonatomic, retain) NSString* contentType;

/** Get the value for a user-defined metadata key.
 * @param aKey The key of the metadata.
 * @return The metadata value corresponding to the supplied key.
 */
-(NSString *)getMetadataForKey:(NSString *)aKey;

/** Set the output stream for the response data.
 *
 * If this is set, then the response will write the data
 * to the supplied stream instead of making it available through
 * the data property.
 */
-(void)setOutputStream:(NSOutputStream *)stream;

@end
