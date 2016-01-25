//
//  GamePlayViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 1/4/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import "GamePlayViewController.h"
#import "EndGameViewController.h"
#import "JotViewController.h"


@interface GamePlayViewController ()

@property (weak, nonatomic) IBOutlet UIView *passItOnView;
- (IBAction)hidePassItOnView:(UIButton *)sender;
@property (nonatomic, strong) JotViewController *jotVC;
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


@end

@implementation GamePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self timeIsUp];
    
    self.sketchImageView.hidden = YES;
    
//    [self.imageDescriptionTextField becomeFirstResponder];
    self.imageDescriptionTextField.delegate = self;
    
    self.jotVC = [[JotViewController alloc] init];
    self.jotVC.delegate = self;
    self.jotVC.state = JotViewStateDrawing;
    [self addChildViewController:self.jotVC];
    [self.drawingPadView addSubview:self.jotVC.view];
    
//    [cell setNeedsLayout];
//    [cell layoutIfNeeded];
    
    //remove later
//    self.totalNumberOfRounds = 4;
    
    self.roundCount = 0;
    self.passItOnViewTopConstraint.constant = -1000;
    
    self.arrayOfSketchesAndGuesses = [[NSMutableArray alloc] init];
    
    //set this for now, later it will come from other vc
//    self.firstPrompt = @"this is the first prompt";
    
    [self.arrayOfSketchesAndGuesses addObject:self.firstPrompt];
    
    //set label to firstprompt
    self.textBoxLabel.text = self.firstPrompt;
    
    //the first round is always a drawing round, so hide guess tools:
    self.sketchImageView.hidden = YES;
    self.imageDescriptionTextField.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated{

    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self doneButtonPressed:nil];
    return NO;
}

- (void)timeIsUp {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Your time is up!" message:@"Finish and pass the device to the next player." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
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
    [self.imageDescriptionTextField resignFirstResponder];
    
    if (self.roundCount < self.totalNumberOfRounds) {
        if (self.roundCount % 2 == 0) {
            //if in a drawing round
            
            //save what is in the drawing pad uiview as a uiimage
            //but for now just save this
            UIImage *savedImage = [self.jotVC renderImageWithScale:2.f onColor:self.view.backgroundColor];
            [self.jotVC clearAll];
            
            [self.arrayOfSketchesAndGuesses addObject:savedImage];
            NSLog(@"array count: %lu", (unsigned long)self.arrayOfSketchesAndGuesses.count);
            
            self.sketchImageView.image = savedImage;
            
        } else {
            
            //if in a guessing round
            [self viewDidAppear:true];
            
            
            NSString *guess = self.imageDescriptionTextField.text;
            [self.arrayOfSketchesAndGuesses addObject:guess];
            
            self.textBoxLabel.text = self.imageDescriptionTextField.text;
        }
        
        
        [UIView animateWithDuration:0.6 animations:^{
            self.passItOnViewTopConstraint.constant = 0;
            [self.passItOnView layoutIfNeeded];
        } completion:^(BOOL finished){
            self.imageDescriptionTextField.text = @"";

            self.roundCount++;
            [self toggleRoundInterface];
            
        }];
        
        if (self.roundCount == self.totalNumberOfRounds - 1) {
            [self performSegueWithIdentifier:@"goToEndGame" sender:nil];
        }
    } else {
        
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
