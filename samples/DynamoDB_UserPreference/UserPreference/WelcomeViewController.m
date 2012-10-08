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

#import "WelcomeViewController.h"
#import "UserListViewController.h"
#import "DynamoDBManager.h"

@implementation WelcomeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"User Preference Demo";
    }
    return self;
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];

    tokenVendingMachineUrlLabel.text = TOKEN_VENDING_MACHINE_URL;
    sslEnabledLabel.text             = USE_SSL ? @"YES" : @"NO";

    // if TOKEN_VENDING_MACHINE_URL is a valid URL
    if ([NSURL URLWithString:TOKEN_VENDING_MACHINE_URL] != nil)
    {
        createDbButton.hidden = NO;
        setUpButton.hidden    = NO;
        startButton.hidden    = NO;
        cleanUpButton.hidden  = NO;
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc
{
    [tokenVendingMachineUrlLabel release];
    [sslEnabledLabel release];
    [setUpButton release];
    [startButton release];
    [cleanUpButton release];

    [super dealloc];
}

#pragma mark - User Action

-(IBAction)createDB:(id)sender
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        });

        NSString *tableStatus = [DynamoDBManager getTestTableStatus];

        if (tableStatus == nil)
        {
            [DynamoDBManager createTable];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{

                [self showAlert:@"The test table already exists." withStatus:tableStatus];
            });
        }

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

-(IBAction)setUpUserList:(id)sender
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        });

        NSString *tableStatus = [DynamoDBManager getTestTableStatus];

        if ([tableStatus isEqualToString:@"ACTIVE"])
        {
            [DynamoDBManager insertUsers];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{

                [self showAlert:@"The test table is not ready yet." withStatus:tableStatus];
            });
        }

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

-(IBAction)showUserList:(id)sender
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        });

        NSString *tableStatus = [DynamoDBManager getTestTableStatus];

        dispatch_async(dispatch_get_main_queue(), ^{

            if ([tableStatus isEqualToString:@"ACTIVE"])
            {
                UserListView *user_list_view = [[UserListView alloc] initWithStyle:UITableViewStyleGrouped];
                [self.navigationController pushViewController:user_list_view animated:YES];
                [user_list_view release];
            }
            else
            {
                [self showAlert:@"The test table is not ready yet." withStatus:tableStatus];
            }
        });

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

-(IBAction)cleanUp:(id)sender
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        });

        NSString *tableStatus = [DynamoDBManager getTestTableStatus];

        if ([tableStatus isEqualToString:@"ACTIVE"])
        {
            [DynamoDBManager cleanUp];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{

                [self showAlert:@"The test table is not ready yet." withStatus:tableStatus];
            });
        }

        dispatch_async(dispatch_get_main_queue(), ^{

            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });

}

-(void)showAlert:(NSString *)message withStatus:(NSString *)status
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Warning"
                          message:[NSString stringWithFormat:@"%@\nTable Status: %@.",
                                   message,
                                   status == nil ? @"table does not exist" : status]
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    
    [alert show];
    [alert release];
}

#pragma mark -

@end
