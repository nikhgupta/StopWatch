//
//  AppDelegate.h
//  StopWatch
//
//  Created by Nikhil Gupta on 07/02/14.
//  Copyright (c) 2014 Nikhil Gupta. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property double time;
@property (strong, nonatomic) NSTimer *timer;
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *labelField;
@property (weak) IBOutlet NSButton *pauseButton;
@property (weak) IBOutlet NSButton *startButton;

- (IBAction)start:(id)sender;
- (IBAction)pauseOrResume:(id)sender;

@end