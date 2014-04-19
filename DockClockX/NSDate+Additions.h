//
//  NSDate+Additions.h
//  DockClockX
//
//  Created by Brian on 9/27/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSDate (NSDate_Additions)

- (int)day;
- (int)hour;
- (int)minute;
- (int)second;
- (int)month;
- (int)year;

- (NSString *)stringUsingFormat:(NSString *)format;



@end
