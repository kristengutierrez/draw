//
//  PassItOnViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "PassItOnViewController.h"
#import "CustomPromptViewController.h"
#import "ChooseOptionViewController.h"
#import "GamePlayViewController.h"
#import <CoreMotion/CoreMotion.h>


@interface PassItOnViewController ()

@property (nonatomic,strong) CMMotionActivityManager *motionActivityManager;


@end

@implementation PassItOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
NSLog(@"number of players in choose pass it on vc: %ld", (long)self.numberOfPlayers);}



- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventTypeMotion){
        //there was motion
        NSLog(@"***heyo there was motion");
    }
}


- (void)detectPass {
    self.motionActivityManager=[[CMMotionActivityManager alloc]init];
    
    //register for Coremotion notifications
    [self.motionActivityManager startActivityUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMotionActivity *activity){
        NSLog(@"Current activity date is %f",activity.timestamp);

        
    }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"StartGamePlay"]) {
        GamePlayViewController *gamePlayVC = (GamePlayViewController *)[segue destinationViewController];
        
        gamePlayVC.firstPrompt = self.stringToPass;
        gamePlayVC.totalNumberOfRounds = self.numberOfPlayers;
        gamePlayVC.durationOfRound = self.durationOfRound;
    }
}

@end
