//
//  GamePlayViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 1/4/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import "GamePlayViewController.h"
#import "SketchGuess.h"
#import "EndGameViewController.h"

@interface GamePlayViewController ()

@property (weak, nonatomic) IBOutlet UIView *passItOnView;
- (IBAction)hidePassItOnView:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passItOnViewTopConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passItOnViewBottomConstraint;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *textBoxLabel;
@property (weak, nonatomic) IBOutlet UITextField *imageDescriptionTextField;
- (IBAction)doneButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *drawingPadView;
@property (weak, nonatomic) IBOutlet UIImageView *sketchImageView;
@property NSInteger roundCount;
@property NSMutableArray *arrayOfSketchesAndGuesses;
//@property SketchGuess *currentSketchGuess;

@end

@implementation GamePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //remove later
    self.totalNumberOfRounds = 5;
    
    self.roundCount = 0;
    self.passItOnViewTopConstraint.constant = -1000;
    
    //create first SketchGuess instance and set guess string to first prompt
//    self.currentSketchGuess = [[SketchGuess alloc] init];
    
    
    self.arrayOfSketchesAndGuesses = [[NSMutableArray alloc] init];
    
    //set this for now, later it will come from other vc
    self.firstPrompt = @"this is the first prompt";
    
//    self.currentSketchGuess.guessReplacementProperty = self.firstPrompt;
    
    [self.arrayOfSketchesAndGuesses addObject:self.firstPrompt];
    
    //set label to firstprompt
    self.textBoxLabel.text = self.firstPrompt;
    
    //the first round is always a drawing round, so hide guess tools:
    self.sketchImageView.hidden = YES;
    self.imageDescriptionTextField.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated{

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleRoundInterface {
    if (self.roundCount % 2 == 0) {
        //if in a drawing round, hide guessing tools
        self.textBoxLabel.hidden = NO;
        self.imageDescriptionTextField.hidden = YES;
        self.sketchImageView.hidden = YES;
        self.drawingPadView.hidden = NO;
    } else {
        
        
        //if in a guessing round, hide drawing tools
        self.textBoxLabel.hidden = YES;
        self.imageDescriptionTextField.hidden = NO;
        self.sketchImageView.hidden = NO;
        self.drawingPadView.hidden = YES;
    }
}

- (IBAction)doneButtonPressed:(UIButton *)sender {
    
    if (self.roundCount < self.totalNumberOfRounds - 1) {
        if (self.roundCount % 2 == 0) {
            //if in a drawing round
            
            //save what is in the drawing pad uiview as a uiimage
            //but for now just save this
            UIImage *savedImage = [UIImage imageNamed:@"gradient2.jpg"];
            
//            self.currentSketchGuess.sketchReplacementProperty = savedImage;
            
            [self.arrayOfSketchesAndGuesses addObject:savedImage];
            NSLog(@"array count: %lu", (unsigned long)self.arrayOfSketchesAndGuesses.count);
            
            self.sketchImageView.image = savedImage;
            
        } else {
            
            //if in a guessing round
            [self viewDidAppear:true];
            
//            self.currentSketchGuess.guessReplacementProperty = self.imageDescriptionTextField.text;
            
            NSString *guess = self.imageDescriptionTextField.text;
            [self.arrayOfSketchesAndGuesses addObject:guess];
            
            self.textBoxLabel.text = self.imageDescriptionTextField.text;
            self.imageDescriptionTextField.text = @"";
        }
        
        
        [UIView animateWithDuration:0.6 animations:^{
            self.passItOnViewTopConstraint.constant = 0;
            [self.passItOnView layoutIfNeeded];
        } completion:^(BOOL finished){
            
            self.roundCount++;
            [self toggleRoundInterface];
            
        }];
    } else {
        [self performSegueWithIdentifier:@"goToEndGame" sender:nil];
    }
  
    
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     if ([segue.identifier  isEqual: @"goToEndGame"]) {
         //
        EndGameViewController *endGameVC = (EndGameViewController *)[segue destinationViewController];
         endGameVC.totalNumberOfRounds = self.totalNumberOfRounds;
         
         //need way to pass array
         endGameVC.finalArrayOfSketchGuesses = [[NSMutableArray alloc] init];
         endGameVC.finalArrayOfSketchGuesses = self.arrayOfSketchesAndGuesses;
         NSLog(@"this is array count in prepareforseg: %lu", (unsigned long)self.arrayOfSketchesAndGuesses.count);
     }
     
 }
 

- (IBAction)hidePassItOnView:(UIButton *)sender {
    
    [UIView animateWithDuration:0.6 animations:^{
        self.passItOnViewTopConstraint.constant = -1000;
        [self.passItOnView layoutIfNeeded];
    }];
    
}
@end
