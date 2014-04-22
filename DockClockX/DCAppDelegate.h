//
//  DCAppDelegate.h
//  DockClockX
//
//  Created by Brian on 4/15/14.
//  Copyright (c) 2014 Brian Glaeske. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DCClockView.h"

@interface DCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSWindow *aboutBox;
@property (strong) IBOutlet NSWindow *prefPane;
@property (strong) NSMenu *dockMenu;
@property (readonly) DCClockView *currentClock;


- (IBAction)showAboutBox:(id)sender;
- (IBAction)showPreference:(id)sender;

@end

