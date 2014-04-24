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

#define LEDCOLOR @"63f8b8"
#define LEDFONT @"LED"
#define BOXPADDING 10

NSFont __strong *_ledFont;
NSFont __strong *_ampmFont;

NSDictionary __strong *_strAttr;
NSDictionary __strong *_ampmAttr;

NSDateFormatter __strong *_formatter;

@implementation DCBasicDigitalClockView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSURL *ledFontFile = [[NSBundle mainBundle] URLForResource:@"LED" withExtension:@"ttf"];
        [NSFont activateFontFromFile:ledFontFile];
        _ledFont = [NSFont fontWithName:LEDFONT size:48];
        _strAttr = [NSDictionary dictionaryWithObjectsAndKeys:[NSColor colorFromHexString:LEDCOLOR], NSForegroundColorAttributeName, _ledFont, NSFontAttributeName, nil];
        
        _ampmFont = [NSFont fontWithName:LEDFONT size:24];
        _ampmAttr = [NSDictionary dictionaryWithObjectsAndKeys:[NSColor colorFromHexString:LEDCOLOR], NSForegroundColorAttributeName, _ampmFont, NSFontAttributeName, nil];

        _formatter = [[NSDateFormatter alloc] init];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    BOOL    is24hour = NO;
    BOOL    drawBox = YES;
    
    NSDate *d = [NSDate date];
    int hour = [d hour];
    NSString *ampm = (hour > 12) ? [_formatter PMSymbol] : [_formatter AMSymbol];
    
    // Convert to 12 hour time
    if (is24hour == NO) {
        hour = ((hour == 0 || hour == 12) ? 12 : hour % 12);
    }

    // Format the string
    NSString *time = [NSString stringWithFormat:@"%d %.2d", hour, [d minute]];
    
    // Get some font stuff
    CGFloat capHeight = [_ledFont capHeight];
    NSRect boundingRect = [_ledFont boundingRectForGlyph:'0'];
    
    [super drawRect:dirtyRect];

    if (drawBox == YES) {
        NSRect boxRect = {
            { 0, self.bounds.size.height / 2 - ( capHeight / 2) - BOXPADDING },
            { self.bounds.size.width, capHeight + ( 2 * BOXPADDING )}
        };
        
        [[NSColor colorFromHexString:@"#333333"] set];
        NSRectFill(boxRect);
    }
    
    NSPoint p = { -8 , 0 };
    p.y = (self.bounds.size.height / 2) - ( capHeight / 2) + [_ledFont descender];
    if (hour < 10) {
        p.x = 15;    // Adjustment for single digit hour
    }

    [time drawAtPoint:p withAttributes:_strAttr];

    // Draw colon
    if ([d second] % 2 == 0) {
        NSRect r = { { (boundingRect.size.width + 8), p.y + (capHeight / 2) + 10 }, { 5, 5 } };
        
        [[NSColor colorFromHexString:LEDCOLOR] setFill];
        NSRectFill(r);
        
        r.origin.y = r.origin.y - 10;
        NSRectFill(r);
    }

    // Draw AM/PM
    p.x = 96;
    if ([d hour] > 12) {
        p.y = p.y + 5;  // PM
    }
    else {
        p.y = p.y + (capHeight / 2) + 5;
    }
    [ampm drawAtPoint:p withAttributes:_ampmAttr];
}

- (NSTimeInterval)timeInterval {
    return 1.0;
}

@end
