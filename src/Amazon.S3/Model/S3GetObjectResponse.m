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


#import "S3GetObjectResponse.h"

@interface S3GetObjectResponse ()
{
}

@property (nonatomic, retain) NSMutableDictionary *metadata;

@end

@implementation S3GetObjectResponse


// This method overrides the S3Response version, processing x-aws-meta-
// headers, passing all others to the superclass.
- (void)setValue:(id)value forHTTPHeaderField:(NSString *)header
{
    NSString *tmp = [header lowercaseString];

    if ([tmp hasPrefix:@"x-amz-meta-"]) {
        NSString *keyName = [tmp stringByReplacingOccurrencesOfString:@"x-amz-meta-" withString:@""];
        if (nil == self.metadata) {
            self.metadata = [[NSMutableDictionary alloc] init];
        }
        [self.metadata setValue:value forKey:keyName];
        //AMZLog( @"Setting metadata value [%@] for key [%@] from header [%@]", [value description], keyName, header );
    }
    else if ([tmp isEqualToString:kHttpHdrAmzWebsiteRedirectLocation]) {
        self.redirectLocation = value;
    }
    else {
        [super setValue:value forHTTPHeaderField:header];
    }
}

- (NSString *)getMetadataForKey:(NSString *)aKey
{
    if (nil == self.metadata) {
        return nil;
    }

    return [[self.metadata objectForKey:aKey] description];
}

- (NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Metadata: %@,", self.metadata] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Last-Modified: %@,", self.lastModified] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Content-Type: %@,", self.contentType] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}

#pragma mark NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (self.outputStream) {
        
        //[super connection:connection didReceiveData:data];
        [self.outputStream write:(uint8_t *)[data bytes] maxLength:[data length]];
        
        // skip super's data handling, go directly to delegate
        if ([self.request.delegate respondsToSelector:@selector(request:didReceiveData:)]) {
            [self.request.delegate request:self.request didReceiveData:data];
        }
    }
    else {
        [super connection:connection didReceiveData:data];
    }
}

- (void)dealloc
{
    [_metadata release];
    [_outputStream release];

    [_lastModified release];
    [_contentType release];
    [_redirectLocation release];

    [super dealloc];
}

@end
