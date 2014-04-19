//
//  NSColor+ColorExtentions.h
//  DockClockX
//
//  Created by Brian on 4/18/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (ColorExtentions)

+ (NSColor *)colorFromHexString:(NSString *)hexColor;
+ (NSColor *)colorFromInt:(unsigned int)color;

@end
