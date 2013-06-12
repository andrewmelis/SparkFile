//
//  Note.m
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize text;
@synthesize slot;
@synthesize color;
@synthesize archived;

- (NSComparisonResult)colorCompare:(Note *)otherObject {
    
    NSMutableArray *prefs = [[NSMutableArray alloc] initWithObjects:
                                        [UIColor alizarinColor],
                                        [UIColor sunflowerColor],
                                        [UIColor emerlandColor],
                                        [UIColor peterRiverColor],
                                        [UIColor amethystColor],
                                        [UIColor midnightBlueColor],
                                        nil];
    return [prefs indexOfObject:self.color] - [prefs indexOfObject:otherObject.color];
}

- (NSComparisonResult)indexCompare:(Note *)otherObject {
    
    return  otherObject.slot - self.slot;
    
}


-(void)saveNoteToParse:(Note*)offNote
{
    PFObject *note = [PFObject objectWithClassName:@"Note"];
    [note setObject:offNote.uuid forKey:@"uniqueid"];
    [note setObject:offNote.text forKey:@"text"];
    [note setObject:[NSNumber numberWithInt:offNote.slot] forKey:@"slot"];
    
    CGFloat red;
    CGFloat green;     //not allowed to send UIColor to Parse
    CGFloat blue;
    CGFloat alpha;
    [offNote.color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    [note setObject:[NSNumber numberWithFloat:red] forKey:@"red"];
    [note setObject:[NSNumber numberWithFloat:green] forKey:@"green"];
    [note setObject:[NSNumber numberWithFloat:blue] forKey:@"blue"];
    [note setObject:[NSNumber numberWithFloat:alpha] forKey:@"alpha"];
    
    [note setObject:[NSNumber numberWithBool:offNote.archived] forKey:@"archived"];
    
    [note saveInBackground];
    
//    offNote.uuid = note.objectId;
//    NSLog(@"@%@",offNote.uuid);
    
    
}


@end
