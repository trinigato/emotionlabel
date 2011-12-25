//
//  ViewController.m
//  demo
//
//  Created by Jacky on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    emotionLabel = [[EmotionLabel alloc] init];
    emotionLabel.backgroundColor = [UIColor clearColor];
    emotionLabel.text = @"test";
    emotionLabel.frame = CGRectMake(0, 0, 200, 20);
    [self.view addSubview:emotionLabel];
}

#pragma mark - Actions
- (IBAction)onButtonTapped:(id)sender {
    emotionLabel.text = textField.text;
}

@end
