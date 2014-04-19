//
//  DCClockView.h
//  DockClockX
//
//  Created by Brian on 4/16/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DCClockView : NSView

@property (readonly) NSImage *clockImage;
@property (strong) NSTimer *timer;

- (NSTimeInterval)timeInterval;
- (void)startTimer;
- (void)stopTimer;

@end
