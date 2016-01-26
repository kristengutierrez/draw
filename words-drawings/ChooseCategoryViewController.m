//
//  ChooseCategoryViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ChooseCategoryViewController.h"
#import "ChooseOptionViewController.h"
#import "CustomPromptViewController.h"
#import <stdlib.h>

@interface ChooseCategoryViewController ()

@property (strong,nonatomic) NSString *categoryPressed;
- (IBAction)goBack:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *category1Button;
@property (weak, nonatomic) IBOutlet UIButton *category2Button;
@property (weak, nonatomic) IBOutlet UIButton *category3Button;
@property (weak, nonatomic) IBOutlet UIButton *category4Button;

- (IBAction)category1Pressed:(UIButton *)sender;
- (IBAction)category2Pressed:(UIButton *)sender;
- (IBAction)category3Pressed:(UIButton *)sender;
- (IBAction)category4Pressed:(UIButton *)sender;

@property (strong,nonatomic) NSMutableArray *categoriesArray;
@property (strong,nonatomic) NSMutableArray *thisRoundsArray;
@property (strong,nonatomic) NSMutableArray *selectedArray;
@property (strong,nonatomic) NSMutableArray *numArray;

@end

@implementation ChooseCategoryViewController

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

    
    NSLog(@"number of players in choose category vc: %ld", (long)self.numberOfPlayers);
  
  _thisRoundsArray = [[NSMutableArray alloc] init];
  _categoriesArray = [NSMutableArray arrayWithObjects: @"Movies", @"People", @"Idioms", @"Books", @"Geography", @"Random", nil];
  
  NSInteger j = [_categoriesArray count];
  
  //randomize category selections, display 4 randomized options
  int remaining = 4;
  
  if (_categoriesArray.count >= remaining) {
    while (remaining > 0) {
      NSInteger k = arc4random_uniform((u_int32_t)j) % 6;
      
      NSString *string = _categoriesArray[k];
      if (![_thisRoundsArray containsObject:string]){
        [_thisRoundsArray addObject:string];
        remaining--;
      }
    }
  }
  
  NSLog(@"%@",_thisRoundsArray[0]);
    NSLog(@"%@",_thisRoundsArray[1]);
    NSLog(@"%@",_thisRoundsArray[2]);
    NSLog(@"%@",_thisRoundsArray[3]);
  
  //set text on buttons
  [self.category1Button setTitle: _thisRoundsArray[0] forState: UIControlStateNormal];
  [self.category2Button setTitle: _thisRoundsArray[1] forState: UIControlStateNormal];
  [self.category3Button setTitle: _thisRoundsArray[2] forState: UIControlStateNormal];
  [self.category4Button setTitle: _thisRoundsArray[3] forState: UIControlStateNormal];
    [self viewDidAppear:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"ShowOptions"])
  {
    ChooseOptionViewController *chooseOptionVC = (ChooseOptionViewController *)[segue destinationViewController];
    chooseOptionVC.chosenCategory = self.categoryPressed;
    chooseOptionVC.numberOfPlayers = self.numberOfPlayers;
    chooseOptionVC.durationOfRound = self.durationOfRound;
  } else if ([[segue identifier] isEqualToString:@"showSeedVC"]){
    CustomPromptViewController *seedVC = (CustomPromptViewController *)[segue destinationViewController];
    seedVC.numberOfPlayers = self.numberOfPlayers;
    seedVC.durationOfRound = self.durationOfRound;
  }
}

- (IBAction)goBack:(UIButton *)sender {
   [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)category1Pressed:(UIButton *)sender {
  NSLog(@"YOU PRESSED %@", sender.titleLabel.text);
  self.categoryPressed = sender.titleLabel.text;
 
 [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

- (IBAction)category2Pressed:(UIButton *)sender {
  self.categoryPressed = _thisRoundsArray[1];
  NSLog(@"%@", self.categoryPressed);
 
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}
- (IBAction)category3Pressed:(UIButton *)sender {
  self.categoryPressed = _thisRoundsArray[2];
  NSLog(@"%@", self.categoryPressed);
 
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

- (IBAction)category4Pressed:(UIButton *)sender {
    self.categoryPressed = _thisRoundsArray[3];
    NSLog(@"%@", self.categoryPressed);
    
    [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

@end
