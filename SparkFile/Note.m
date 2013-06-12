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


@end
