//
//  EndOfGameViewController.h
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExperimentalViewController.h"

@interface EndOfGameViewController : UIViewController

@property (strong, nonatomic) UIView *tableViewScreenshot;
@property int numberOfCells;
@property (strong, nonatomic) NSMutableArray *sketchGuesses;

@end
