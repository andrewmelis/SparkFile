//
//  Note.h
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlatUIKit.h"

@interface Note : NSObject

@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) NSInteger slot;
@property (assign, nonatomic) BOOL linkedAbove;
@property (assign, nonatomic) BOOL linkedBelow;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSDate *dateAdded;
@property (strong, nonatomic) NSDate *dateModified;
@property (assign, nonatomic) BOOL archived;


@end
