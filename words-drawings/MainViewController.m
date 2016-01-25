//
//  MainViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "MainViewController.h"
#import "BackgroundGradient.h"
#import <QuartzCore/QuartzCore.h>
#import "BetterInstructionsViewController.h"

CGFloat const kInstructionMenuHeightMultiplier = 0.85;
CGFloat const kInstructionMenuWidthMultiplier = 0.85;

@interface MainViewController ()
- (IBAction)instructionsButton:(id)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 50.0f)];
  //  CAGradientLayer *gradient = [CAGradientLayer layer];
  //  gradient.frame = self.view.bounds;
  //  gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blueColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
  //  [self.view.layer insertSublayer:gradient atIndex:0];
  //  CAGradientLayer *bg = [BackgroundGradient blueGradient];
  //  bg.frame = self.view.bounds;
  //  [self.view.layer insertSublayer:bg atIndex:0];
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

- (IBAction)instructionsButton:(id)sender {
  BetterInstructionsViewController *instructionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"InstructionVC"];
  [self addChildViewController:instructionVC];
  
  instructionVC.view.frame = CGRectMake((self.view.frame.size.width - instructionVC.view.frame.size.width)/2, (self.view.frame.size.height - instructionVC.view.frame.size.height)/2, self.view.frame.size.width * kInstructionMenuWidthMultiplier, self.view.frame.size.height * kInstructionMenuHeightMultiplier);

  instructionVC.view.layer.masksToBounds = false;
  instructionVC.view.center = self.view.center;
  [self.view addSubview:instructionVC.view];
  [instructionVC didMoveToParentViewController:self];
  
  instructionVC.view.alpha = 0;
  [UIView animateWithDuration:0.4 animations:^{
    instructionVC.view.alpha = 1;
  }];
}
@end
