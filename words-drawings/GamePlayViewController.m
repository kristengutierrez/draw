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
    [self.passItOnView.layer insertSublayer:gradient atIndex:0];
    //    CAGradientLayer *bg = [BackgroundGradient blueGradient];
    //    bg.frame = self.view.bounds;
    
    gradient.locations = @[ @(0.11f), @(0.999f), @(1.0) ];

    
    NSString *durationToString = [NSString stringWithFormat: @"%ld", (long)self.durationOfRound];
    self.timerLabel.text = durationToString;
    self.sketchImageView.hidden = YES;
    
    self.imageDescriptionTextField.delegate = self;
    
    
    self.jotVC = [[JotViewController alloc] init];
    
    self.jotVC.delegate = self;
    self.jotVC.state = JotViewStateDrawing;
    [self addChildViewController:self.jotVC];
    [self.view addSubview:self.jotVC.view];
    
    CGRect newFrame = CGRectMake(0, self.view.frame.size.height*0.25, self.view.frame.size.width, self.view.frame.size.height*0.75);
    self.jotVC.view.frame = newFrame;

    self.jotVC.drawingStrokeWidth = 4.f;
    
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
//     if (self.roundCount % 2 == 0) {
//         self.jotVC.view.hidden = NO;
//     }
    
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
//        self.jotVC.view.hidden = NO;
    } else {
        
        
        //if in a guessing round, hide drawing tools
        self.textBoxLabel.hidden = YES;
        self.imageDescriptionTextField.hidden = NO;
        self.sketchImageView.hidden = NO;
        self.drawingPadView.hidden = YES;
//        self.jotVC.view.hidden = YES;

    }
}

- (IBAction)doneButtonPressed:(UIButton *)sender {

    
    if ((self.roundCount % 2 != 0) && [self.imageDescriptionTextField.text  isEqual: @""]) {
        //alert
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Please enter a guess." message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        //proceed
        [self.imageDescriptionTextField resignFirstResponder];
        
        if (self.roundCount < self.totalNumberOfRounds) {
            if (self.roundCount % 2 == 0) {
                //if in a drawing round
                
                //save what is in the drawing pad uiview as a uiimage
                //but for now just save this
                UIImage *savedImage = [self.jotVC renderImageWithScale:2.f onColor:self.view.backgroundColor];
//                [self.jotVC clearAll];
//                self.jotVC.view.hidden = YES;
                
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
            
            [self.jotVC clearAll];
            self.jotVC.view.hidden = YES;
            [UIView animateWithDuration:0.5 animations:^{

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
         if (self.roundCount % 2 == 0) {
             self.jotVC.view.hidden = NO;
             
         }
    }];
    
}
@end
