//
//  DCBlackClockView.m
//  DockClockX
//
//  Created by Brian on 4/23/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import "DCBlackClockView.h"

#define RADIUS 5
#define SECONDHANDCOUNTER 10

@implementation DCBlackClockView

NSImage __strong *_clockImage;
NSBezierPath __strong *_secondHand;
NSBezierPath __strong *_minuteHand;
NSBezierPath __strong *_hourHand;
NSAffineTransform __strong *_transform;
NSShadow __strong *_shadow;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    BOOL showSeconds = YES;
    
    NSDate *d = [NSDate date];
    CGFloat s = ([d second] * 6);
    CGFloat m = ([d minute] * 6);
    CGFloat h = ([d hour] % 12) * 30 + m / 12;
    NSAffineTransform *pathTransform = nil;
    
    if (_clockImage == nil) {
        _clockImage = [NSImage imageNamed:@"BlackClock.png"];
    }
    
    if (_transform == nil) {
        _transform = [NSAffineTransform transform];
        [_transform translateXBy:[self frame].size.width / 2 yBy:[self frame].size.height / 2];
    }

    if (_hourHand == nil) {
        NSPoint pnt = { 0, ([self frame].size.height / 4) };
        
        [NSBezierPath setDefaultLineJoinStyle:NSRoundLineJoinStyle];
        [NSBezierPath setDefaultLineCapStyle:NSRoundLineCapStyle];
        [NSBezierPath setDefaultLineWidth:0.0];
        
        _hourHand = [NSBezierPath bezierPath];
        [_hourHand moveToPoint:pnt];
        [_hourHand appendBezierPathWithArcWithCenter:NSZeroPoint radius:RADIUS startAngle:175 endAngle:5];
        [_hourHand closePath];
    }
    
    if (_minuteHand == nil) {
        NSPoint pnt = { 0, ([self frame].size.height / 2) - 10 };
        
        _minuteHand = [NSBezierPath bezierPath];
        [_minuteHand moveToPoint:pnt];
        [_minuteHand appendBezierPathWithArcWithCenter:NSZeroPoint radius:RADIUS startAngle:175 endAngle:5];
        [_minuteHand closePath];
    }
    
    if (showSeconds == YES && _secondHand == nil) {
        _secondHand = [NSBezierPath bezierPath];
        [_secondHand moveToPoint:NSMakePoint(0,-SECONDHANDCOUNTER)];
        [_secondHand appendBezierPathWithArcWithCenter:NSZeroPoint radius:(RADIUS / 1.5) startAngle:-90 endAngle:90];
        [_secondHand lineToPoint:NSMakePoint(0, [self frame].size.height / 2 - 10)];
        [_secondHand appendBezierPathWithArcWithCenter:NSZeroPoint radius:(RADIUS / 1.5) startAngle:90 endAngle:-90];
        [_secondHand lineToPoint:NSMakePoint(0, -SECONDHANDCOUNTER)];
        [_secondHand closePath];
    }
    
    [super drawRect:dirtyRect];
    
    NSPoint p = { 0, 0 };

    [_clockImage drawAtPoint:p fromRect:NSZeroRect operation:NSCompositeCopy fraction:1];
    
    [_transform concat];

    [[NSColor blackColor] set];
    
    // Draw hour hand
    pathTransform = [NSAffineTransform transform];
    [pathTransform rotateByDegrees:-h];
    [[pathTransform transformBezierPath:_hourHand] fill];

    // Draw minute hand
    pathTransform = [NSAffineTransform transform];
    [pathTransform rotateByDegrees:-m];
    [[pathTransform transformBezierPath:_minuteHand] fill];

    // Draw second hand
    if (showSeconds == YES) {
        [[NSColor redColor] set];
        
        pathTransform = [NSAffineTransform transform];
        [pathTransform rotateByDegrees:-s];
        NSBezierPath *_s1 = [pathTransform transformBezierPath:_secondHand];
        [_s1 fill];
        [_s1 stroke];
    }
}

- (NSTimeInterval)timeInterval {
    return 1;
}

@end
