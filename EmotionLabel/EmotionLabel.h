//
//  EmotionLabel.h
//  Jacky <newbdez33@gmail.com>
//
//  Created by Jacky on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextContentView.h"

#ifndef __IPHONE_5_0
#define __IPHONE_5_0 50000
#endif

@class EmotionLabel;
@protocol EmotionLabelDelegate <NSObject>
@optional
- (NSString *)getEmotionImageNameByString:(NSString *)key;
@end

@interface EmotionLabel : DTAttributedTextContentView

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
@property (nonatomic ,weak) id<EmotionLabelDelegate> emotionDelegate;
#else
@property (nonatomic ,assign) id<EmotionLabelDelegate> emotionDelegate;
#endif
@property (nonatomic ,strong) NSString *text;
@property (nonatomic ,strong) NSString *orignText;
@property (nonatomic ,strong) UIFont *font;

@end
