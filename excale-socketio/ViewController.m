//
//  ViewController.m
//  excale-socketio
//
//  Created by Matsui Nobuyuki(nobuyuki.matsui@gmail.com) on 12/10/28.
//  Copyright (c) 2012年 TIS Inc. All rights reserved.
//  Distributed under the MIT License http://rem.mit-license.org
//

#import "ViewController.h"
#import "AZSocketIO.h"

#define SOCKETIO_HOST @"niconicoar.excale.net"
//#define SOCKETIO_HOST @"niconicoar.heroku.com"
#define SOCKETIO_PORT @"80"
#define BROADCAST_EVENT @"broadcast"
#define SEND_EVENT @"message"

@interface ViewController ()
- (void)setUpSocketIO;
- (void)receiveMessage:(NSString *)message;
- (void)sendMessage:(NSString *)message;
@end

@implementation ViewController {
    __strong AZSocketIO *_socketIO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.inputField.returnKeyType = UIReturnKeySend;
    self.inputField.delegate = self;
    self.textView.text = @"";
    [self setUpSocketIO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextView:nil];
    [self setInputField:nil];
    [super viewDidUnload];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn:");
    [self sendMessage:self.inputField.text];
    self.inputField.text = @"";
    [self.inputField resignFirstResponder];
    return YES;
}

#pragma mark - private method
- (void)setUpSocketIO
{
    NSLog(@"setUpSocketIO");
    _socketIO = [[AZSocketIO alloc] initWithHost:SOCKETIO_HOST andPort:nil secure:NO];
    _socketIO.transports = [NSMutableSet setWithObject:@"xhr-polling"];
    __block ViewController *blockSelf = self;
    [_socketIO setEventRecievedBlock:^(NSString *eventName, id data){
        if ([eventName isEqualToString:BROADCAST_EVENT]) {
            [blockSelf receiveMessage:[data objectAtIndex:0]];
        }
    }];
    [_socketIO connectWithSuccess:^{
        NSLog(@"connection success");
    } andFailure:^(NSError *error){
        NSLog(@"connection fail:%@", [error description]);
    }];
}

- (void)receiveMessage:(NSString *)message
{
    NSLog(@"received message:%@", message);
    self.textView.text = [self.textView.text stringByAppendingFormat:@"\n%@", message];
}

- (void)sendMessage:(NSString *)message
{
    NSLog(@"send message:%@", message);
    NSError *error;
    NSArray *args = [NSArray arrayWithObject:message];
    [_socketIO emit:SEND_EVENT args:args error:&error];
    if (error) {
        NSLog(@"send message fail:%@", [error description]);
    }
}
@end
