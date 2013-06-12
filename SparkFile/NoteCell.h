    //
//  NoteCell.h
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "ListViewController.h"
@class ListViewController;

@interface NoteCell : UICollectionViewCell

@property (weak) ListViewController *parentViewController;
@property (strong, nonatomic) Note *note;
@property (weak, nonatomic) IBOutlet UITextView *noteText;
@property (weak, nonatomic) IBOutlet UILabel *archiveIcon;
@property (weak, nonatomic) IBOutlet UILabel *colorChooserIcon;
@property (weak, nonatomic) IBOutlet UILabel *editIcon;


-(void)showColorPicker;
-(void)moveSelfToArchive;
@end
