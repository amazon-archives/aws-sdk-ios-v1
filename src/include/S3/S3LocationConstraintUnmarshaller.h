//
//  S3LocationConstraintUnmarshaller.h
//  s3
//
//  Created by Flanagan, Jim on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../AmazonUnmarshallerXMLParserDelegate.h"

@interface S3LocationConstraintUnmarshaller : AmazonUnmarshallerXMLParserDelegate {
	NSString *location;
}

@property (nonatomic, retain) NSString* location;

@end
