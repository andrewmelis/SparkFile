//
//  ListViewHeader.h
//  SparkFile
//
//  Created by Andrew Melis on 6/12/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "UINavigationBar+FlatUI.h"
#import "UIBarButtonItem+FlatUI.h"

@interface ListViewHeader : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *createNoteIcon;
@property (weak, nonatomic) IBOutlet UILabel *systemSettingsIcon;
@property (weak, nonatomic) IBOutlet UILabel *colorSortIcon;
@property (weak, nonatomic) IBOutlet UILabel *dateSortIcon;
@property (weak, nonatomic) IBOutlet UILabel *archiveIcon;

@end
