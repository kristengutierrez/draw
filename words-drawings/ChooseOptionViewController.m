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
@property (strong,nonatomic) NSMutableArray *musicArray;
@property (strong,nonatomic) NSMutableArray *sportsArray;
@property (strong,nonatomic) NSMutableArray *historyArray;
@property (strong,nonatomic) NSMutableArray *scienceArray;
@property (strong,nonatomic) NSMutableArray *geographyArray;
@property (strong,nonatomic) NSMutableArray *theArtsArray;

@property (strong,nonatomic) NSMutableArray *thisRoundsPromptsArray;

- (IBAction)option1Pressed:(UIButton *)sender;
- (IBAction)option2Pressed:(UIButton *)sender;
- (IBAction)option3Pressed:(UIButton *)sender;
- (IBAction)option4Pressed:(UIButton *)sender;

@end

@implementation ChooseOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  [self.option1Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.option2Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.option3Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.option4Button.titleLabel setTextAlignment:NSTextAlignmentCenter];
  NSLog(@"%ld %ld", (long)self.numberOfPlayers, (long)self.durationOfRound);
    
  self.thisRoundsPromptsArray = [[NSMutableArray alloc] init];
  
  NSLog(@"You chose... wisely: %@", self.chosenCategory);
  
  
   _filmAndTVArray = [NSMutableArray arrayWithObjects: @"The Godfather", @"Indiana Jones and The Last Crusade", @"Woody Allen", @"Steven Spielberg", @"Rocky", @"Rushmore", @"Back to the Future II", @"Alice in Wonderland", @"Boogie Nights", @"Space Jam", @"Mission: Impossible", @"Annie Hall", @"Being John Malkovich", @"Metropolis", @"The Dark Crystal", @"Vertigo", @"Star Trek", @"Iron Man", @"Hannibal", @"Meet the Parents", @"Beetlejuice", @"Seinfeld", @"Gilligan's Island", @"Home Improvement", @"Arrested Development", @"Mork and Mindy", @"GI-Joe", @"Weeds", @"Lost", @"The Twilight Zone", @"24", @"House, M.D.", nil];
   
   _musicArray = [NSMutableArray arrayWithObjects: @"Madonna", @"Beethoven", @"Heartbreak Hotel", @"U Can't Touch This", @"Thriller", @"The Sound of Silence", @"Glenn Gould", @"November Rain", @"Paranoid Android", @"Magical Mystery Tour", @"John Cage", @"Nirvana", @"Michael Jackson", @"Frank Sinatra", @"Katy Perry", @"Tiny Tim", @"Bohemian Rhapsody", @"Enya", @"California Girls", @"Linda McCartney", nil];
   
   _sportsArray = [NSMutableArray arrayWithObjects: @"Babe Ruth", @"Magic Johnson", @"7th Inning Stretch", @"Dennis Rodman", @"Michael Jordan", @"Shea Stadium", @"Chicago White Sox", @"San Francisco Giants", @"St. Louis Cardinals", @"The Rose Bowl", @"Cricket", nil];
   
   _historyArray = [NSMutableArray arrayWithObjects: @"The French Revolution", @"The Cuban Missle Crisis", @"Catherine the Great", @"D-Day", @"Elvis meets Nixon", @"Washington Crossing the Delaware", @"The Discovery of King Tut's Tomb", @"The War of 1812", nil];
   
   _scienceArray = [NSMutableArray arrayWithObjects: @"Carl Sagan", @"Relativity", @"Jonas Salk", @"Isaac Newton", @"protons", @"gravity", @"Dark Matter", @"Chemistry", @"Biology", @"Vaccinations", nil];
   
//   _natureArray = [NSMutableArray arrayWithObjects: @"Three-Toed Sloths", @"Mt. Rainier", @"The Grand Canyon", @"The Pacific Ocean", nil];
   
   _geographyArray = [NSMutableArray arrayWithObjects: @"Paris", @"Antarctica", @"Las Vegas", @"South Dakota", @"Chicago", @"The Nile River", @"China", @"Malta", @"The Isle of Man", @"Orlando", @"Botswana", @"Argentina", @"Brazil", @"The Grand Canyon", @"South Africa", nil];
   
   _theArtsArray = [NSMutableArray arrayWithObjects: @"The Mona Lisa", @"Pablo Picasso", @"Girl With Pearl Earring", @"Guernica", @"A Tale of Two Cities", @"Where the Sidewalk Ends", @"The Hobbit", @"Nausea", nil];
   
//   _literatureArray = [NSMutableArray arrayWithObjects: @"A Tale of Two Cities", @"Where the Sidewalk Ends", @"The Hobbit", @"Nausea", nil];
   
//   _zanyMiscellanyArray = [NSMutableArray arrayWithObjects: @"42", @"Penguins Playing Golf", @"Insomnia", @"Public Restroom", @"Grumpy Cat", @"Prom Night", @"Cat Fight", @"Mom Jeans", @"Ed Bassmaster", nil];
    
  self.chosenCategoryLabel.text = self.chosenCategory;

  _pickedObjects = [[NSMutableArray alloc] init];
  
  //_pickedObjects = _filmAndTVArray;
  
  if ([_chosenCategory isEqualToString:@"FILM & TV"]){
    _pickedObjects = _filmAndTVArray;
  } else if ([_chosenCategory isEqualToString:@"MUSIC"]){
    _pickedObjects = _musicArray;
  } else if ([_chosenCategory isEqualToString:@"SPORTS"]){
    _pickedObjects = _sportsArray;
  } else if ([_chosenCategory isEqualToString:@"HISTORY"]){
    _pickedObjects = _historyArray;
  } else if ([_chosenCategory isEqualToString:@"SCIENCE"]){
    _pickedObjects = _scienceArray;
  } else if ([_chosenCategory isEqualToString:@"GEOGRAPHY"]){
    _pickedObjects = _geographyArray;
  } else if ([_chosenCategory isEqualToString:@"THE ARTS"]){
    _pickedObjects = _theArtsArray;
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
