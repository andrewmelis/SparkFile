//
//  ListViewHeader.m
//  SparkFile
//
//  Created by Andrew Melis on 6/12/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "ListViewHeader.h"

@implementation ListViewHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//intercept touches on header
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [self.parentViewController readyCellsForEditing:self curTapIsEdit:NO];
    
    if(touch.view.tag == 100)    //cog -- system settings
    {
        NSLog(@"touching tags -- settings button");
        [AlertViewHelper showSettings:self.parentViewController];
        
    } else if (touch.view.tag == 90) //color sort button
    {
        NSLog(@"touching tags -- color sort button");

        self.archiveIcon.textColor = [UIColor silverColor];
        self.dateSortIcon.textColor = [UIColor silverColor];
        self.colorSortIcon.textColor = [UIColor midnightBlueColor];
        
        BOOL noArchived = FALSE;
        [self.parentViewController swapLists:noArchived];
        [self.parentViewController colorSortAllNotes];
        
    }
    else if (touch.view.tag == 80) //date sort button
    {
        NSLog(@"touching tags -- date sort button");


        self.colorSortIcon.textColor = [UIColor silverColor];
        self.archiveIcon.textColor = [UIColor silverColor];
        self.dateSortIcon.textColor = [UIColor midnightBlueColor];
        
        BOOL noArchived = FALSE;
        [self.parentViewController swapLists:noArchived];
        [self.parentViewController indexSortAllNotes];
        
    }
    else if (touch.view.tag == 70) //archive button
    {
        NSLog(@"touching tags -- archive button");
        
        self.dateSortIcon.textColor = [UIColor silverColor];
        self.colorSortIcon.textColor = [UIColor silverColor];
        self.archiveIcon.textColor = [UIColor midnightBlueColor];

        BOOL yesArchived = TRUE;
        [self.parentViewController swapLists:yesArchived];
    }
    else if (touch.view.tag == 60)  //create note button
    {
        NSLog(@"touching tags -- create note button");
        [self.parentViewController createNote];
    }
}


-(void)showSettings
{
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Settings" message:@"" delegate:self.parentViewController cancelButtonTitle:@"Ok" otherButtonTitles:@"Help", @"Clear Data", @"Credits", nil];
    
    alertView.titleLabel.textColor = [UIColor midnightBlueColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    alertView.messageLabel.textColor = [UIColor midnightBlueColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:0];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor cloudsColor];
    alertView.defaultButtonColor = [UIColor alizarinColor];
    alertView.defaultButtonShadowColor = [UIColor pomegranateColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:18];
    alertView.defaultButtonTitleColor = [UIColor cloudsColor];
    
    [alertView setButtonColorsAtIndex:0 color:[UIColor emerlandColor] shadowColor:[UIColor nephritisColor]];
    [alertView setButtonColorsAtIndex:1 color:[UIColor alizarinColor] shadowColor:[UIColor pomegranateColor]];
    [alertView setButtonColorsAtIndex:2 color:[UIColor peterRiverColor] shadowColor:[UIColor belizeHoleColor]];
    [alertView setButtonColorsAtIndex:3 color:[UIColor wetAsphaltColor] shadowColor:[UIColor midnightBlueColor]];
    
    alertView.tag = 55;
    [alertView show];
}
-(void)wipeUserData
{
    //another alert view
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

@end
