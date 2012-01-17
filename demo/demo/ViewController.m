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
    emotionLabel.emotionDelegate = self;
    emotionLabel.backgroundColor = [UIColor clearColor];
    emotionLabel.text = @"test";
    emotionLabel.frame = CGRectMake(0, 0, 200, 20);
    [self.view addSubview:emotionLabel];
}

#pragma mark - Actions
- (IBAction)onButtonTapped:(id)sender {
    emotionLabel.text = textField.text;
}

#pragma mark - EmotionLabel Delegate
- (NSString *)getEmotionImageNameByString:(NSString *)key {
    if ([key isEqualToString:@"ok"]) {
        return @"ok.png";
    }
    if ([key isEqualToString:@"good"]) {
        return @"good.png";
    }
    if ([key isEqualToString:@"pig"]) {
        return @"pig.png";
    }
    return @"";
}

@end
