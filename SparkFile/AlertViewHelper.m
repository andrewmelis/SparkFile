//
//  AlertViewHelper.m
//  SparkFile
//
//  Created by Andrew Melis on 6/14/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "AlertViewHelper.h"

@implementation AlertViewHelper

+(void)showSettings:(UIViewController*)delegate{
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Settings" message:@"" delegate:delegate cancelButtonTitle:@"Ok" otherButtonTitles:@"Help", @"Clear Data", @"Credits", nil];
    
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
+(void)showCredits:(UIViewController*)delegate{
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Credits" message:@"Developer:\nAndrew Melis\n\nProfessor:\nT. Andrew Binkowski\n \nTA:\nJonathan Ozik\n\nSpecial Thanks:\n Claudia Hernandez" delegate:delegate cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
    alertView.titleLabel.textColor = [UIColor midnightBlueColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    alertView.messageLabel.textColor = [UIColor midnightBlueColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:18];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor cloudsColor];
    alertView.defaultButtonColor = [UIColor alizarinColor];
    alertView.defaultButtonShadowColor = [UIColor pomegranateColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:18];
    alertView.defaultButtonTitleColor = [UIColor cloudsColor];
    
    [alertView setButtonColorsAtIndex:0 color:[UIColor peterRiverColor] shadowColor:[UIColor belizeHoleColor]];
    
    //    alertView.tag = ;
    [alertView show];
}
+(void)clearData:(UIViewController*)delegate{
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Are you sure?" message:@"This will really delete ALL of your notes" delegate:delegate cancelButtonTitle:@"No Way" otherButtonTitles:@"Yeah, I'm Serious", nil];
    
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
    
    [alertView setButtonColorsAtIndex:0 color:[UIColor alizarinColor] shadowColor:[UIColor pomegranateColor]];
    [alertView setButtonColorsAtIndex:1 color:[UIColor wetAsphaltColor] shadowColor:[UIColor midnightBlueColor]];
    
    alertView.tag = 66;
    [alertView show];
    
}

+(void)showHelp:(UICollectionViewController*)delegate
{
    NSString *archive1 = [NSString fontAwesomeIconStringForEnum:FAIconCheckSign];
    NSString *archive2 = [NSString fontAwesomeIconStringForEnum:FAIconSignBlank];
    NSString *colorPicker = [NSString fontAwesomeIconStringForEnum:FAIconAdjust];
    NSString *edit1 = [NSString fontAwesomeIconStringForEnum:FAIconEdit];
    NSString *edit2 = [NSString fontAwesomeIconStringForEnum:FAIconEditSign];

    NSString *settings = [NSString fontAwesomeIconStringForEnum:FAIconCog];
    NSString *colorSort = [NSString fontAwesomeIconStringForEnum:FAIconCircleBlank];
    
    NSString *freeFlow = [NSString fontAwesomeIconStringForEnum:FAIconReorder];
    
    NSString *archiveView = [NSString fontAwesomeIconStringForEnum:FAIconOkCircle];
    
    NSString *newNote = [NSString fontAwesomeIconStringForEnum:FAIconPlusSign];

    NSString *message = [NSString stringWithFormat:@"%@ %@ un/archive a note\n%@ color-code a note\n%@%@ edit/save a note\n\n%@ show the settings\n%@ sort notes by color\n%@ free-flow mode\n%@ view archive\n%@ create a new note\n\nDon't forget to\ndrag and drop your notes!",archive1, archive2, colorPicker, edit1, edit2, settings, colorSort, freeFlow, archiveView, newNote, nil];
    
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Settings" message:message delegate:delegate cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//    
    alertView.titleLabel.textColor = [UIColor midnightBlueColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    alertView.messageLabel.textColor = [UIColor midnightBlueColor];
    alertView.messageLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor cloudsColor];
    alertView.defaultButtonColor = [UIColor alizarinColor];
    alertView.defaultButtonShadowColor = [UIColor pomegranateColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:18];
    alertView.defaultButtonTitleColor = [UIColor cloudsColor];
//
//    [alertView setButtonColorsAtIndex:0 color:[UIColor emerlandColor] shadowColor:[UIColor nephritisColor]];
//    [alertView setButtonColorsAtIndex:1 color:[UIColor alizarinColor] shadowColor:[UIColor pomegranateColor]];
//    [alertView setButtonColorsAtIndex:2 color:[UIColor peterRiverColor] shadowColor:[UIColor belizeHoleColor]];
//    [alertView setButtonColorsAtIndex:3 color:[UIColor wetAsphaltColor] shadowColor:[UIColor midnightBlueColor]];
    
    alertView.tag = 77;
    [alertView show];
}


@end
