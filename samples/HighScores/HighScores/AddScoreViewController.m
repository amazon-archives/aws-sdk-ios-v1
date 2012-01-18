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

#import "AddScoreViewController.h"
#import "HighScoreList.h"

@implementation AddScoreViewController

-(id)init
{
    return [super initWithNibName:@"AddScoreViewController" bundle:nil];
}

-(IBAction)add:(id)sender
{
    [player resignFirstResponder];
    [score resignFirstResponder];

    HighScore     *highScore     = [[[HighScore alloc] initWithPlayer:[player text] andScore:[[score text] intValue]] autorelease];
    HighScoreList *highScoreList = [[[HighScoreList alloc] init] autorelease];
    [highScoreList addHighScore:highScore];

    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)cancel:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
