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
#import "AlertViewHelper.h"

@interface ListViewController ()

@end

@implementation ListViewController

@synthesize masterNotes = _masterNotes;
@synthesize showNotes = _showNotes;



- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(storeMasterNotes:)
                                                 name:UIApplicationDidEnterBackgroundNotification object:nil];

    
    self.ListView.delegate = self;
    self.ListView.dataSource = self;
    
    _showNotes = [[NSMutableArray alloc] init];
    _masterNotes = [[NSMutableArray alloc] init];

    [self retrieveMasterNotes];
    
    [self swapLists:NO];

    
}

//TODO need viewDidAppear?

-(void) storeMasterNotes:(NSNotification*)notification
{
//    if ([[notification name] isEqualToString:@"entered_background"]){
        NSLog (@"Successfully received the test notification!");
//    }
    
    NSData *masterData = [NSKeyedArchiver archivedDataWithRootObject:_masterNotes];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:masterData forKey:@"master_notes"];
}

- (void) retrieveMasterNotes
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *encodedNotes = [ud objectForKey:@"master_notes"];
    NSArray *temp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedNotes];
    _masterNotes = [NSMutableArray arrayWithArray:temp];
}


#pragma mark - collectionview delegate methods

//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier_solo    = @"NoteCell";

    NoteCell *cell;
    
    if ([_showNotes objectAtIndex:indexPath.item]) {         //if there's an object at index
        
        Note *note = [_showNotes objectAtIndex:indexPath.item];      //get that note
    
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

//header & footer
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

    if (_showNotes != NULL) {
        return _showNotes.count;
    }
    else return 0;  //TODO check this later

}


#pragma mark - alertview colorpicker

-(void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //activates colorpicker -- changes button color from alertview in notecell
    if(alertView.tag ==44) {
        FUIButton *button = [alertView.buttons objectAtIndex:buttonIndex];
        alertView.note.color = button.buttonColor;
        [self.ListView reloadData];
    }
    //activates settings -- from listviewheader
    else if (alertView.tag == 55) {
        
        if (buttonIndex == 0)
        {
            [AlertViewHelper showHelp:self];
            
        } else if (buttonIndex == 1) {
            //show warning popup
            [AlertViewHelper clearData:self];


        } else if (buttonIndex == 2)
        {
            [AlertViewHelper showCredits:self];
        }
    }
    //clear the data, for real
    else if (alertView.tag == 66)
    {
        [_showNotes removeAllObjects];
        [_masterNotes removeAllObjects];
        [self storeMasterNotes:nil];
        [self retrieveMasterNotes];
        [self swapLists:NO];
    }
}

#pragma mark - swap which list is on screen
//if archivedRequest == true, then gets all archived notes
//if archivedRequest == false, then gets all non-archived notes
-(void)swapLists:(BOOL)archivedRequest {
    //sync previous shownotes with master list
    [self syncNotesListWithMasterNotesList:_showNotes];
    
    //clear shownotes
    [_showNotes removeAllObjects];
    //then replace list
    for (int i = 0; i<_masterNotes.count; i++) {
        Note *note = [_masterNotes objectAtIndex:i];
        if(note.archived == archivedRequest) {
            [_showNotes addObject:note];
        }
    }
    [self.ListView reloadData];
}


#pragma mark - sorting, ie first and second options
//sorts all notes by color, --TODO in future, allow user to set color preferences
-(void)colorSortAllNotes {
    NSArray *sortedNotes;
    sortedNotes = [_showNotes sortedArrayUsingSelector:@selector(colorCompare:)];
    _showNotes = sortedNotes.mutableCopy;
    [self.ListView reloadData];
}

//sorts all the notes by slot index
-(void)indexSortAllNotes {
    NSArray *sortedNotes;
    sortedNotes = [_showNotes sortedArrayUsingSelector:@selector(indexCompare:)];
    _showNotes = sortedNotes.mutableCopy;
    [self.ListView reloadData];
}

#pragma mark - list management helpers
//updates persistent slot index of each note, for proper "date" / dragged sorting (middle option)
-(void)updateAllNotesSlotNumbers {
    for (int i = 0; i<_showNotes.count; i++) {
        Note *note = [_showNotes objectAtIndex:i];
        note.slot = i;
        [_showNotes replaceObjectAtIndex:i withObject:note];
    }
    [self syncNotesListWithMasterNotesList:_showNotes];
}

//update master list to reflect current state of viewed notes
-(void)syncNotesListWithMasterNotesList:(NSMutableArray*)notesList
{
    for(int i = 0; i<notesList.count; i++) {
        Note *curNote = [notesList objectAtIndex:i];
        [_masterNotes removeObjectIdenticalTo:curNote];    //remove each identical object (compare UUIDs) -- does nothing if no copy in master notes
        [_masterNotes addObject:curNote];                   //add updated/new object to master list
        
    }
    //sync master notes with web
}


#pragma mark - view management helpers
//adds temporary length to scrollview so that cells at bottom of screen can be seen above keyboard
-(void) addInsets
{
    CGSize kbSize = CGSizeMake(320, 216);
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.ListView.contentInset = contentInsets;
    self.ListView.scrollIndicatorInsets = contentInsets;
}

//removes said temporary scrollview length
-(void)removeInsets
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.ListView.contentInset = contentInsets;
    self.ListView.scrollIndicatorInsets = contentInsets;
}

//scrolls list back to proper point when keyboard is closed
-(void) scrollToBottom:(NSIndexPath*)indexPath
{
    CGPoint bottom;
    if (indexPath.item == 1 && _showNotes.count==2) {        //special case where only two cells and select second cell
        bottom = CGPointMake(0, self.ListView.contentSize.height - self.ListView.bounds.size.height + 170);
    } else {
        bottom = CGPointMake(0, self.ListView.contentSize.height - self.ListView.bounds.size.height);
    }
    [self.ListView setContentOffset:bottom animated:YES];
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [textView becomeFirstResponder];
    return YES;
}

#pragma mark note helpers
//TODO
-(void)archiveNote:(Note*)note {

    [_showNotes removeObject:note];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:note.slot inSection:0];
//    NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndex:note.slot];
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
    
    if (indexPath.item == 0) {
        [self.ListView reloadData];         //avoid error noted here: http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
    } else {
        [self.ListView deleteItemsAtIndexPaths:indexPaths];
    }
    
    NSLog(@"remaining items in collection view: @%i", _showNotes.count);
    
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
    
    [_showNotes insertObject:note atIndex:0];
    [self updateAllNotesSlotNumbers];
    NSIndexPath *indexPath;
    if (_showNotes.count == 1) {
        [self.ListView reloadData];
        indexPath = [NSIndexPath indexPathForItem:0 inSection:0]; //avoid error noted here: http://stackoverflow.com/questions/12611292/uicollectionview-assertion-failure
    } else {
        indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        NSArray *indexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
        [self.ListView insertItemsAtIndexPaths:indexPaths];
    }
    NoteCell *newCell = (NoteCell*)[self.ListView cellForItemAtIndexPath:indexPath];
    [self editNoteCell: newCell];
}


#pragma mark - noteCell management

-(void)editNoteCell:(NoteCell*)noteCell
{
    
    //flip booleans
    noteCell.noteText.userInteractionEnabled = !noteCell.noteText.userInteractionEnabled;
    noteCell.noteText.editable = !noteCell.noteText.editable;
    
    //    //flip icon
    noteCell.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEditSign];
    
    
    NSIndexPath *indexPath = [self.ListView indexPathForCell:noteCell];
    
    BOOL shouldScroll = (indexPath.item >0 && _showNotes.count>1 && _showNotes.count - indexPath.item <=3);
    
    
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

-(void)readyCellsForEditing:(UICollectionReusableView*)tappedElement curTapIsEdit:(BOOL)curTap {
    for (int i = 0; i<_showNotes.count; i++) {
        NSLog(@"Tapped element type @%@",tappedElement.class);          //why is this being called so many times?
        NSIndexPath *path= [NSIndexPath indexPathForItem:i inSection:0];
        NoteCell *current = (NoteCell*)[self.ListView cellForItemAtIndexPath:path];
        
        if (tappedElement.class == [ListViewHeader class]) {            //if tapped header, close up note as
            if( i!=0) {                                                               //normal, then do what header says
                [current flipEditingState];
            }
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
//            [self endEdit:current shouldScroll:(currentIndexPath.item >0 && _showNotes.count>1 && _showNotes.count - currentIndexPath.item <=3) indexPath:currentIndexPath];
        }//if it's not editable, don't need any teardown
    }
}
    

#pragma mark - LXReorderableCollectionViewDataSource methods

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath willMoveToIndexPath:(NSIndexPath *)toIndexPath {
    
    Note *note = [_showNotes objectAtIndex:fromIndexPath.item];
    [_showNotes removeObjectAtIndex:fromIndexPath.item];
    [_showNotes insertObject:note atIndex:toIndexPath.item];
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
    [self updateAllNotesSlotNumbers];   //update the slots for sorting when an item is dragged to new slot
    NSLog(@"did end drag");
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
