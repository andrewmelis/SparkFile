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


@property (strong, nonatomic) IBOutlet UICollectionView *ListView;


@property (strong, nonatomic) NSMutableArray *showNotes;
@property (strong, nonatomic) NSMutableArray *masterNotes;  //list synced with web

-(void) storeMasterNotes:(NSNotification*)applicationDidEnterBackground;


-(void)swapLists:(BOOL)archivedRequest;

-(void)colorSortAllNotes;
-(void)indexSortAllNotes;

-(void)updateAllNotesSlotNumbers;
-(void)syncNotesListWithMasterNotesList:(NSMutableArray*)notesList;

-(void)addInsets;
-(void)removeInsets;
-(void)scrollToBottom;
-(void)textViewDidBeginEditing:(UITextView *)textView;

-(void)archiveNote:(Note*)note;
-(void)createNote;
-(void)editNoteCell:(NoteCell*)noteCell;
-(void)endEdit:(NoteCell*)noteCell shouldScroll:(BOOL)shouldScroll indexPath:(NSIndexPath*)indexPath;

-(void)readyCellsForEditing:(UICollectionReusableView*)tappedElement curTapIsEdit:(BOOL)curTap;


@end
