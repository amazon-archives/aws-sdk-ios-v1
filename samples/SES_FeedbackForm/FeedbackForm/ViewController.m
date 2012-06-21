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

#import "ViewController.h"
#import "Constants.h"
#import "AmazonClientManager.h"
#import "SESManager.h"


@implementation ViewController

@synthesize nameField;
@synthesize rating;
@synthesize commentsField;
@synthesize submitButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.nameField     = nil;
    self.rating        = nil;
    self.commentsField = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![AmazonClientManager hasCredentials]) {
        [[Constants credentialsAlert] show];
    }
    else {
        self.submitButton.enabled = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self animateView:textView up:YES];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self animateView:textView up:NO];
}

-(void)animateView:(UIView *)uiView up:(BOOL)moveUp
{
    int move = 175;
    
    if (moveUp) {
        move = -175;
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


#pragma mark - IBActions
-(IBAction)submit:(id)sender
{
    [nameField resignFirstResponder];
    [commentsField resignFirstResponder];
    
    if (nameField.text == nil || nameField.text.length == 0 || commentsField.text == nil || commentsField.text.length == 0) {
        [[[[UIAlertView alloc] initWithTitle:@"Feedback Not Sent" 
                                     message:@"Please fill out entire form." 
                                    delegate:nil 
                           cancelButtonTitle:@"OK" 
                           otherButtonTitles:nil] autorelease] show];
        return;
    }
    
    if ([SESManager sendFeedbackEmail:commentsField.text name:nameField.text rating:rating.selectedSegmentIndex+1]) {
        [[[[UIAlertView alloc] initWithTitle:@"Feedback Sent" 
                                     message:@"Thank you for your feedback!" 
                                    delegate:nil 
                           cancelButtonTitle:@"OK" 
                           otherButtonTitles:nil] autorelease] show];
        
    }
    else {
        [[[[UIAlertView alloc] initWithTitle:@"Feedback Failed" 
                                     message:@"Unable to send feedback at this time." 
                                    delegate:nil 
                           cancelButtonTitle:@"OK" 
                           otherButtonTitles:nil] autorelease] show];
    }
}

@end
