//
//  AlertViewHelper.h
//  SparkFile
//
//  Created by Andrew Melis on 6/14/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlatUIKit.h"
#import "NSString+FontAwesome.h"

@interface AlertViewHelper : NSObject

+(void)showSettings:(UIViewController*)delegate;
+(void)showCredits:(UIViewController*)delegate;
+(void)clearData:(UIViewController*)delegate;
+(void)showHelp:(UICollectionViewController*)delegate;


@end
