//
//  CustomPromptViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "CustomPromptViewController.h"
#import "PassItOnViewController.h"
#import "ChooseCategoryViewController.h"

@interface CustomPromptViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *seedSentenceTextField;
- (IBAction)doneButton:(UIButton *)sender;

@end

@implementation CustomPromptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _seedSentenceTextField.delegate = self;
  
//  _seedSentenceTextField.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
//  
  NSLog(@"NUM PLAYERS PAASED: %ld, DURATION PASSED: %ld",(long)_numberOfPlayers, (long)_durationOfRound);
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
  self.seedSentence = [_seedSentenceTextField text];
  NSLog(@"WOULD YOU LOOK AT THAT%@", self.seedSentence);
  [_seedSentenceTextField resignFirstResponder];
  [self performSegueWithIdentifier:@"showPassItOnVC" sender:self];
  
  return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)doneButton:(UIButton *)sender {
  self.seedSentence = [_seedSentenceTextField text];
  NSLog(@"WOULD YOU LOOK AT THAT%@", self.seedSentence);
  [self performSegueWithIdentifier:@"showPassItOnVC" sender:self];
}

 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

   if ([segue.identifier isEqual: @"showPassItOnVC"]) {
     PassItOnViewController *passItOnVC = [segue destinationViewController];
     passItOnVC.stringToPass = self.seedSentence;
     passItOnVC.numberOfPlayers = self.numberOfPlayers;
     passItOnVC.durationOfRound = self.durationOfRound;
   }
 }
 
@end
