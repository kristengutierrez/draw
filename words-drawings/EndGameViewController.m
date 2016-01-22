//
//  EndGameViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 1/5/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import "EndGameViewController.h"

@interface EndGameViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *curtainTopConstraint;

- (IBAction)clickToViewGameSummary:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *curtainView;


@end

@implementation EndGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < self.finalArrayOfSketchGuesses.count; i++) {
        if (i % 2 == 0) {
            NSLog(@"string: %@", self.finalArrayOfSketchGuesses[i]);
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickToViewGameSummary:(UIButton *)sender {
    
    [UIView animateWithDuration:0.6 animations:^{
        self.curtainTopConstraint.constant = -1000;
        [self.curtainView layoutIfNeeded];
    }];
    
}
@end
