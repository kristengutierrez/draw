//
//  PassItOnViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "PassItOnViewController.h"
#import "SeedViewController.h"
#import "ScrollTableViewController.h"
#import "ChooseOptionViewController.h"

@interface PassItOnViewController ()

@end

@implementation PassItOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  NSLog(@"*****%@", self.stringToPass);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqual: @"showScrollTVC"]) {
    UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
    ScrollTableViewController *scrollTVC = (ScrollTableViewController *)[navController topViewController];
    [scrollTVC setNavController:navController];

     scrollTVC.initialPrompt = self.stringToPass;
    scrollTVC.numberOfPlayers = self.numberOfPlayers;
    scrollTVC.durationOfRound = self.durationOfRound;
  }
}


@end
