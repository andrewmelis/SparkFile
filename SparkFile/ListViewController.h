//
//  ListViewController.h
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXReorderableCollectionViewFlowLayout.h"
#import "FUIAlertView.h"

@interface ListViewController : UICollectionViewController <LXReorderableCollectionViewDataSource, LXReorderableCollectionViewDelegateFlowLayout, FUIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *allNotes;
@property (strong, nonatomic) IBOutlet UICollectionView *ListView;

-(void)colorSortAllNotes;
-(void)indexSortAllNotes;

-(void)getAllArchived;
-(void)getAllNonArchived;

@end
