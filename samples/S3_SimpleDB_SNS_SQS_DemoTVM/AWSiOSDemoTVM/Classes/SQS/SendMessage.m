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


#import "SendMessage.h"
#import "AmazonClientManager.h"

@implementation SendMessage

@synthesize queue;


-(void)viewDidLoad
{
    [super viewDidLoad];
    queueNameLabel.text = queue;
}

-(IBAction)send:(id)sender
{        SQSSendMessageRequest *sendMessageRequest = [[[SQSSendMessageRequest alloc] initWithQueueUrl:queue andMessageBody:message.text] autorelease];
    SQSSendMessageResponse *sendMessageResponse = [[AmazonClientManager sqs] sendMessage:sendMessageRequest];
    if(sendMessageResponse.error != nil)
    {
        NSLog(@"Error: %@", sendMessageResponse.error);
        
        if ([AmazonClientManager wipeCredentialsOnAuthError:sendMessageResponse.error])
        {
            [[Constants expiredCredentialsAlert] show];
        }
    }
    
    [self dismissModalViewControllerAnimated:YES];
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
