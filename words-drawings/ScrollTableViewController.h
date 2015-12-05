//
//  ScrollTableViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WordsTableViewCell, PassItOnViewController;

@interface ScrollTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property NSInteger numberOfPlayers;
@property NSInteger durationOfRound;
@property (strong,nonatomic) NSString *initialPrompt;
@property (weak, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) NSMutableArray *sketchGuesses;

@end
