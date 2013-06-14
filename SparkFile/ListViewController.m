//
//  ListViewController.m
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "ListViewController.h"
#import "Note.h"
#import "NoteCell.h"
#import "NSString+FontAwesome.h"
#import "UIColor+FlatUI.h"
#import <QuartzCore/QuartzCore.h>
#import "ListViewHeader.h"
#import "NSString+FontAwesome.h"

@interface ListViewController ()

@end

@implementation ListViewController

//@synthesize allNotes;


- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
//    NSArray *temp;
//    [PFObject fetchAll:temp];
//    _allNotes = [temp mutableCopy];
    
	// Do any additional setup after loading the view.
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow) name:UIKeyboardDidShowNotification object:nil];
    
    self.ListView.delegate = self;
    self.ListView.dataSource = self;
    
    _allNotes = [[NSMutableArray alloc] init];
    _archivedNotes = [[NSMutableArray alloc] init];
    _masterNotes = [[NSMutableArray alloc] init];
    
//    Note *note = [[Note alloc] init];
//    note.text = @"one billion dollars";
//    note.color = [UIColor emerlandColor];
//    note.slot = 5;
//    NSUUID *uuid = [NSUUID UUID];
//    NSLog(@"UUID: %@", [uuid UUIDString]);
//    note.uuid = [uuid UUIDString];
//    [_allNotes addObject:note];
//    
//    Note *note2 = [[Note alloc] init];
//    note2.text = @"so much money";
//    note2.color = [UIColor sunflowerColor];
//    note2.slot = 4;
//    NSUUID *uuid2 = [NSUUID UUID];
//    NSLog(@"UUID: %@", [uuid2 UUIDString]);
//    note2.uuid = [uuid2 UUIDString];
//    [_allNotes addObject:note2];
//    
//    Note *note3 = [[Note alloc] init];
//    note3.text = @"this is my third smart thing";
//    note3.color = [UIColor amethystColor];
//    note3.slot = 3;
//    NSUUID *uuid3 = [NSUUID UUID];
//    NSLog(@"UUID: %@", [uuid3 UUIDString]);
//    note3.uuid = [uuid3 UUIDString];
//    [_allNotes addObject:note3];
//    
//    Note *note4 = [[Note alloc] init];
//    note4.text = @"this is my fourth facebook-level game changer";
//    note4.color = [UIColor midnightBlueColor];
//    note4.slot = 2;
//    NSUUID *uuid4 = [NSUUID UUID];
//    NSLog(@"UUID: %@", [uuid4 UUIDString]);
//    note4.uuid = [uuid4 UUIDString];
//    [_allNotes addObject:note4];
//    
//    Note *note5 = [[Note alloc] init];
//    note5.text = @"this is my fifth idea";
//    note5.color = [UIColor alizarinColor];
//    note5.slot = 1;
//    NSUUID *uuid5 = [NSUUID UUID];
//    NSLog(@"UUID: %@", [uuid5 UUIDString]);
//    note5.uuid = [uuid5 UUIDString];
//    [_allNotes addObject:note5];
    
    Note *note6 = [[Note alloc] init];
    note6.text = @"this is my sixth thought";
    note6.color = [UIColor emerlandColor];
    note6.slot = 0;
    NSUUID *uuid6 = [NSUUID UUID];
    NSLog(@"UUID: %@", [uuid6 UUIDString]);
    note6.uuid = [uuid6 UUIDString];
    [_allNotes addObject:note6];
    
    NSLog(@"temp data entered");
    [self indexSortAllNotes];
    _masterNotes = [_allNotes mutableCopy];         //todo fix this
    
}

-(void)viewDidAppear:(BOOL)animated
{
//    [self scrollToBottom];
}


//PARSE METHODS
-(void)saveAllNotesToParse
{
    
}
//{
//    for (Note* note in _allNotes) {
//        NSLog(@"%@",note.text);
//        [note saveNoteToParse:note];
//    }
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier_solo    = @"NoteCell";

    NoteCell *cell;
    
    if ([_allNotes objectAtIndex:indexPath.item]) {         //if there's an object at index
        
        Note *note = [_allNotes objectAtIndex:indexPath.item];      //get that note
    
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier_solo forIndexPath:indexPath];
        cell.note = note;
        cell.parentViewController = self;
        
        //cell formatting -- good stuff
        [[cell noteText] setText:note.text];
        [[cell noteText] setBackgroundColor:[UIColor clearColor]];
        [[cell noteText] setFont:[UIFont boldFlatFontOfSize:16]];
        cell.backgroundColor = note.color;
    
        cell.archiveIcon.backgroundColor = note.color;
        cell.archiveIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:26];
        
        if (note.archived) {
            cell.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconCheckSign];
        } else {
            cell.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconSignBlank];
        }
        
    
        cell.colorChooserIcon.backgroundColor = note.color;
        cell.colorChooserIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:26];
        cell.colorChooserIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconAdjust];
        
        cell.editIcon.backgroundColor = note.color;
        cell.editIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:26];
        cell.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEdit];
    
        cell.layer.cornerRadius=5;         //make it pretty
            
    }
    
    return cell;
    
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (kind == UICollectionElementKindSectionHeader) {
        ListViewHeader *suppView;
        suppView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SuppViewHead" forIndexPath:indexPath];
        
        suppView.parentViewController = self;
        
        //format icons
        suppView.systemSettingsIcon.backgroundColor = [UIColor clearColor];
        suppView.systemSettingsIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:30];
        suppView.systemSettingsIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconCog];
        
        suppView.colorSortIcon.backgroundColor = [UIColor clearColor];
        suppView.colorSortIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:30];
        suppView.colorSortIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconCircleBlank];

        suppView.dateSortIcon.backgroundColor = [UIColor clearColor];
        suppView.dateSortIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:30];
        suppView.dateSortIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconReorder];
        
        suppView.archiveIcon.backgroundColor = [UIColor clearColor];
        suppView.archiveIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:30];
        suppView.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconOkCircle];
        
        suppView.createNoteIcon.backgroundColor = [UIColor clearColor];
        suppView.createNoteIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:30];
        suppView.createNoteIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconPlusSign];
        
        return suppView;        
        
    } else if (kind == UICollectionElementKindSectionFooter ) {
        UICollectionReusableView *suppView;
        suppView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SuppViewFoot" forIndexPath:indexPath];
        return suppView;
    }
    return nil;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (_allNotes != NULL) {
        return _allNotes.count;
    }
    else return 0;  //TODO check this later

}


//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"selected cell at @%d",indexPath.item);
//    [self.ListView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionTop];      //really want to open modal view with cell and keyboard
//    [self.ListView deselectItemAtIndexPath:indexPath animated:YES];
//}

-(BOOL)keyBoardDidShow
{
    return YES;
}


//changes button color from alertview in notecell
-(void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    FUIButton *button = [alertView.buttons objectAtIndex:buttonIndex];
    NSLog(@"@%@",alertView.note.color);
    alertView.note.color = button.buttonColor;
    NSLog(@"@%@",alertView.note.color);
    [self.ListView reloadData];
}



//sorts all notes by color, as defined by user?
-(void)colorSortAllNotes {
    NSArray *sortedNotes;
    sortedNotes = [_allNotes sortedArrayUsingSelector:@selector(colorCompare:)];
    _allNotes = sortedNotes.mutableCopy;
    [self.ListView reloadData];
}

//sorts all the notes by slot index
-(void)indexSortAllNotes {
    NSArray *sortedNotes;
    sortedNotes = [_allNotes sortedArrayUsingSelector:@selector(indexCompare:)];
    _allNotes = sortedNotes.mutableCopy;
    [self.ListView reloadData];
}

//updates persistent slot index of each note, for proper "date" / dragged sorting
-(void)updateAllNotesSlotNumbers {
    for (int i = 0; i<_allNotes.count; i++) {
        Note *note = [_allNotes objectAtIndex:i];
        note.slot = i;
        [_allNotes replaceObjectAtIndex:i withObject:note];
        _masterNotes = [_allNotes mutableCopy];
//        [note saveNoteToParse:note];
    }
//    [PFObject saveAll:_allNotes];
//     saveAllNotesToParse];
}

//updates allnotes to only include archived notes
-(void)getAllArchived {
    //get all notes from web
    NSMutableArray *archivedNotes = [[NSMutableArray alloc] init];
    for (int i = 0; i<_masterNotes.count; i++) {
        Note *note = [_masterNotes objectAtIndex:i];
        if(note.archived) {
            [archivedNotes addObject:note];
        }
    }
    _archivedNotes = [archivedNotes mutableCopy];
    [self.ListView reloadData];
    
}

//updates allnotes to only include non-archived notes
-(void)getAllNonArchived {
    //get all notes from web
    NSMutableArray *nonArchivedNotes = [[NSMutableArray alloc] init];
    for (int i = 0; i<_masterNotes.count; i++) {
        Note *note = [_masterNotes objectAtIndex:i];
        if(!note.archived) {
            [nonArchivedNotes addObject:note];
        }
    }
    _allNotes = [nonArchivedNotes mutableCopy];
    [self.ListView reloadData];
}

-(void)archiveNote:(Note*)note {
    //sync note with web

    [_allNotes removeObject:note];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:note.slot inSection:0];
//    NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndex:note.slot];
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
    
    if (indexPath.item == 0) {
        [self.ListView reloadData];         //avoid error noted here: http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
    } else {
        [self.ListView deleteItemsAtIndexPaths:indexPaths];
    }
    
    NSLog(@"remaining items in collection view: @%i", _allNotes.count);
    
    [self updateAllNotesSlotNumbers];
    
    [self.ListView reloadData];
}

-(void)createNote {
    Note *note = [[Note alloc] init];
    note.color = [UIColor midnightBlueColor];
    note.slot = 0;
    NSUUID *uuid = [NSUUID UUID];
    NSLog(@"UUID: %@", [uuid UUIDString]);
    note.uuid = [uuid UUIDString];
    
    [_allNotes insertObject:note atIndex:0];
    [self updateAllNotesSlotNumbers];
    NSIndexPath *indexPath;
    if (_allNotes.count == 1) {
        [self.ListView reloadData];
        indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
//                                  //avoid error noted here: http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
    } else {
        indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
        [self.ListView insertItemsAtIndexPaths:indexPaths];
    }
    NoteCell *newCell = (NoteCell*)[self.ListView cellForItemAtIndexPath:indexPath];
    [self editNoteCell: newCell];
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [textView becomeFirstResponder];
    return YES;
}

-(void) addInsets
{
    CGSize kbSize = CGSizeMake(320, 216);
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.ListView.contentInset = contentInsets;
    self.ListView.scrollIndicatorInsets = contentInsets;
}

-(void) scrollToBottom:(NSIndexPath*)indexPath
{
    CGPoint bottom;
    if (indexPath.item == 1 && _allNotes.count==2) {        //special case where only two cells and select second cell
        bottom = CGPointMake(0, self.ListView.contentSize.height - self.ListView.bounds.size.height + 170);
    } else {
        bottom = CGPointMake(0, self.ListView.contentSize.height - self.ListView.bounds.size.height);
    }
    [self.ListView setContentOffset:bottom animated:YES];
}

-(void)removeInsets
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.ListView.contentInset = contentInsets;
    self.ListView.scrollIndicatorInsets = contentInsets;
}

-(void)readyCellsForEditing:(UICollectionReusableView*)tappedElement curTapIsEdit:(BOOL)curTap {
    for (int i = 0; i<self.allNotes.count; i++) {
        NSLog(@"Tapped element type @%@",tappedElement.class);          //why is this being called so many times?
        NSIndexPath *path= [NSIndexPath indexPathForItem:i inSection:0];
        NoteCell *current = (NoteCell*)[self.ListView cellForItemAtIndexPath:path];
        
        if (tappedElement.class == [ListViewHeader class]) {            //if tapped header, close up note as normal, then do what header says
            [current flipEditingState];
//            [self editNoteCell:current];
        } else if(tappedElement == current) {                           //if tapped same cell, save (even if redundant) and do whatever told
            current.note.text = current.noteText.text;
        } else if (curTap) {
            [current flipEditingState];
        } else if (current.noteText.editable) {                            //otherwise it's a different cell, if editable, save up, close down without animation
//        } else {
            [self editNoteCell:current];
//            [current flipEditingState];
//            NSIndexPath *currentIndexPath = [self.ListView indexPathForCell:current];
//            
//            [self endEdit:current shouldScroll:(currentIndexPath.item >0 && _allNotes.count>1 && _allNotes.count - currentIndexPath.item <=3) indexPath:currentIndexPath];
        }//if it's not editable, don't need any teardown
    }
}

-(void)editNoteCell:(NoteCell*)noteCell
{

    //flip booleans
    noteCell.noteText.userInteractionEnabled = !noteCell.noteText.userInteractionEnabled;
    noteCell.noteText.editable = !noteCell.noteText.editable;

//    //flip icon
    noteCell.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEditSign];

    
    NSIndexPath *indexPath = [self.ListView indexPathForCell:noteCell];
    
    BOOL shouldScroll = (indexPath.item >0 && _allNotes.count>1 && _allNotes.count - indexPath.item <=3);
    

    if(noteCell.noteText.editable) {
        
        [self addInsets];       //even first cell needs insets
        if (shouldScroll) {

            [self.ListView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionTop];
        }
        //scroll to top

        [self textViewShouldBeginEditing:noteCell.noteText];

        noteCell.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEditSign];

    }
    else {
        [self endEdit:noteCell shouldScroll:shouldScroll indexPath:indexPath];
    }
}

-(void)endEdit:(NoteCell*)noteCell shouldScroll:(BOOL)shouldScroll indexPath:(NSIndexPath*)indexPath
{
    noteCell.note.text = noteCell.noteText.text;
    noteCell.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEdit];
    [noteCell.noteText endEditing:YES];
    
    if (shouldScroll) {
        [self scrollToBottom:indexPath];
        [self performSelector:@selector(removeInsets) withObject:Nil afterDelay:0.3];   //delay as short as possible the removal of insets to ensure animation looks clean
    }                                                                                   //if user flicks downward in less than 0.3 seconds, however,
    else {                                                                              //can "see" this weird shortening of scroll view. how to avoid this?
        [self removeInsets];
    }
}

    

#pragma mark - LXReorderableCollectionViewDataSource methods

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath willMoveToIndexPath:(NSIndexPath *)toIndexPath {
    
    Note *note = [_allNotes objectAtIndex:fromIndexPath.item];
    [_allNotes removeObjectAtIndex:fromIndexPath.item];
    [_allNotes insertObject:note atIndex:toIndexPath.item];
    //TODO update all indices
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath canMoveToIndexPath:(NSIndexPath *)toIndexPath {
    
    return YES;
}

#pragma mark - LXReorderableCollectionViewDelegateFlowLayout methods

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout willBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"will begin drag");
}

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout didBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did begin drag");
}

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout willEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"will end drag");
}

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout didEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath {
    [self updateAllNotesSlotNumbers];   //update the slots for sorting later
    NSLog(@"did end drag");
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
