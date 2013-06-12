//
//  NoteCell.m
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "NoteCell.h"
#import "ListViewController.h"
#import "NSString+FontAwesome.h"


@implementation NoteCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }

    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if(touch.view.tag == 10)    //cogs -- color picker
    {
        [self showColorPicker];

    } else if (touch.view.tag == 20)    //archive button
    {
        //move to archive
        NSLog(@"test archive tag + %d",self.note.archived);
        
        [self moveSelfToArchive];
        
        
        
    
    }
        else if (touch.view.tag == 30)
    {
        //open edit modal
        NSLog(@"testing tags -- edit button");
    }

}

-(void)moveSelfToArchive
{
    self.note.archived = !self.note.archived;
    if (self.note.archived) {
        self.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconCheckSign];
    } else {
        self.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconSignBlank];
    }
    
    //TODO figure out indexpaths
    
//    [self.parentViewController archiveNote:self.note];
    
}

-(void)showColorPicker
{
    //show color picker
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Color-Code" message:@"Choose a color for this note:" delegate:self.parentViewController cancelButtonTitle:@"" otherButtonTitles:@"", @"",@"",@"",@"", nil ];
    alertView.titleLabel.textColor = [UIColor midnightBlueColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    alertView.messageLabel.textColor = [UIColor midnightBlueColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:18];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor cloudsColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    
    [alertView setButtonColorsAtIndex:0 color:[UIColor alizarinColor] shadowColor:[UIColor pomegranateColor]];
    [alertView setButtonColorsAtIndex:1 color:[UIColor sunflowerColor] shadowColor:[UIColor colorFromHexCode:@"f39c12"]];
    [alertView setButtonColorsAtIndex:2 color:[UIColor emerlandColor] shadowColor:[UIColor nephritisColor]];
    [alertView setButtonColorsAtIndex:3 color:[UIColor peterRiverColor] shadowColor:[UIColor belizeHoleColor]];
    [alertView setButtonColorsAtIndex:4 color:[UIColor amethystColor] shadowColor:[UIColor wisteriaColor]];
    [alertView setButtonColorsAtIndex:5 color:[UIColor wetAsphaltColor] shadowColor:[UIColor midnightBlueColor]];
    
    NSLog(@"why is note null? @%@",self.note);
    alertView.note = self.note;
    [alertView show];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
