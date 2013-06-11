//
//  ViewController.m
//  SparkFile
//
//  Created by Andrew Melis on 6/10/13.
//  Copyright (c) 2013 Baller Status Inc. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "FlatUIKit.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myButton = _myButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar2" forKey:@"foo"];
    testObject.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [testObject saveInBackground];
    
    _myButton.buttonColor = [UIColor turquoiseColor];
    _myButton.shadowColor = [UIColor greenSeaColor];
    _myButton.shadowHeight = 3.0f;
    _myButton.cornerRadius = 6.0f;
    _myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [_myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [_myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
