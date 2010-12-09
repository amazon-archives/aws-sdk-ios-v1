//
//  AWSResponseUnmarshaller.h
//  SimpleDB
//
//  Created by Dierkes, Glenn on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AmazonUnmarshallerXMLParserDelegate.h"
#import "AmazonServiceResponse.h"

/**
 * Domain Metadata Result Unmarshaller
 */
@interface AmazonServiceResponseUnmarshaller : AmazonUnmarshallerXMLParserDelegate { 
	NSString* endElementTagName;	
}

@property (nonatomic, retain) NSString* endElementTagName;

-(AmazonServiceResponse *)response;

@end
