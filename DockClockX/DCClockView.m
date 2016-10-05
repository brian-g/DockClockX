//
//  DCClockView.m
//  DockClockX
//
//  Created by Brian Glaeske on 4/16/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import "DCClockView.h"

@implementation DCClockView

- (void)startTimer {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:[self timeInterval] target:[NSApp dockTile] selector:@selector(display) userInfo:nil repeats:YES];
    [self.timer setTolerance:.25];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (NSTimeInterval)timeInterval {
    return 60;  // 1 minute by default
}

- (void)stopTimer {
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
