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

#import "HighScoresViewController.h"
#import "HighScoresTableViewController.h"
#import "AddScoreViewController.h"
#import "Constants.h"

@implementation HighScoresViewController

-(void)viewDidLoad
{
    if ( [ACCESS_KEY_ID isEqualToString:@"CHANGE ME"]) {
        [[Constants credentialsAlert] show];
    }
}

-(IBAction)playerSort:(id)sender
{
    if (sortByPlayer.on) {
        [sortByScore setOn:NO animated:YES];
    }
}

-(IBAction)scoreSort:(id)sender
{
    if (sortByScore.on) {
        [sortByPlayer setOn:NO animated:YES];
    }
}

-(IBAction)showScores:(id)sender
{
    HighScoresTableViewController *scores = nil;

    if (sortByScore.on) {
        scores = [[HighScoresTableViewController alloc] initWithSortMethod:SCORE_SORT];
    }
    else if (sortByPlayer.on) {
        scores = [[HighScoresTableViewController alloc] initWithSortMethod:PLAYER_SORT];
    }
    else {
        scores = [[HighScoresTableViewController alloc] initWithSortMethod:NO_SORT];
    }

    scores.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:scores animated:YES];
    [scores release];
}

-(IBAction)addSingleScore:(id)sender
{
    AddScoreViewController *addScores = [[AddScoreViewController alloc] init];

    addScores.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:addScores animated:YES];
    [addScores release];
}

-(IBAction)createHighScoresList:(id)sender
{
    HighScoreList *highScores = [[[HighScoreList alloc] init] autorelease];

    [highScores createHighScoresDomain];
    for (int i = 1; i < 10; i++) {
        NSString  *player    = [Constants getRandomPlayerName];
        HighScore *highScore = [[[HighScore alloc] initWithPlayer:player andScore:[Constants getRandomScore]] autorelease];

        [highScores addHighScore:highScore];
    }
}

-(IBAction)clearHighScoreList:(id)sender
{
    HighScoreList *highScores = [[[HighScoreList alloc] init] autorelease];

    [highScores clearHighScores];
}

@end
