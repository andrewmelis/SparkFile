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

//intercept touches to cell
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    //from http://stackoverflow.com/questions/1823317/get-the-current-first-responder-without-using-a-private-api
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];

    BOOL curTap = NO;
    if (touch.view.tag == 30) {
        curTap = YES;
    }
    [self.parentViewController readyCellsForEditing:self curTapIsEdit:curTap];
    
    
    if (touch.view.tag == 20)    //archive button
    {
        //move to archive
        NSLog(@"test archive tag + %d",self.note.archived);
        
        [self flipEditingState];
        [self moveSelfToArchive];
        
    } else if(touch.view.tag == 10)    //color picker
    {
        [self flipEditingState];
        [AlertViewHelper showColorPicker:self.parentViewController note:self.note];
        
    } else if (touch.view.tag == 30)    //edit button
    {
        //open edit modal
        NSLog(@"testing tags -- edit button, going to state: @%i", !self.noteText.editable);
        
        [self.parentViewController editNoteCell:self];
    }

}

//archive self.note -- refactor?
-(void)moveSelfToArchive
{
    self.note.archived = !self.note.archived;
    if (self.note.archived) {
        self.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconCheckSign];
    } else {
        self.archiveIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconSignBlank];
    }
    
    //TODO figure out indexpaths
    
    [self.parentViewController archiveNote:self.note];
    
}

-(void)flipEditingState
{
    //flip booleans
    self.noteText.userInteractionEnabled = NO;
    self.noteText.editable = NO;
    if (self.noteText.editable) {
        self.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEditSign];
    } else {
        self.editIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconEdit];
    }
    self.note.text = self.noteText.text;
}




@end
