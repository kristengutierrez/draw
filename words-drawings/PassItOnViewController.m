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
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:166.0f/255.0f
                                                                     green:216.0f/255.0f
                                                                      blue:215.0f/255.0f
                                                                     alpha:1.0f] CGColor], (id)[[UIColor colorWithRed:227.0f/255.0f
                                                                                                                green:80.0f/255.0f
                                                                                                                 blue:88.0f/255.0f
                                                                                                                alpha:1.0f] CGColor], (id)[[UIColor colorWithRed:235.0f/255.0f
                                                                                                                                                           green:32.0f/255.0f
                                                                                                                                                            blue:71.0f/255.0f
                                                                                                                                                           alpha:1.0f] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    //    CAGradientLayer *bg = [BackgroundGradient blueGradient];
    //    bg.frame = self.view.bounds;
    
    gradient.locations = @[ @(0.11f), @(0.999f), @(1.0) ];

    
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
