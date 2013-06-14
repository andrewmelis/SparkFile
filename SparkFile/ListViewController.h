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
#import "ListViewHeader.h"
#import "NoteCell.h"
@class ListViewHeader;
@class NoteCell;

@interface ListViewController : UICollectionViewController <LXReorderableCollectionViewDataSource, LXReorderableCollectionViewDelegateFlowLayout, FUIAlertViewDelegate, UITextViewDelegate>

@property (strong, nonatomic) NSMutableArray *allNotes;
@property (strong, nonatomic) NSMutableArray *masterNotes;  //nothing ever removed, syncs with web
@property (strong, nonatomic) IBOutlet UICollectionView *ListView;
@property (nonatomic) IBOutlet ListViewHeader *header;

-(void)colorSortAllNotes;
-(void)indexSortAllNotes;

-(void)getAllArchived;
-(void)getAllNonArchived;
-(void)archiveNote:(Note*)note;
-(void)createNote;
-(void)editNoteCell:(NoteCell*)noteCell;
-(void)removeInsets;
-(void)readyCellsForEditing:(UICollectionReusableView*)tappedElement curTapIsEdit:(BOOL)curTap;
-(void)endEdit:(NoteCell*)noteCell shouldScroll:(BOOL)shouldScroll indexPath:(NSIndexPath*)indexPath;

@end
