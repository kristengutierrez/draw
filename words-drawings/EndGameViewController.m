//
//  EndGameViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 1/5/16.
//  Copyright © 2016 Matthew McClure. All rights reserved.
//

#import "EndGameViewController.h"
#import "EndGameCollectionViewCell.h"

@interface EndGameViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

- (IBAction)viewSlideshow:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *curtain;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *curtainTopConstraint;

- (IBAction)clickToViewGameSummary:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UICollectionView *endOfGameCollectionView;


@property (weak, nonatomic) IBOutlet UIView *curtainView;


@end

@implementation EndGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:166.0f/255.0f
                                                                     green:216.0f/255.0f
                                                                      blue:215.0f/255.0f
                                                                     alpha:1.0f] CGColor], (id)[[UIColor colorWithRed:227.0f/255.0f
                                                                                                                green:80.0f/255.0f
                                                                                                                 blue:88.0f/255.0f
                                                                                                                alpha:1.0f] CGColor], (id)[[UIColor colorWithRed:235.0f/255.0f
                                                                                                                                                           green:32.0f/255.0f
                                                                                                                                                            blue:71.0f/255.0f
                                                                                                                                                           alpha:1.0f] CGColor], nil];
    [self.curtain.layer insertSublayer:gradient atIndex:0];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    //    CAGradientLayer *bg = [BackgroundGradient blueGradient];
    //    bg.frame = self.view.bounds;
    
    gradient.locations = @[ @(0.11f), @(0.999f), @(1.0) ];

    
    self.curtain.hidden = NO;
    
    for (int i = 0; i < self.finalArrayOfSketchGuesses.count; i++) {
        if (i % 2 == 0) {
            NSLog(@"string: %@", self.finalArrayOfSketchGuesses[i]);
        }
    }
    
    self.endOfGameCollectionView.dataSource = self;
    self.endOfGameCollectionView.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight =  self.endOfGameCollectionView.frame.size.height;
    return CGSizeMake(self.view.frame.size.width, cellHeight);
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSInteger cellCount = self.finalArrayOfSketchGuesses.count;
    return cellCount;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    
    UINib *nib = [UINib nibWithNibName:@"EndGameCell" bundle: nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
//    nibMyCellloaded = YES;
    
    EndGameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        cell.guessLabel.text = [self.finalArrayOfSketchGuesses objectAtIndex:indexPath.row];
        cell.sketchImageView.hidden = YES;
    } else {
        cell.guessLabel.hidden = YES;
        cell.sketchImageView.image = [self.finalArrayOfSketchGuesses objectAtIndex:indexPath.row];
//        cell.sketchImageView.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

- (IBAction)clickToViewGameSummary:(UIButton *)sender {
    
    [UIView animateWithDuration:0.6 animations:^{
        self.curtainTopConstraint.constant = -1000;
        [self.curtainView layoutIfNeeded];
    }];
    
}

- (IBAction)viewSlideshow:(UIButton *)sender {
    self.curtain.hidden = YES;
}
@end
