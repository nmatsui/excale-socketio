//
//  ViewController.h
//  excale-socketio
//
//  Created by Matsui Nobuyuki on 12/10/28.
//  Copyright (c) 2012年 TIS Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
