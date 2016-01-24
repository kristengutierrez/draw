//
//  GamePlayViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 1/4/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamePlayViewController : UIViewController

@property (strong, nonatomic) NSString *firstPrompt;
@property NSInteger totalNumberOfRounds;
@property NSInteger durationOfRound;

@end
