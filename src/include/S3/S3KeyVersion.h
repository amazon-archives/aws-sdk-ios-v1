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

/**
 * A key to delete, with an optional version attribute.
 */
@interface S3KeyVersion:NSObject
{
    NSString *key;
    NSString *version;
}

-(id)initWithKey:(NSString *)theKey withVersion:(NSString *)theVersion;
-(id)initWithKey:(NSString *)theKey;
+(id)keyVersionWithKey:(NSString *)theKey withVersion:(NSString *)theVersion;
+(id)keyVersionWithKey:(NSString *)theKey;

/** Returns the XML represenation of the object.
 *
 * @return A XML representation of the Object.
 */
-(NSString *)toXml;

/** Gets and sets the key property. */
@property (nonatomic, retain) NSString *key;

/** Gets and sets the version property. */
@property (nonatomic, retain) NSString *version;

@end
