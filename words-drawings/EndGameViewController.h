//
//  EndGameViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 1/5/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndGameViewController : UIViewController

@property NSInteger totalNumberOfRounds;
@property (strong, nonatomic) NSMutableArray *finalArrayOfSketchGuesses;

@end
