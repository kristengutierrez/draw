//
//  CustomPromptViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChooseCategoryViewController;

@interface CustomPromptViewController : UIViewController

@property (strong,nonatomic) NSString *seedSentence;
@property NSInteger numberOfPlayers;
@property NSInteger durationOfRound;

@end
