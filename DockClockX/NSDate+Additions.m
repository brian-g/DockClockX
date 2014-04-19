//
//  NSDate+Additions.m
//  DockClockX
//
//  Created by Brian on 9/27/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Additions.h"

static NSCalendar *c = nil;

@implementation NSDate (NSDate_Additions)

void init_statics(void)
{
	if (c == nil)
	{
		c = [NSCalendar autoupdatingCurrentCalendar];
	}
}

- (int)day
{
    init_statics();
	return (int)[[c components:(NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit) fromDate:self]
				day];

}

- (int)hour
{
    init_statics();
	return (int)[[c components:(NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit) fromDate:self]
		hour];
}

- (int)minute
{
    init_statics();
	return (int)[[c components:(NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit) fromDate:self]
		minute];
}

- (int)second
{
    init_statics();
	return (int)[[c components:(NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit) fromDate:self]
		second];
}

- (int)month
{
    init_statics();
	return (int)[[c components:(NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit) fromDate:self]
		month];
}

- (int)year
{
    init_statics();
	return (int)[[c components:(NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit) fromDate:self]
		year];
}

- (NSString *)stringUsingFormat:(NSString *)format
{
	return [self descriptionWithCalendarFormat:format timeZone:nil locale:nil];
}

@end
