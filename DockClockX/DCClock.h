//
//  DCClock.h
//  DockClockX
//
//  Created by Brian on 4/24/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DCClock <DCClockView>

@property (readonly) NSImage *clockImage;

- (NSTimeInterval)timeInterval;
- (void)startTimer;
- (void)stopTimer;

@end
