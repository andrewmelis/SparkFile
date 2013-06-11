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
    _allNotes = [[NSMutableArray alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    Note *note = [[Note alloc] init];
    note.linkedAbove = false;
    note.linkedBelow = false;
    note.text = @"this is my first note";
    note.color = [UIColor emerlandColor];
    [_allNotes addObject:note];
    
    Note *note2 = [[Note alloc] init];
    note2.linkedAbove = false;
    note2.linkedBelow = false;
    note2.text = @"this is my second note";
    note2.color = [UIColor greenSeaColor];
    [_allNotes addObject:note2];
    
    Note *note3 = [[Note alloc] init];
    note3.linkedAbove = false;
    note3.linkedBelow = false;
    note3.text = @"this is my third note";
    note3.color = [UIColor pumpkinColor];
    [_allNotes addObject:note3];
    NSLog(@"stop");
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NoteCell";
    
    
    
    NoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if ([_allNotes objectAtIndex:indexPath.item]) {
        
        Note *note = [_allNotes objectAtIndex:indexPath.item];
        
        [[cell noteText] setText:note.text];
        [[cell noteText] setBackgroundColor:note.color];
        cell.backgroundColor = note.color;
    }
    
    
    cell.layer.cornerRadius=10;         //make it pretty
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






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
