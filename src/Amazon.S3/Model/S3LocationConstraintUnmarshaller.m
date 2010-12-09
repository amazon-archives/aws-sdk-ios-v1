//
//  S3LocationConstraintUnmarshaller.m
//  s3
//
//  Created by Flanagan, Jim on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "S3LocationConstraintUnmarshaller.h"


@implementation S3LocationConstraintUnmarshaller

@synthesize location;

- (void) parser:(NSXMLParser *)parser 
  didEndElement:(NSString *)elementName 
   namespaceURI:(NSString *)namespaceURI 
  qualifiedName:(NSString *)qName
{
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"LocationConstraint"]) {
		if (self.currentText == nil) {
			self.location = @"";
		}
		else {
			self.location = self.currentText;
		}
		
		return;
	}
}

-(void)dealloc
{
	[location release];
	[super dealloc];
}

@end
