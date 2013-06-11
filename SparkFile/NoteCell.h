//
//  NoteCell.h
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NoteCell : UICollectionViewCell


@property (strong, nonatomic) Note *note;
@property (weak, nonatomic) IBOutlet UITextView *noteText;

@end