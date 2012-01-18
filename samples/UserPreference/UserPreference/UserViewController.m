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

#import "UserViewController.h"
#import "DynamoDBManager.h"
#import <AWSiOSSDK/DynamoDB/DynamoDBAttributeValue.h>
#import "SelectionViewController.h"
#import <AWSiOSSDK/DynamoDB/DynamoDBUpdateItemRequest.h>
#import "AmazonClientManager.h"

@implementation UserViewController

@synthesize userNo, userInfo;

-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.userNo   = 0;
        self.userInfo = nil;

        tableDataSource = [[NSArray arrayWithObjects:
                            [NSArray arrayWithObjects:@"Auto Login", nil],
                            [NSArray arrayWithObjects:@"Color Theme", nil],
                            [NSArray arrayWithObjects:@"Vibrate", @"Silent", nil],
                            nil] retain];
    }
    return self;
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.userInfo = [DynamoDBManager getUserInfo:self.userNo];

    self.title = [NSString stringWithFormat:@"%@ %@",
                  ((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"firstName"]).s,
                  ((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"lastName"]).s];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)dealloc
{
    [userInfo release];
    [tableDataSource release];

    [super dealloc];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [tableDataSource count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)[tableDataSource objectAtIndex:section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UserViewCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.textLabel.text = [[tableDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];

    if ([cell.textLabel.text isEqualToString:@"Auto Login"])
    {
        UISwitch *autoLogin = [[UISwitch alloc] init];
        autoLogin.on = [((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"autoLogin"]).s isEqualToString:@"YES"] ? YES : NO;
        [autoLogin addTarget:self action:@selector(autoLoginSwichChanged:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = autoLogin;
        [autoLogin release];
    }
    else if ([cell.textLabel.text isEqualToString:@"Color Theme"])
    {
        cell.detailTextLabel.text = ((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"colorTheme"]).s;
        cell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if ([cell.textLabel.text isEqualToString:@"Vibrate"])
    {
        UISwitch *vibrate = [[UISwitch alloc] init];
        [vibrate addTarget:self action:@selector(vibrateSwichChanged:) forControlEvents:UIControlEventValueChanged];
        vibrate.on         = [((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"vibrate"]).s isEqualToString:@"YES"] ? YES : NO;
        cell.accessoryView = vibrate;
        [vibrate release];
    }
    else if ([cell.textLabel.text isEqualToString:@"Silent"])
    {
        UISwitch *silent = [[UISwitch alloc] init];
        [silent addTarget:self action:@selector(silentSwichChanged:) forControlEvents:UIControlEventValueChanged];
        silent.on          = [((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"silent"]).s isEqualToString:@"YES"] ? YES : NO;
        cell.accessoryView = silent;
        [silent release];
    }

    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[tableDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] isEqualToString:@"Color Theme"])
    {
        SelectionViewController *selectionView = [[SelectionViewController alloc] initWithStyle:UITableViewStyleGrouped];
        selectionView.dataSource    = [Constants getColors];
        selectionView.selectedValue = ((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"colorTheme"]).s;
        selectionView.title         = @"Color Theme";
        selectionView.delegate      = self;
        [self.navigationController pushViewController:selectionView animated:YES];
        [selectionView release];
    }
}

#pragma mark - SelectionView delegate

-(void)selectionViewController:(SelectionViewController *)selectionViewController
{
    [DynamoDBManager updateAttributeStringValue:selectionViewController.selectedValue
     forKey:@"colorTheme"
     withPrimaryKey:(DynamoDBAttributeValue *)[self.userInfo objectForKey:@"userNo"]];

    if (((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"colorTheme"]) == nil)
    {
        [self.userInfo setObject:[[[DynamoDBAttributeValue alloc] initWithS:@""] autorelease] forKey:@"colorTheme"];
    }
    ((DynamoDBAttributeValue *)[self.userInfo objectForKey:@"colorTheme"]).s = selectionViewController.selectedValue;

    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
}

#pragma mark - UISwitch Actions

-(void)autoLoginSwichChanged:(UISwitch *)aSwitch
{
    [aSwitch retain];
    [DynamoDBManager updateAttributeStringValue:aSwitch.on ? @"YES":@"NO"
     forKey:@"autoLogin"
     withPrimaryKey:(DynamoDBAttributeValue *)[self.userInfo objectForKey:@"userNo"]];
    [aSwitch release];
}

-(void)vibrateSwichChanged:(UISwitch *)aSwitch
{
    [aSwitch retain];
    [DynamoDBManager updateAttributeStringValue:aSwitch.on ? @"YES":@"NO"
     forKey:@"vibrate"
     withPrimaryKey:(DynamoDBAttributeValue *)[self.userInfo objectForKey:@"userNo"]];
    [aSwitch release];
}

-(void)silentSwichChanged:(UISwitch *)aSwitch
{
    [aSwitch retain];
    [DynamoDBManager updateAttributeStringValue:aSwitch.on ? @"YES":@"NO"
     forKey:@"silent"
     withPrimaryKey:(DynamoDBAttributeValue *)[self.userInfo objectForKey:@"userNo"]];
    [aSwitch release];
}

#pragma mark -

@end
