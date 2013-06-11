//
//  LinkedNotesCell.h
//  SparkFile
//
//  Created by Andrew Melis on 6/11/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkedNotesCell : UICollectionViewCell <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *notesView;

@end
