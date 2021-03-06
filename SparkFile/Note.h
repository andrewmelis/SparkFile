//
//  Note.h
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlatUIKit.h"

@interface Note : NSObject <NSCoding>

@property (strong, nonatomic) NSString *uuid;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) NSInteger slot;
@property (strong, nonatomic) UIColor *color;
@property (assign, nonatomic) BOOL archived;

- (NSComparisonResult)colorCompare:(Note *)otherObject;
- (NSComparisonResult)indexCompare:(Note *)otherObject;
-(BOOL)isEqual:(id)object;

-(void)saveNoteToParse:(Note*)offNote;

#pragma mark NSCoding methods
-(id)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

@end
