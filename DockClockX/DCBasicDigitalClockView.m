//
//  DCBasicDigitalClockView.m
//  DockClockX
//
//  Created by Brian on 4/17/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import "DCBasicDigitalClockView.h"
#import "NSFont_Additions.h"
#import "NSColor+ColorExtentions.h"
#import "NSDate+Additions.h"

NSFont *_ledFont;
NSDictionary *_strAttr;

@implementation DCBasicDigitalClockView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSURL *ledFontFile = [[NSBundle mainBundle] URLForResource:@"LED" withExtension:@"ttf"];
        [NSFont activateFontFromFile:ledFontFile];
        _ledFont = [NSFont fontWithName:@"LED" size:48];
        _strAttr = [NSDictionary dictionaryWithObjectsAndKeys:[NSColor colorFromHexString:@"#63F8B8"], NSForegroundColorAttributeName, _ledFont, NSFontAttributeName, nil];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSString *time;
    NSPoint p = { 0 , 0 };
    NSDate *d = [NSDate date];
    
    time = [NSString stringWithFormat:@"%2d %.2d", [d hour], [d minute]];
    [super drawRect:dirtyRect];

    [_ledFont set];
    [time drawAtPoint:p withAttributes:_strAttr];
}

- (NSTimeInterval)timeInterval {
    return 1.0;
}

@end
