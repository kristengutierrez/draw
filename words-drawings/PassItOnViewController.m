//
//  PassItOnViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "PassItOnViewController.h"
#import "CustomPromptViewController.h"
#import "ChooseOptionViewController.h"
#import "GamePlayViewController.h"

@interface PassItOnViewController ()

@end

@implementation PassItOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"StartGamePlay"]) {
        GamePlayViewController *gamePlayVC = (GamePlayViewController *)[segue destinationViewController];
        
        gamePlayVC.firstPrompt = self.stringToPass;
        gamePlayVC.totalNumberOfRounds = self.numberOfPlayers;
        gamePlayVC.durationOfRound = self.durationOfRound;
    }
}

@end
