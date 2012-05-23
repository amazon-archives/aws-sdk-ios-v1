//
//  S3PartUnmarshaller.h
//  AWSiOSSDK
//
//  Created by Flanagan, Jim on 2/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../AmazonUnmarshallerXMLParserDelegate.h"
#import "../AmazonSDKUtil.h"
#import "S3Part.h"

/**
 *
 */
@interface S3PartUnmarshaller:AmazonUnmarshallerXMLParserDelegate {
    S3Part *part;
}

@property (nonatomic, readonly) S3Part *part;

@end
