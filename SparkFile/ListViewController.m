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
#import <QuartzCore/QuartzCore.h>

@interface ListViewController ()

@end

@implementation ListViewController

//@synthesize allNotes;


- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.ListView.delegate = self;
    self.ListView.dataSource = self;
    
    _allNotes = [[NSMutableArray alloc] init];
    
    Note *note = [[Note alloc] init];
    note.linkedAbove = false;
    note.text = @"this is my first note";
    note.color = [UIColor emerlandColor];
    [_allNotes addObject:note];
    
    Note *note2 = [[Note alloc] init];
    note2.linkedAbove = false;
    note2.text = @"this is my second note";
    note2.color = [UIColor greenSeaColor];
    [_allNotes addObject:note2];
    
    Note *note3 = [[Note alloc] init];
    note3.linkedAbove = false;
    note3.text = @"this is my third note";
    note3.color = [UIColor pumpkinColor];
    [_allNotes addObject:note3];
    
    Note *note4 = [[Note alloc] init];
    note4.linkedAbove = false;
    note4.text = @"this is my fourth note";
    note4.color = [UIColor midnightBlueColor];
    [_allNotes addObject:note4];
    
    Note *note5 = [[Note alloc] init];
    note5.linkedAbove = true;
    note5.text = @"this is my fifth note";
    note5.color = [UIColor nephritisColor];
    [_allNotes addObject:note5];
    
    Note *note6 = [[Note alloc] init];
    note6.linkedAbove = false;
    note6.text = @"this is my sixth note";
    note6.color = [UIColor sunflowerColor];
    [_allNotes addObject:note6];
    
    NSLog(@"stop");
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self scrollToBottom];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NoteCell";
    if ([collectionView.indexPathsForSelectedItems containsObject:indexPath]) {
        [collectionView selectItemAtIndexPath:indexPath animated:FALSE scrollPosition:UICollectionViewScrollPositionNone];
        // Select Cell
    }
    
    NoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if ([_allNotes objectAtIndex:indexPath.item]) {
        
        Note *note = [_allNotes objectAtIndex:indexPath.item];
        
        [[cell noteText] setText:note.text];
        [[cell noteText] setBackgroundColor:[UIColor clearColor]];
        [[cell noteText] setFont:[UIFont boldFlatFontOfSize:16]];
        cell.backgroundColor = note.color;
    }
    
    
    cell.layer.cornerRadius=5;         //make it pretty
    return cell;
    
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
-(void)col

//sets header for linked cells to zero
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    Note *note = [_allNotes objectAtIndex:section];
//    
//    if(note != Nil) {
//        if (note.linkedAbove) {
//            return CGSizeMake(50, -50); //set this to be smaller?
//        }
//    }
//    return CGSizeMake(50, 50);
//}

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
    NSLog(@"did end drag");
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected cell at @%d",indexPath.section);
    [self.ListView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionTop];      //really want to open modal view with cell and keyboard
    [self.ListView deselectItemAtIndexPath:indexPath animated:YES];
}

//Scrolls to bottom of scroller
//http://stackoverflow.com/questions/14760496/uicollectionview-automatically-scroll-to-bottom-when-screen-loads
-(void)scrollToBottom
{
    CGPoint bottomOffset = CGPointMake(0, self.ListView.contentSize.height - self.ListView.bounds.size.height);
    [self.ListView setContentOffset:bottomOffset animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
