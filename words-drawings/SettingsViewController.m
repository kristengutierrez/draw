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

- (IBAction)goBack:(UIButton *)sender;

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

  
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
//  [self performSegueWithIdentifier:@"ShowCategories" sender:self];
}

@end
