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

#import "S3BucketLifecycleConfigurationTransitionUnmarshaller.h"

@implementation S3BucketLifecycleConfigurationTransitionUnmarshaller

@synthesize transition;

#pragma mark - NSXMLParserDelegate implementation

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
    
    if ([elementName isEqualToString:@"StorageClass"])
    {
        self.transition.storageClass = self.currentText;
    }
    else if ([elementName isEqualToString:@"Days"])
    {
        self.transition.transitionDays = [self.currentText integerValue];
    }
    else if ([elementName isEqualToString:@"Date"])
    {
        self.transition.transitionDate = [AmazonSDKUtil convertStringToDate:self.currentText];
    }
    else if ([elementName isEqualToString:@"Transition"])
    {
        if (caller != nil) {
            [parser setDelegate:caller];
        }
        
        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.transition];
        }
        
        return;
    }
}

#pragma mark - Unmarshalled object property

-(S3BucketLifecycleConfigurationTransition *)transition
{
    if (transition == nil)
    {
        transition = [[S3BucketLifecycleConfigurationTransition alloc] init];
    }
    
    return transition;
}

#pragma mark -

-(void)dealloc
{
    [transition release];
    
    [super dealloc];
}

@end
