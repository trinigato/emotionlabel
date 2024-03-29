//
//  EmotionLabel.m
//  Jacky <newbdez33@gmail.com>
//
//  Created by Jacky on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EmotionLabel.h"

@implementation EmotionLabel

@synthesize orignText = _orignText;
@synthesize text = _text;
@synthesize font = _font;
@synthesize emotionDelegate = _emotionDelegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
    }
    return self;
}

- (void)setText:(NSString *)text {
    
    _orignText = text;
    NSString *replaced;
    NSMutableString *formatedResponse = [NSMutableString string];

    NSScanner *emotionScanner = [NSScanner scannerWithString:text];
    [emotionScanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@""]];
    while ([emotionScanner isAtEnd] == NO) {

        if([emotionScanner scanUpToString:@"[" intoString:&replaced]) {
            [formatedResponse appendString:replaced];
        }
        if(![emotionScanner isAtEnd]) {
            [emotionScanner scanString:@"[" intoString:nil];
            replaced = @"";
            [emotionScanner scanUpToString:@"]" intoString:&replaced];
            NSString *em = [_emotionDelegate getEmotionImageNameByString:replaced];
            if (em) {
                [formatedResponse appendFormat:@"<img src='%@' />", em];
            }else {
                [formatedResponse appendFormat:@"[%@]", replaced];
            }

            [emotionScanner scanString:@"]" intoString:nil];
        }
        
    }
    
    //NSLog(@"formatedResponse: %@", formatedResponse);
    [formatedResponse replaceOccurrencesOfString:@"\n" withString:@"<br />" options:0 range:NSMakeRange(0, formatedResponse.length)];
    NSData *data = [[NSString stringWithFormat:@"<p style='font-size:%fpt'>%@</p>", _font.pointSize-0.5, formatedResponse] dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithCGSize:CGSizeMake(_font.lineHeight, _font.lineHeight)], DTMaxImageSize, @"Helvetica", DTDefaultFontFamily, nil];
    NSAttributedString *string = [[NSAttributedString alloc] initWithHTML:data options:options documentAttributes:NULL];
    self.attributedString = string;

}

@end
