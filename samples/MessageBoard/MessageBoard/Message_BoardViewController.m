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


#import "Message_BoardViewController.h"
#import "MessageBoard.h"
#import "MembersViewController.h"
#import "MessageQueueController.h"
#import "Constants.h"

// Main View
@implementation Message_BoardViewController

-(void)viewDidLoad
{
    if ( [ACCESS_KEY_ID isEqualToString:@"CHANGE ME"]) {
        [[Constants credentialsAlert] show];
    }
}


-(IBAction)viewQueue:(id)sender
{
    if (!seenQueueMessage) {
        seenQueueMessage = YES;
        [[Constants queueAlert] show];
    }

    MessageQueueController *queue = [[MessageQueueController alloc] init];
    queue.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:queue animated:YES];
    [queue release];
}

-(IBAction)subscribeEmail:(id)sender
{
    [email resignFirstResponder];
    [[MessageBoard instance] subscribeEmail:email.text];
    [[Constants confirmationAlert] show];
}

-(IBAction)subscribeSMS:(id)sender
{
    [sms resignFirstResponder];

    if ( [sms.text length] < 10) {
        [[Constants smsSubscriptionAlert] show];
    }
    else {
        [[MessageBoard instance] subscribeSms:sms.text];
        [[Constants confirmationAlert] show];
    }
}

-(IBAction)viewMembers:(id)sender
{
    MembersViewController *members = [[MembersViewController alloc] init];

    members.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:members animated:YES];
    [members release];
}

-(IBAction)post:(id)sender
{
    [message resignFirstResponder];
    [[MessageBoard instance] post:message.text];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:sms up:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:sms up:NO];
}

-(void)animateTextField:(UITextField *)textField up:(BOOL)moveUp
{
    int move = 50;

    if (moveUp) {
        move = -50;
    }

    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.25f];
    self.view.frame = CGRectOffset(self.view.frame, 0, move);
    [UIView commitAnimations];
}

-(void)dealloc
{
    [super dealloc];
}

@end
