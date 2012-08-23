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

#import "AddBucketViewController.h"
#import "AmazonClientManager.h"


@implementation AddBucketViewController


-(IBAction)add:(id)sender
{
    [bucketName resignFirstResponder];
    
    S3CreateBucketResponse *createBucketResponse = [[AmazonClientManager s3] createBucket:[[[S3CreateBucketRequest alloc] initWithName:bucketName.text] autorelease]];
    if(createBucketResponse.error != nil)
    {
        NSLog(@"Error: %@", createBucketResponse.error);
        
        if ([AmazonClientManager wipeCredentialsOnAuthError:createBucketResponse.error])
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
