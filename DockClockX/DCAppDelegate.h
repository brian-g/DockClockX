//
//  DCAppDelegate.h
//  DockClockX
//
//  Created by Brian on 4/15/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSWindow *aboutBox;
@property (strong) IBOutlet NSWindow *prefPane;
- (IBAction)showAboutBox:(id)sender;
- (IBAction)showPreference:(id)sender;


@end
