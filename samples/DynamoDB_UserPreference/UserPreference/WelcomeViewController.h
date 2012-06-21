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

#import <UIKit/UIKit.h>

@interface WelcomeViewController:UIViewController
{
    IBOutlet UILabel  *tokenVendingMachineUrlLabel;
    IBOutlet UILabel  *sslEnabledLabel;

    IBOutlet UIButton *createDbButton;
    IBOutlet UIButton *setUpButton;
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *cleanUpButton;
}

-(IBAction)createDB:(id)sender;
-(IBAction)setUpUserList:(id)sender;
-(IBAction)showUserList:(id)sender;
-(IBAction)cleanUp:(id)sender;

-(void)showAlert:(NSString *)message withStatus:(NSString *)status;

@end
