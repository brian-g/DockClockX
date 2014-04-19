//
//  NSColor+ColorExtentions.m
//  DockClockX
//
//  Created by Brian on 4/18/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import "NSColor+ColorExtentions.h"

@implementation NSColor (ColorExtentions)

+ (NSColor *)colorFromHexString:(NSString *)hexColor {
    NSScanner *scanner;
    unsigned int color;
    
    scanner = [NSScanner scannerWithString:hexColor];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    if ([scanner scanHexInt:&color])
        return [self colorFromInt:color];
    else
        return [self blackColor];
}

+ (NSColor *)colorFromInt:(unsigned int)color {
    CGFloat r, g, b;
    
    r = ((CGFloat)((color & 0xFF0000) >> 16)) / 255.0;
    g = ((CGFloat)((color & 0x00FF00) >> 8)) / 255.0;
    b = ((CGFloat)(color & 0x0000FF)) / 255.0;
    
    return [self colorWithDeviceRed:r green:g blue:b alpha:1.0];
}

@end
