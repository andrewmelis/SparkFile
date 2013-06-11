//
//  UICollectionViewCell+FlatUI.h
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (FlatUI)

@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat separatorHeight;

+ (UITableViewCell*) configureFlatCellWithColor:(UIColor *)color selectedColor:(UIColor *)selectedColor style:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier;

- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setSeparatorHeight:(CGFloat)separatorHeight;

@end
