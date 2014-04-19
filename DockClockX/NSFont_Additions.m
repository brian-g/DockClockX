//
//  NSFont+Additions.m
//  DockClockX
//
//  Created by Brian on 1/8/05.
//  Copyright 2005 Brian Glaeske. All rights reserved.
//

#import "NSFont_Additions.h"


@implementation NSFont (NSFont_Additions)

+ (void)activateFontFromFile:(NSURL *)path
{
    CFErrorRef err;
    
    if (CTFontManagerIsSupportedFont((CFURLRef)path)) {
        if (!CTFontManagerRegisterFontsForURL((CFURLRef)path, kCTFontManagerScopeProcess, &err))
        {
            NSLog(@"Couldn't load font");
        }
    }
}

@end
