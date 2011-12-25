//
//  ViewController.h
//  demo
//
//  Created by Jacky on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmotionLabel.h"

@interface ViewController : UIViewController {
    IBOutlet EmotionLabel *emotionLabel;
    IBOutlet UITextField *textField;
}

- (IBAction)onButtonTapped:(id)sender;

@end
