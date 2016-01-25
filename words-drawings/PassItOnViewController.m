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

@property (weak, nonatomic) IBOutlet UILabel *passDeviceLabel;
@property (weak, nonatomic) IBOutlet UIStackView *nextPlayerReadyStackView;

@property BOOL passDetected;

@end

@implementation PassItOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nextPlayerReadyStackView.hidden = YES;
    self.passDeviceLabel.hidden = NO;
    
    [self performSelector:@selector(hideAndShowLabels)
               withObject:(self)
               afterDelay:(1.5)];
    
}

-(void)hideAndShowLabels {
    self.nextPlayerReadyStackView.hidden = NO;
    self.passDeviceLabel.hidden = YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"StartGamePlay"]) {
        GamePlayViewController *gamePlayVC = (GamePlayViewController *)[segue destinationViewController];
        
        gamePlayVC.firstPrompt = self.stringToPass;
        gamePlayVC.totalNumberOfRounds = self.numberOfPlayers;
        gamePlayVC.durationOfRound = self.durationOfRound;
    }
    self.nextPlayerReadyStackView.hidden = YES;
    self.passDeviceLabel.hidden = NO;
    self.passDetected = NO;
}

@end
