//
//  Note.m
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize uuid = _uuid;
@synthesize text = _text;
@synthesize slot = _slot;
@synthesize color = _color;
@synthesize archived = _archived;


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _uuid = [aDecoder decodeObjectForKey:@"uuid"];
        _text = [aDecoder decodeObjectForKey:@"text"];
        _slot = [aDecoder decodeIntegerForKey:@"slot"];
        _color = [aDecoder decodeObjectForKey:@"color"];
        _archived = [aDecoder decodeBoolForKey:@"archived"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:_archived forKey:@"archived"];
    [aCoder encodeObject:_uuid forKey:@"uuid"];
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeObject:_text forKey:@"text"];
    [aCoder encodeInteger:_slot forKey:@"slot"];
}

- (NSComparisonResult)colorCompare:(Note *)otherObject {
    
    //move these prefs to NSUserDefaults?
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
    return  self.slot - otherObject.slot;
}

//compare by UUID
-(BOOL)isEqual:(id)object
{
    if([object isKindOfClass:self.class]) {
        Note *other = object;
        if([_uuid isEqualToString:other.uuid]) {
            return TRUE;
        }
    }
    return FALSE;
}

//not going to use this right now?

//-(void)saveNoteToParse:(Note*)offNote;
//{
//    PFObject *note = [PFObject objectWithClassName:@"Note"];
//    [note setObject:offNote.uuid forKey:@"uniqueid"];
//    [note setObject:offNote.text forKey:@"text"];
//    [note setObject:[NSNumber numberWithInt:offNote.slot] forKey:@"slot"];
//    
//    CGFloat red;
//    CGFloat green;     //not allowed to send UIColor to Parse
//    CGFloat blue;
//    CGFloat alpha;
//    [offNote.color getRed:&red green:&green blue:&blue alpha:&alpha];
//    
//    [note setObject:[NSNumber numberWithFloat:red] forKey:@"red"];
//    [note setObject:[NSNumber numberWithFloat:green] forKey:@"green"];
//    [note setObject:[NSNumber numberWithFloat:blue] forKey:@"blue"];
//    [note setObject:[NSNumber numberWithFloat:alpha] forKey:@"alpha"];
//    
//    [note setObject:[NSNumber numberWithBool:offNote.archived] forKey:@"archived"];
//    
//    [note saveInBackground];
//    
////    offNote.uuid = note.objectId;
////    NSLog(@"@%@",offNote.uuid);

    
//}


@end
