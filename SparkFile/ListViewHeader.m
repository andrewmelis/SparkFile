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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if(touch.view.tag == 100)    //cogs -- system settings
    {
        NSLog(@"testing tags -- settings button");
        
    } else if (touch.view.tag == 90)    //archive button
    {
        NSLog(@"testing tags -- color sort button");
        self.archiveIcon.textColor = [UIColor silverColor];
        self.dateSortIcon.textColor = [UIColor silverColor];
        self.colorSortIcon.textColor = [UIColor midnightBlueColor];
        
        //move to archive
//        NSLog(@"test archive tag + %d",self.note.archived);
//        [self.parentViewController.ListView reloadData];
        
    }
    else if (touch.view.tag == 80)
    {
        NSLog(@"testing tags -- date sort button");
        self.colorSortIcon.textColor = [UIColor silverColor];
        self.archiveIcon.textColor = [UIColor silverColor];
        self.dateSortIcon.textColor = [UIColor midnightBlueColor];
        
    }
    else if (touch.view.tag == 70)
    {
        NSLog(@"testing tags -- archive button");
        self.dateSortIcon.textColor = [UIColor silverColor];
        self.colorSortIcon.textColor = [UIColor silverColor];
        self.archiveIcon.textColor = [UIColor midnightBlueColor];
    }
    else if (touch.view.tag == 60)
    {
        NSLog(@"testing tags -- create note button");
    }
    
    
    
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
