//
//  BetterInstructionsViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/24/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "BetterInstructionsViewController.h"
#import "MainViewController.h"

@interface BetterInstructionsViewController ()

- (IBAction)closeThisButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextView *thisScrollView;



@end

@implementation BetterInstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated
{
    // Don'd do anything here to prevent autoscrolling.
    // Unless you plan on using this method in another fashion.
}

- (void)viewDidLayoutSubviews{
//    CGRect frame = CGRectMake(0, 0, 1024, 748); //wherever you want to scroll
//    [self.thisScrollView scrollRectToVisible:frame animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)closeThisButton:(UIButton *)sender {
  
  [UIView animateWithDuration:0.4 animations:^{
    self.view.alpha = 0;
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
  }];
  
}
@end
