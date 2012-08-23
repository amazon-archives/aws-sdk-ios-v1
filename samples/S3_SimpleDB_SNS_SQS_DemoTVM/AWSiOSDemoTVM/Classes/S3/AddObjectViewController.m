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

#import "AddObjectViewController.h"
#import "AmazonClientManager.h"

@implementation AddObjectViewController

@synthesize bucket;

-(IBAction)add:(id)sender
{
    [objectName resignFirstResponder];
    [objectData resignFirstResponder];
    
    NSData *data = [objectData.text dataUsingEncoding:NSUTF8StringEncoding];
    
    S3PutObjectRequest *por = [[[S3PutObjectRequest alloc] initWithKey:objectName.text inBucket:self.bucket] autorelease];
    por.data = data;
    
    S3PutObjectResponse *putObjectResponse = [[AmazonClientManager s3] putObject:por];
    if(putObjectResponse.error != nil)
    {
        NSLog(@"Error: %@", putObjectResponse.error);
        
        if ([AmazonClientManager wipeCredentialsOnAuthError:putObjectResponse.error])
        {
            [[Constants expiredCredentialsAlert] show];
        }
    }
    
    [self dismissModalViewControllerAnimated:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)cancel:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)dealloc
{
    [super dealloc];
}


@end
