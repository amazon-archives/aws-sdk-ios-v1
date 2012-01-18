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

#import "HighScoresTableViewController.h"

#import "PlayerViewController.h"

@implementation HighScoresTableViewController


-(id)initWithSortMethod:(int)theSortMethod
{
    highScoreList = [[HighScoreList alloc] initWithSortMethod:theSortMethod];
    scores        = [[NSMutableArray alloc] initWithCapacity:0];
    return [super initWithNibName:@"HighScoresTableViewController" bundle:nil];
}

-(IBAction)back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [highScoreList highScoreCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( [scores count] == 0) {
        [scores addObjectsFromArray:[highScoreList getHighScores]];
    }
    else if (indexPath.row > [scores count] - 1) {
        [scores addObjectsFromArray:[highScoreList getNextPageOfScores]];
    }


    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell...
    HighScore *highScore = [scores objectAtIndex:indexPath.row];
    cell.textLabel.text                      = highScore.player;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.detailTextLabel.text                = [NSString stringWithFormat:@"%d", highScore.score];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HighScore            *highScore = (HighScore *)[scores objectAtIndex:indexPath.row];

    PlayerViewController *playerView = [[PlayerViewController alloc] initWithPlayer:highScore];

    playerView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:playerView animated:YES];
    [playerView release];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        HighScore *highScore = (HighScore *)[scores objectAtIndex:indexPath.row];
        [highScoreList removeHighScore:highScore];

        [scores removeObjectAtIndex:indexPath.row];

        NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
}

-(void)dealloc
{
    [scores release];
    [highScoreList release];
    [super dealloc];
}

@end
