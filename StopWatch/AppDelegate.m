//
//  AppDelegate.m
//  StopWatch
//
//  Created by Nikhil Gupta on 07/02/14.
//  Copyright (c) 2014 Nikhil Gupta. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // on app start, we want to show the stop button as disabled.
    [self.pauseButton setEnabled:NO];
}

- (IBAction)start:(id)sender {
    // when start is clicked, we start our watch.
    [self startTimer :0.0];
    
    // and, disable the start button.
    [self.startButton setEnabled:NO];
    [self.startButton setTitle:@"Restart"];
    
    // and, enable the pause/resume button.
    [self.pauseButton setEnabled:YES];
    
    // and, make sure that that button says 'Pause'
    [self.pauseButton setNextState];
    [self.pauseButton setKeyEquivalent:@"\r"];
    // space bar should not fire any button
    [self.window makeFirstResponder:nil];
}

- (IBAction)pauseOrResume:(id)sender {
    if (self.timer) {
        // when the user clicks stop, we stop the watch
        [self.timer invalidate];
        self.timer = nil;
        // and, enable the start button.
        [self.startButton setEnabled:YES];
        // make start button as the first responder
        [self.window makeFirstResponder:self.startButton];
    } else {
        // when the user clicks resume, we resume the watch
        [self startTimer :[self.labelField doubleValue]];
        // and, disable the start button.
        [self.startButton setEnabled:NO];
        // make start button as the first responder
        [self.window makeFirstResponder:nil];
    }
}

- (void)startTimer:(double)withValue {
    self.time = withValue;
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    }
}
- (void)updateTimer:(id)userInfo {
    self.time = self.time + 0.1;
    NSString *strFromTime = [NSString stringWithFormat:@"%0.1f", self.time];
    [ self.labelField setStringValue:(strFromTime) ];
}

@end
