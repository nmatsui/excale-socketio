//
//  ViewController.h
//  excale-socketio
//
//  Created by Matsui Nobuyuki(nobuyuki.matsui@gmail.com) on 12/10/28.
//  Copyright (c) 2012年 TIS Inc. All rights reserved.
//  Distributed under the MIT License http://rem.mit-license.org

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
