//
//  ChooseOptionViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ChooseOptionViewController.h"
#import "ChooseCategoryViewController.h"
#import "PassItOnViewController.h"
//#import "ScrollTableViewController.h"
#include <stdlib.h>

@interface ChooseOptionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *chosenCategoryLabel;

- (IBAction)goBack:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *option3Button;
@property (weak, nonatomic) IBOutlet UIButton *option4Button;

@property (strong, nonatomic) NSMutableArray *pickedObjects;
@property (strong, nonatomic) NSString *selectedOption;

@property (strong,nonatomic) NSMutableArray *filmAndTVArray;
@property (strong,nonatomic) NSMutableArray *peopleArray;
@property (strong,nonatomic) NSMutableArray *idiomsArray;
@property (strong,nonatomic) NSMutableArray *booksArray;
@property (strong,nonatomic) NSMutableArray *scienceArray;
@property (strong,nonatomic) NSMutableArray *geographyArray;
@property (strong,nonatomic) NSMutableArray *randomArray;

@property (strong,nonatomic) NSMutableArray *thisRoundsPromptsArray;

- (IBAction)option1Pressed:(UIButton *)sender;
- (IBAction)option2Pressed:(UIButton *)sender;
- (IBAction)option3Pressed:(UIButton *)sender;
- (IBAction)option4Pressed:(UIButton *)sender;

@end

@implementation ChooseOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"number of players in choose option vc: %ld", (long)self.numberOfPlayers);
    
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

    
    
  [self.option1Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.option2Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.option3Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.option4Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  NSLog(@"%ld %ld", (long)self.numberOfPlayers, (long)self.durationOfRound);
    
  self.thisRoundsPromptsArray = [[NSMutableArray alloc] init];
  
  NSLog(@"You chose... wisely: %@", self.chosenCategory);
  
  
   self.filmAndTVArray = [NSMutableArray arrayWithObjects: @"Tangled", @"Forrest Gump", @"Spider-Man", @"Inception", @"Rocky", @"Rushmore", @"The Goonies", @"Alice in Wonderland", @"Toy Story", @"Space Jam", @"Taken", @"Monsters, Inc.", @"Being John Malkovich", @"Metropolis", @"The Dark Crystal", @"Star Trek", @"Iron Man", @"101 Dalmations", @"Beetlejuice", nil];
   
   self.peopleArray = [NSMutableArray arrayWithObjects: @"Madonna", @"Beethoven", @"Charlie Chaplin", @"Jim Carrey", @"Henry Ford", @"Houdini", @"Hillary Clinton", @"Weird Al", @"Albert Einstein", @"Mr. Rogers", @"John Cage", @"Cleopatra", @"Michael Jackson", @"Frank Sinatra", @"Katy Perry", @"Thomas Edison", @"Neil Armstrong", @"Elvis", @"Dr. Seuss", @"Linda McCartney", nil];
   
   self.idiomsArray = [NSMutableArray arrayWithObjects: @"apple of my eye", @"the bee's knees", @"out of this world", @"teacher's pet", @"close but no cigar", @"on the same page", @"peas in a pod", @"scared stiff", @"smarty pants", nil];
   
   self.booksArray = [NSMutableArray arrayWithObjects: @"The Shining", @"Green Eggs and Ham", @"1984", @"Gone With the Wind", @"White Fang", @"The Hobbit", @"Frankenstein", @"Moby-Dick", nil];
   
   self.geographyArray = [NSMutableArray arrayWithObjects: @"Paris", @"Antarctica", @"Las Vegas", @"Tokyo", @"Chicago", @"The Nile River", @"China", @"Mexico", @"Pacific Ocean", @"Orlando", @"India", @"Canada", @"Brazil", nil];
   
   self.randomArray = [NSMutableArray arrayWithObjects: @"pirate's booty", @"sushi", @"Bill Murray", @"organ donor", @"wooly mammoth", @"raining cats and dogs", @"white lie", @"Paranoid Android", nil];

    
  self.chosenCategoryLabel.text = self.chosenCategory;

  _pickedObjects = [[NSMutableArray alloc] init];
    
  if ([_chosenCategory isEqualToString:@"Movies"]){
    _pickedObjects = _filmAndTVArray;
  } else if ([_chosenCategory isEqualToString:@"People"]){
    _pickedObjects = _peopleArray;
  } else if ([_chosenCategory isEqualToString:@"Idioms"]){
    _pickedObjects = _idiomsArray;
  } else if ([_chosenCategory isEqualToString:@"Books"]){
    _pickedObjects = _booksArray;
  } else if ([_chosenCategory isEqualToString:@"SCIENCE"]){
    _pickedObjects = _scienceArray;
  } else if ([_chosenCategory isEqualToString:@"Geography"]){
    _pickedObjects = _geographyArray;
  } else if ([_chosenCategory isEqualToString:@"Random"]){
    _pickedObjects = _randomArray;
  }
    

    NSInteger j = [_pickedObjects count];
    
    //randomize category selections. will always display exactly 4 options.
    int remaining = 4;
    
    if (_pickedObjects.count >= remaining) {
        while (remaining > 0) {
            NSInteger k = arc4random_uniform((u_int32_t)j) % j;
            NSLog(@"k = %ld", (long)k);
            
            NSString *string = _pickedObjects[k];
            NSLog(@"%@", string);
            if (![_thisRoundsPromptsArray containsObject:string]){
                [_thisRoundsPromptsArray addObject:string];
                remaining--;
            }
        }
    }
    
  //set text on buttons
  NSString *option1Text = (NSString *)[_thisRoundsPromptsArray objectAtIndex:0];
  [_option1Button setTitle: option1Text forState: UIControlStateNormal];
  NSString *option2Text = (NSString *)[_thisRoundsPromptsArray  objectAtIndex:1];
  [_option2Button setTitle: option2Text forState: UIControlStateNormal];
  NSString *option3Text = (NSString *)[_thisRoundsPromptsArray objectAtIndex:2];
  [_option3Button setTitle: option3Text forState: UIControlStateNormal];
  NSString *option4Text = (NSString *)[_thisRoundsPromptsArray  objectAtIndex:3];
  [_option4Button setTitle: option4Text forState: UIControlStateNormal];
  

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)option1Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option2Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option3Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

- (IBAction)option4Pressed:(UIButton *)sender {
  _selectedOption = sender.titleLabel.text;
  [self performSegueWithIdentifier:@"OptionChosenStartGame"sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([[segue identifier] isEqualToString:@"OptionChosenStartGame"]) {
    PassItOnViewController *passItOnVC = [segue destinationViewController];
    passItOnVC.stringToPass = _selectedOption;
    passItOnVC.numberOfPlayers = self.numberOfPlayers;
    passItOnVC.durationOfRound = self.durationOfRound;
  }
}



- (IBAction)goBack:(UIButton *)sender {
  [self.navigationController popViewControllerAnimated:YES];
}
@end
