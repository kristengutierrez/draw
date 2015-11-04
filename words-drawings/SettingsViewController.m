//
//  SettingsViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "SettingsViewController.h"
#import "ChooseCategoryViewController.h"

NSInteger numberOfSecondsToIncrease = 10;

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberOfPlayersLabel;

- (IBAction)numberOfPlayersDecreaseButtonPressed:(id)sender;
- (IBAction)numberOfPlayersIncreaseButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *numberOfSecondsForRoundLabel;

- (IBAction)numberOfSecondsInRoundDecreaseButtonPressed:(id)sender;

- (IBAction)numberOfSecondsInRoundIncreaseButtonPressed:(id)sender;

- (IBAction)nextButtonPressed:(id)sender;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.numberOfPlayers = 3;
  self.durationOfRound = 20;
  
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (IBAction)numberOfPlayersDecreaseButtonPressed:(id)sender {
  
  if (self.numberOfPlayers > 3) {
    self.numberOfPlayers--;
    NSString *numberOfPlayersString = [NSString stringWithFormat: @"%ld", (long)self.numberOfPlayers];
    self.numberOfPlayersLabel.text = numberOfPlayersString;
  }
  
}

- (IBAction)numberOfPlayersIncreaseButtonPressed:(id)sender {
  self.numberOfPlayers++;
  NSString *numberOfPlayersString = [NSString stringWithFormat: @"%ld", (long)self.numberOfPlayers];
  self.numberOfPlayersLabel.text = numberOfPlayersString;
  
}

- (IBAction)numberOfSecondsInRoundDecreaseButtonPressed:(id)sender {
  
  if (self.durationOfRound > 20) {
    self.durationOfRound = self.durationOfRound - numberOfSecondsToIncrease;
    NSString *newDurationString = [NSString stringWithFormat: @"%ld", (long)self.durationOfRound];
    self.numberOfSecondsForRoundLabel.text = newDurationString;
  }
  
}

- (IBAction)numberOfSecondsInRoundIncreaseButtonPressed:(id)sender {
  
  if (self.durationOfRound < 60) {
    self.durationOfRound = self.durationOfRound + numberOfSecondsToIncrease;
    NSString *newDurationString = [NSString stringWithFormat: @"%ld", (long)self.durationOfRound];
    self.numberOfSecondsForRoundLabel.text = newDurationString;
  }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"ShowCategories"]) {
    ChooseCategoryViewController *chooseCategoryVC = [segue destinationViewController];
    chooseCategoryVC.numberOfPlayers = self.numberOfPlayers;
    chooseCategoryVC.durationOfRound = self.durationOfRound;
  }
}

- (IBAction)nextButtonPressed:(id)sender {
  NSLog(@"next button was pressed in settingsVC");
  //[self performSegueWithIdentifier:@"ShowCategories" sender:self];
}

@end
