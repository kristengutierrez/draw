//
//  GamePlayViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 1/4/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import "GamePlayViewController.h"

@interface GamePlayViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *textBoxLabel;
@property (weak, nonatomic) IBOutlet UITextField *imageDescriptionTextField;
- (IBAction)doneButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *drawingPadView;
@property (weak, nonatomic) IBOutlet UIImageView *sketchImageView;
@property NSInteger roundCount;

@end

@implementation GamePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roundCount = 1;
    
    //the first round is always a drawing round, so hide guess tools:
    self.sketchImageView.hidden = YES;
    self.imageDescriptionTextField.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleRoundInterface {
    if (self.roundCount % 2 == 0) {
        //if in a guessing round, hide drawing tools
        self.textBoxLabel.hidden = YES;
        self.imageDescriptionTextField.hidden = NO;
        self.sketchImageView.hidden = NO;
        self.drawingPadView.hidden = YES;
    } else {
        //if in a drawing round, hide guessing tools
        self.textBoxLabel.hidden = NO;
        self.imageDescriptionTextField.hidden = YES;
        self.sketchImageView.hidden = YES;
        self.drawingPadView.hidden = NO;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneButtonPressed:(UIButton *)sender {
    self.roundCount++;
    [self toggleRoundInterface];
}
@end
