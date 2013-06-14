//
//  AppDelegate.m
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+FlatUI.h"
#import "FUIAlertView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"initial_launch"])
    {
        // app already launched
        NSLog(@"not the first time...");
    }
    else {
        //need to make this a first launch date rather than bool
        NSLog(@"there's a first time for everything");
        NSDate *now = [[NSDate alloc]init];
        [[NSUserDefaults standardUserDefaults] setObject:now forKey:@"initial_launch"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        

    }
    return YES;
}


							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"entered_background" object:self];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
 
    
    
    //connection checking method from http://stackoverflow.com/questions/7015644/ios-reachability-not-recognizing-when-host-is-removed/7016594#comment9733939_7016594

    
    //no need for this wifi checker bc not using Parse in this version
    
//    NSError *error = nil;
//    NSStringEncoding encoding = 0;
//    NSURL *url = [[NSURL alloc] initWithString:@"http://www.google.com"];
//    NSString *connected = [[NSString alloc] initWithContentsOfURL:url
//                                                     usedEncoding:&encoding
//                                                            error:&error];
//    
//    wait(2500);
//    if (connected == NULL) {
//        
//        NSLog(@"Not Connected");
//        //Code to show if not connected
//        
//        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"No Connection" message:@"Looks like you don't have an internet connection.\nSparkFile will do its best to save your work, but some data loss may occur." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil ];
//        alertView.titleLabel.textColor = [UIColor midnightBlueColor];
//        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:20];
//        alertView.messageLabel.textColor = [UIColor midnightBlueColor];
//        alertView.messageLabel.font = [UIFont flatFontOfSize:18];
//        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
//        alertView.alertContainer.backgroundColor = [UIColor cloudsColor];
//        alertView.defaultButtonColor = [UIColor alizarinColor];
//        alertView.defaultButtonShadowColor = [UIColor pomegranateColor];
//        
//        [alertView show];
    
        


        
        
//        
//    } else {
//        NSLog(@"Connected Successfully!");
        //Any other code for successful connection
//    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
